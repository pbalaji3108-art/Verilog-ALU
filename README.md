Verilog Operands

In module

    3'b000: result = A + B;

In testbench

    A = 4'b0011; B = 4'b0101; op = 3'b000; #10;

    $display("ADD: %b + %b = %b | zero=%b", A, B, result, zero);


1. 000 -> ADD (A+B)
2. 001 -> SUB (A-B)
3. 010 -> AND (A&B)
4. 011 -> OR (A|B)
5. 100 -> XOR (A^B)
6. 101 -> LEFT SHIFT (A<<1)
7. 110 -> RIGHT SHIFT (A>>1)
