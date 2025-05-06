`timescale 1ns/1ns

module soc_tb ();

logic[7:0]  led;
logic[6:0]  btn;
logic       reset;
logic       clk;

soc dut (
    .led(led),
    .btn(btn),
    .clk_25mhz(clk)
);

assign btn[0] = reset;

always begin
    clk = 1; #20; clk = 0; #20;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, soc_tb);
    reset = 0; #100;
    reset = 1; #10000;
    $finish;
end
    
endmodule