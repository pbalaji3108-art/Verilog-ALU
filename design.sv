// ── File 1: ALU ──────────────────────────────
`timescale 1ns / 1ps

module alu_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] op,
    output reg [3:0] result,
    output reg zero
);
    always @(*) begin
        case (op)
            3'b000: result = A + B;
            3'b001: result = A - B;
            3'b010: result = A & B;
            3'b011: result = A | B;
            3'b100: result = A ^ B;
            3'b101: result = A << 1;
            3'b110: result = A >> 1;
            default: result = 4'b0000;
        endcase
        zero = (result == 4'b0000) ? 1'b1 : 1'b0;
    end
endmodule

// ── File 2: Registered ALU ───────────────────
module alu_registered (
    input        clk,
    input        rst,
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] op,
    output reg [3:0] Q,
    output reg       zero_q
);
    wire [3:0] alu_result;
    wire       alu_zero;

    alu_4bit alu (
        .A(A), .B(B), .op(op),
        .result(alu_result),
        .zero(alu_zero)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Q      <= 4'b0000;
            zero_q <= 1'b0;
        end else begin
            Q      <= alu_result;
            zero_q <= alu_zero;
        end
    end
endmodule