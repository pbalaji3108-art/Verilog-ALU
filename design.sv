module alu_4bit (
    input  [3:0] A,      // 4-bit operand A
    input  [3:0] B,      // 4-bit operand B
  	input  [2:0] op,     // operation select
 	output reg [3:0] result, // output result
    output reg zero      // high if result is 0
);

    always @(*) begin
        case (op)
            3'b000: result = A + B;   // ADD
            3'b001: result = A - B;   // SUB
            3'b010: result = A & B;   // AND
            3'b011: result = A | B;   // OR
          	3'b100: result = A ^ B;	  //XOR
          	3'b101: result = A << 1;  //left shift
          	3'b110: result = A >> 1;	  //right shift
            default: result = 4'b0000;
        endcase

      zero = (result == 4'b0000) ? 1'b1 : 1'b0;
    end

endmodule