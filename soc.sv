module soc (
    output logic[7:0]  led,
    input  logic[6:0]  btn,
    input  logic       clk_25mhz
);

logic[31:0] Instruction;
logic[31:0] CurrentPC;
logic[31:0] DAddr;
logic[31:0] RData;
logic[31:0] WData;
logic[31:0] NextPC;
logic[4:0]  Rs1;
logic[4:0]  Rs2;
logic[4:0]  Rd;
logic[31:0] RRs1;
logic[31:0] RRs2;
logic[31:0] WRd;
logic       WrReg;
logic[1:0]  DWidth;
logic       RdMem;
logic       WrMem;
logic       Illegal;
logic       clk;
logic       reset_btn;
logic       reset;
logic       clk12p5;

assign led[7:2]  = NextPC[7:2];
assign led[1]    = WrMem;
assign led[0]    = Illegal;
assign clk       = clk12p5;
assign reset_btn = ~btn[0];

always_ff @(posedge clk_25mhz) begin
    clk12p5 <= ~clk12p5;   
end

always_ff @(posedge clk12p5) begin
    reset <= reset_btn;
end

decoder theDecoder (
    .Instruction(Instruction),
    .CurrentPC(CurrentPC),
    .DAddr(DAddr),
    .RData(RData),
    .WData(WData),
    .NextPC(NextPC),
    .Rs1(Rs1),
    .Rs2(Rs2),
    .Rd(Rd),
    .RRs1(RRs1),
    .RRs2(RRs2),
    .WRd(WRd),
    .WrReg(WrReg),
    .DWidth(DWidth),
    .RdMem(RdMem),
    .WrMem(WrMem),
    .Illegal(Illegal),
    .reset(reset)
);

reg_file theRegisters (
    .Rs1(Rs1),
    .Rs2(Rs2),
    .Rd(Rd),
    .RRs1(RRs1),
    .RRs2(RRs2),
    .WRd(WRd),
    .WrReg(WrReg),
    .clk(clk)
);

pc thePC (
    .CurrentPC(CurrentPC),
    .NextPC(NextPC),
    .reset(reset),
    .clk(clk)
);

main_mem #(
    .MEM_INIT_FILE("p1.hex")
) theMem (
    .DAddr(DAddr),
    .IAddr(NextPC),
    .DWData(WData),
    .DRData(RData),
    .IRData(Instruction),
    .DWE(WrMem),
    .DWidth(DWidth),
    .clk(clk)
);

endmodule