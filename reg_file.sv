module reg_file (
    input  logic[4:0]  Rs1,
    input  logic[4:0]  Rs2,
    input  logic[4:0]  Rd,
    output logic[31:0] RRs1,
    output logic[31:0] RRs2,
    input  logic[31:0] WRd,
    input  logic       WrReg,
    input  logic       clk
);

logic [31:0] registers[31:1];

assign RRs1 = Rs1 == 0 ? 0 : registers[Rs1];
assign RRs2 = Rs2 == 0 ? 0 : registers[Rs2];

always_ff @(posedge clk) begin
    if (WrReg & Rd != 0) registers[Rd] <= WRd;
end
    
endmodule