module decoder (
    input  logic[31:0] Instruction,
    input  logic[31:0] CurrentPC,
    output logic[31:0] DAddr,
    input  logic[31:0] RData,
    output logic[31:0] WData,
    output logic[31:0] NextPC,
    output logic[4:0]  Rs1,
    output logic[4:0]  Rs2,
    output logic[4:0]  Rd,
    input  logic[31:0] RRs1,
    input  logic[31:0] RRs2,
    output logic[31:0] WRd,
    output logic       WrReg,
    output logic[1:0]  DWidth,
    output logic       RdMem,
    output logic       WrMem,
    output logic       Illegal,
    input  logic       reset
);

localparam logic[6:0] opLd     = 7'b0000011;
localparam logic[6:0] opAluImm = 7'b0010011;
localparam logic[6:0] opUpPC   = 7'b0010111;
localparam logic[6:0] opSt     = 7'b0100011;
localparam logic[6:0] opAlu    = 7'b0110011;
localparam logic[6:0] opUpImm  = 7'b0110111;
localparam logic[6:0] opBranch = 7'b1100011;
localparam logic[6:0] opJALR   = 7'b1100111;
localparam logic[6:0] opJAL    = 7'b1101111;

localparam logic[6:0] f7neg    = 7'b0100000;

localparam logic[2:0] f3byte   = 3'b000;
localparam logic[2:0] f3half   = 3'b001;
localparam logic[2:0] f3word   = 3'b010;
localparam logic[2:0] f3byteU  = 3'b100;
localparam logic[2:0] f3halfU  = 3'b101;

localparam logic[2:0] f3add    = 3'b000;
localparam logic[2:0] f3sl     = 3'b001;
localparam logic[2:0] f3slt    = 3'b010;
localparam logic[2:0] f3sltU   = 3'b011;
localparam logic[2:0] f3xor    = 3'b100;
localparam logic[2:0] f3sr     = 3'b101;
localparam logic[2:0] f3or     = 3'b110;
localparam logic[2:0] f3and    = 3'b111;

localparam logic[2:0] f3beq    = 3'b000;
localparam logic[2:0] f3bne    = 3'b001;
localparam logic[2:0] f3blt    = 3'b100;
localparam logic[2:0] f3bge    = 3'b101;
localparam logic[2:0] f3bltU   = 3'b110;
localparam logic[2:0] f3bgeU   = 3'b111;

logic[6:0]  theOp;
logic[2:0]  theFunct3;
logic[6:0]  theFunct7;
logic[31:0] i_imm;
logic[31:0] s_imm;
logic[31:0] b_imm;
logic[31:0] u_imm;
logic[31:0] j_imm;

logic[2:0]  aluOp;
logic       aluNegAr;
logic       aluBypass;
logic[31:0] op1;
logic[31:0] op2;
logic[31:0] result;
logic       eqFlag;

logic[31:0] targetPC;
logic       brOnEq;
logic       brOnNe;
logic       brOnLt;
logic       brOnGt;
logic       doJump;
logic       doBranch;

assign theOp     = Instruction[6:0];
assign theFunct3 = Instruction[14:12];
assign theFunct7 = Instruction[31:25];

assign Rs1   = Instruction[19:15];
assign Rs2   = Instruction[24:20];
assign Rd    = Instruction[11:7];

