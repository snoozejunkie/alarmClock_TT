`timescale 1ns / 1ps

module numberToDigits(
	input [6:0] binaryNumber,
	output reg [3:0] digit_MSB,
	output reg [3:0] digit_LSB
    );
	 
integer i;

always@(binaryNumber)

	begin

		digit_LSB = 0;
		digit_MSB = 0;
		
		for(i=6; i>=0;i=i-1)
		
			begin
			
				if (digit_MSB>=5)
					
					digit_MSB = digit_MSB + 3;
					
				if (digit_LSB>=5)
					
					digit_LSB = digit_LSB + 3;
				
				digit_MSB = digit_MSB << 1;
				digit_MSB[0] = digit_LSB[3];
				digit_LSB = digit_LSB << 1;
				digit_LSB[0] = binaryNumber[i];
				
			end
		
	end

endmodule
