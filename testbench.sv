`timescale 1ns / 1ps

module alu_registered_tb;

    // inputs — we drive these
    reg        clk;
    reg        rst;
    reg  [3:0] A;
    reg  [3:0] B;
    reg  [2:0] op;

    // outputs — we observe these
    wire [3:0] Q;
    wire       zero_q;

    // connect testbench to module
    alu_registered uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .op(op),
        .Q(Q),
        .zero_q(zero_q)
    );

    // clock generator
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("alu_reg.vcd");
        $dumpvars(0, alu_registered_tb);

        // reset
        rst = 1; A = 0; B = 0; op = 0;
        #10;
        $display("RST: Q = %b | zero_q = %b", Q, zero_q);

        // ADD 3+5=8
        rst = 0; A = 4'b0011; B = 4'b0101; op = 3'b000;
        #10;
        $display("ADD: %b + %b = %b | zero_q = %b", A, B, Q, zero_q);

        // SUB 7-3=4
        A = 4'b0111; B = 4'b0011; op = 3'b001;
        #10;
        $display("SUB: %b - %b = %b | zero_q = %b", A, B, Q, zero_q);

        // XOR
        A = 4'b1100; B = 4'b1010; op = 3'b100;
        #10;
        $display("XOR: %b ^ %b = %b | zero_q = %b", A, B, Q, zero_q);

        // zero flag test
        A = 4'b0000; B = 4'b0000; op = 3'b000;
        #10;
        $display("ZERO: %b + %b = %b | zero_q = %b", A, B, Q, zero_q);

        $finish;
    end

endmodule