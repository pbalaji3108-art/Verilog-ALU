Project: 4-bit ALU  |  Language: Verilog  |  Tool: EDA Playground (Icarus Verilog 12.0)

Reg - Holds a value

Wire - used for outputs to just observe

always @(*) - Run this block whenever ANY input signal changes (combinational)

always @(posedge clk) - Run this block only on rising clock edge

$dumpfile / $dumpvars - record all signals to a .vcd waveform file
