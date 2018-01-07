`timescale 1ns / 1ps

module decodeTo7Segment(
	input [3:0] numberToDecode,
	output reg [6:0] digitLeds
    );


parameter ZERO = 7'b0000001;
parameter ONE = 7'b1001111;
parameter TWO = 7'b0010010;
parameter THREE = 7'b0000110;
parameter FOUR = 7'b1001100;
parameter FIVE = 7'b0100100;
parameter SIX = 7'b0100000;
parameter SEVEN = 7'b0001111;
parameter EIGHT = 7'b0000000;
parameter NINE = 7'b0000100;
parameter showMiddleLed = 7'b0000001;
//parameter ZERO = 7'b0000001; // 0
//parameter ONE = 7'b1001111; // 1
//parameter TWO = 7'b0010010; // 2
//parameter THREE = 7'b0000110; // 3
//parameter FOUR = 7'b1001100; // 4
//parameter FIVE = 7'b1101000; // 5
//parameter SIX = 7'b0100000; // 6
//parameter SEVEN = 7'b1000111; // 7 
//parameter EIGHT = 7'b0000000; // 8 
//parameter NINE = 7'b0000100; // 9 
//reg [6:0] digitLeds;

always @ (numberToDecode)

	begin

		case(numberToDecode)
		
			//0: digitLeds = 7'b0000001;
			//1: digitLeds = 7'b1001111;
			//2: digitLeds = 7'b0010010;
			//3: digitLeds = 7'b0000110;
			//4: digitLeds = 7'b1001100;
			//5: digitLeds = 7'b0100100;
			//6: digitLeds = 7'b0100000;
			//7: digitLeds = 7'b0001111;
			//8: digitLeds = 7'b0000000;
			//9: digitLeds = 7'b0000100;
			//default:digitLeds = 7'b0000000;		
			
			0: digitLeds = ZERO;
			1: digitLeds = ONE;
			2: digitLeds = TWO;
			3: digitLeds = THREE;
			4: digitLeds = FOUR;
		   5: digitLeds = FIVE;
			6: digitLeds = SIX;
			7: digitLeds = SEVEN;
			8: digitLeds = EIGHT;
			9: digitLeds = NINE;
			
			default:digitLeds = showMiddleLed;
			
		endcase

	end

endmodule
