module main_mem #(
    ABits = 13,
    MEM_INIT_FILE = ""
) (
    input  logic[31:0] DAddr,
    input  logic[31:0] IAddr,
    input  logic[31:0] DWData,
    output logic[31:0] DRData,
    output logic[31:0] IRData,
    input  logic DWE,
    input  logic [1:0] DWidth,
    input  logic clk
);

localparam logic[1:0] _byte   = 2'b00;
localparam logic[1:0] _half   = 2'b01;
localparam logic[1:0] _word   = 2'b10;

logic[31:0] RAM[2**(ABits-2)-1:0];
logic[31:0] drTmp;

initial begin
    if (MEM_INIT_FILE != "") begin
        $readmemh(MEM_INIT_FILE, RAM);
    end
end

always_ff @(negedge clk) begin
    if (DWE) begin
        // RAM[DAddr[(ABits-1):2]] <= DWData;
        case (DWidth)
            _word: 
                RAM[DAddr[(ABits-1):2]] <= DWData;
            _half: 
                case (DAddr[1])
                    0: RAM[DAddr[(ABits-1):2]][31:16] <= DWData[15:0];
                    1: RAM[DAddr[(ABits-1):2]][15: 0] <= DWData[15:0];
                endcase
            _byte:
                case (DAddr[1:0])
                    2'b00: RAM[DAddr[(ABits-1):2]][31:24] <= DWData[7:0];
                    2'b01: RAM[DAddr[(ABits-1):2]][23:16] <= DWData[7:0];
                    2'b10: RAM[DAddr[(ABits-1):2]][15: 8] <= DWData[7:0];
                    2'b11: RAM[DAddr[(ABits-1):2]][ 7: 0] <= DWData[7:0];
                endcase
            default: ;               
        endcase
    end
end

always_ff @(negedge clk) begin
    drTmp <= RAM[DAddr[(ABits-1):2]];
end

always_comb begin
    case (DWidth)
        _word: 
            DRData = drTmp;
        _half: 
            case (DAddr[1])
                0: DRData = {16'b0, drTmp[31:16]};
                1: DRData = {16'b0, drTmp[15: 0]};
            endcase
        _byte:
            case (DAddr[1:0])
                2'b00: DRData = {24'b0, drTmp[31:24]};
                2'b01: DRData = {24'b0, drTmp[23:16]};
                2'b10: DRData = {24'b0, drTmp[15: 8]};
                2'b11: DRData = {24'b0, drTmp[ 7: 0]};
            endcase
        default: DRData = 0;               
    endcase
end

always_ff @(posedge clk) begin
    IRData <= RAM[IAddr[(ABits-1):2]];
end

endmodule