always_comb begin : Immediate_Generator
    i_imm = {{21{Instruction[31]}}, Instruction[30:20]};
    s_imm = {{21{Instruction[31]}}, Instruction[30:25], Instruction[11:7]};
    b_imm = {{20{Instruction[31]}}, Instruction[7], Instruction[30:25], Instruction[11:8], 1'b0};
    u_imm = {Instruction[31:12], 12'b0};
    j_imm = {{12{Instruction[31]}}, Instruction[19:12], Instruction[20], Instruction[30:21], 1'b0};    
end

always_comb begin : Main_Decoder
    WrReg     = 1;
    WrMem     = 0;
    RdMem     = 0;
    DWidth    = f3word[1:0];
    Illegal   = 0;
    targetPC  = 0;
    doJump    = 0;
    aluOp     = theFunct3;
    aluNegAr  = 0;
    aluBypass = 0;
    brOnEq    = 0;
    brOnNe    = 0;
    brOnLt    = 0;
    brOnGt    = 0;
    op1       = RRs1;
    op2       = RRs2;
    DAddr     = 0;
    WData     = RRs2;
    case(theOp)
        opLd: begin
            RdMem = 1;
            DAddr = RRs1 + i_imm;
            DWidth = theFunct3[1:0];
            aluBypass = 1;
            op1 = RData;
            case(theFunct3)
                f3byte:  op1[31:8]  = {24{RData[7]}};
                f3byteU: op1[31:8]  = {24{1'b0}};
                f3half:  op1[31:16] = {16{RData[15]}};
                f3halfU: op1[31:16] = {16{1'b0}};
                f3word:  ;
                default: Illegal = 1;
            endcase
        end
        opAluImm: begin
            op2 = i_imm;
            aluOp = theFunct3;
            aluNegAr = (theFunct7 == f7neg) & (theFunct3 == f3sr);
        end
        opUpPC: begin
            op1 = u_imm;
            op2 = CurrentPC;
            aluOp = f3add;
        end
        opSt: begin
            WrReg = 0;
            WrMem = 1;
            DAddr = RRs1 + s_imm;
            DWidth = theFunct3[1:0];
        end
        opAlu: begin
            aluOp = theFunct3;
            aluNegAr = (theFunct7 == f7neg) & ((theFunct3 == f3add) | (theFunct3 == f3sr));
        end
        opUpImm: begin
            op1 = u_imm;
            aluBypass = 1;
        end
        opBranch: begin
            WrReg = 0;
            targetPC = CurrentPC + b_imm;
            aluOp = f3slt;
            brOnEq = 0;
            case(theFunct3)
                f3beq: begin brOnEq = 1; end
                f3bne: begin brOnNe = 1; end
                f3blt: begin brOnLt = 1; end
                f3bge: begin brOnGt = 1; brOnEq = 1; end
                f3bltU: begin aluOp = f3sltU; brOnLt = 1; end
                f3bgeU: begin aluOp = f3sltU; brOnGt = 1; brOnEq = 1; end
                default: Illegal = 1;
            endcase    
        end
        opJALR: begin
            doJump = 1;
            targetPC = RRs1 + i_imm;
            op1 = CurrentPC;
            op2 = 4;
            aluOp = f3add;
        end
        opJAL: begin
            doJump = 1;
            targetPC = CurrentPC + j_imm;
            op1 = CurrentPC;
            op2 = 4;
            aluOp = f3add;
        end
        default: begin
            Illegal = 1;
            WrReg = 0;
        end
    endcase
end

always_comb begin : ALU
    eqFlag = op1 == op2;
    if (aluBypass) result = op1;
    else case(aluOp)
        f3add:  result = aluNegAr ? op1 - op2 : op1 + op2;
        f3sl:   result = op1 << op2[4:0];
        f3slt:  result = {31'b0, $signed(op1) < $signed(op2)};
        f3sltU: result = {31'b0, $unsigned(op1) < $unsigned(op2)};
        f3xor:  result = op1 ^ op2;
        f3sr:   result = aluNegAr ? op1 >>> op2[4:0] : op1 >> op2[4:0];
        f3or:   result = op1 | op2;
        f3and:  result = op1 & op2;
    endcase
    WRd = result;
end

always_comb begin : Check_Branch
    doBranch = 0;
    if (theOp == opBranch)
        doBranch = (brOnEq & eqFlag) | (brOnNe & ~eqFlag) | (brOnLt & result[0]) | (brOnGt & ~result[0]);
end

always_comb begin : Next_PC
    if (reset) NextPC = 0;
    else if (doJump | doBranch) NextPC = targetPC;
    else NextPC = CurrentPC + 4;
end

endmodule