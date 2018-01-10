`timescale 1ns / 1ps

module generateClocks(
input clock,
input reset,
output reg clock_1_second,
output reg clock_quarter_second
    );

reg [27:0] count_clock_1_second;
reg [27:0] count_clock_quarter_second;

initial count_clock_1_second <= 0;
initial count_clock_quarter_second <= 0;
initial clock_1_second <= 0;
initial clock_quarter_second <= 0;


always@(posedge clock)
	begin
	
		if(reset) begin
			count_clock_1_second <= 0;
			clock_1_second <= 0;
		end	
		else begin
			count_clock_1_second <= count_clock_1_second + 1;
			if (count_clock_1_second == 25000000) begin
				count_clock_1_second <= 0;
				clock_1_second <= ~clock_1_second;
			end
		end
		
	end

always@(posedge clock)
	begin
	
		if(reset) begin
			count_clock_quarter_second <= 0;
			clock_quarter_second <= 0;
		end	
		else begin
			count_clock_quarter_second <= count_clock_quarter_second + 1;
			if (count_clock_quarter_second == 6250000) begin
				count_clock_quarter_second <= 0;
				clock_quarter_second <= ~clock_quarter_second;
			end
		end
		
	end
	

endmodule
