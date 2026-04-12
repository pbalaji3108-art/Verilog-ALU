Project: 4-bit ALU  |  Language: Verilog  |  Tool: EDA Playground (Icarus Verilog 12.0)

Keywords need to know / used in this project

Module - what the hardware does.

Testbench - proof that it does it correectly

(Check branches for specific programs)

Reg - Holds a value

Wire - used for outputs to just observe

always @(*) - Run this block whenever ANY input signal changes (combinational)

always @(posedge clk) - Run this block only on rising clock edge

$dumpfile / $dumpvars - record all signals to a .vcd waveform file

zero - is a flag, if output result is (0000) then it shows 1; else 0.

= (blocking) — executes instantly, line by line, like normal code.

<= (non-blocking) — all assignments are scheduled and happen simultaneously at the clock edge.

Q <= 1'b0;   // set Q to 0 at the clock edge
