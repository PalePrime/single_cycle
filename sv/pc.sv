module pc (
    output logic[31:0] CurrentPC,
    input  logic[31:0] NextPC,
    input  logic       reset,
    input  logic       clk
);

always_ff @(posedge clk) begin
    if (reset) CurrentPC <= 0;
    else       CurrentPC <= NextPC;    
end

endmodule