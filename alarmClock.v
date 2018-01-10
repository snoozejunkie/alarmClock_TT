// original timescale
//`timescale 1ns / 1ps //

// timescale for alarm clock to see second/minute
`timescale 1s / 1ms

module alarmClock(
	input clock,
	input reset,
	output [6:0] display_minute_LSB,
	output [6:0] display_minute_MSB,
	output [6:0] display_hour_LSB,
	output [6:0] display_hour_MSB
    );

//


reg [6:0] count_second; //max = 60
reg [6:0] count_minute; //max = 60
reg [6:0] count_hour; //max = 24

wire [3:0] reg_minute_MSB;
wire [3:0] reg_minute_LSB;
wire [3:0] reg_hour_MSB;
wire [3:0] reg_hour_LSB;

//assign wire=reg

// ----- clocks for clock and setting clock/alarm //
wire clock_1_second;
wire clock_quarter_second;
// ---------------------------------------------- //

numberToDigits n1(.binaryNumber(count_minute),.digit_MSB(reg_minute_MSB),.digit_LSB(reg_minute_LSB));
numberToDigits n2(.binaryNumber(count_hour),.digit_MSB(reg_hour_MSB),.digit_LSB(reg_hour_LSB));

decodeTo7Segment d1(.numberToDecode(reg_minute_MSB),.digitLeds(display_minute_MSB));
decodeTo7Segment d2(.numberToDecode(reg_minute_LSB),.digitLeds(display_minute_LSB));
decodeTo7Segment d3(.numberToDecode(reg_hour_MSB),.digitLeds(display_hour_MSB));
decodeTo7Segment d4(.numberToDecode(reg_hour_LSB),.digitLeds(display_hour_LSB));


generateClocks g(.clock(clock),.reset(reset),.clock_1_second(clock_1_second),.clock_quarter_second(clock_quarter_second));
//input clock,
//input reset,
//output reg clock_1_second,
//output reg clock_quarter_second

// Divide clock from 50 MHz to 1 Hz (1 sec) //

/*always@(posedge clock)
	begin
		if(reset) 
			begin
			clock_divider <= 0;
			end
		else
			clock_divider <= clock_divider + 1;

	end
	
// 1 sec clock
assign clock_1_second = clock_divider[25];
*/

//faster clock for test bench  
//assign clock_1_second = clock_divider[0];   

// 2^26 > 50Mhz -> log2(5e7)=25.5754
// ---------------------------------------- //


// ----------- Counter for alarm ---------- //
initial count_second <= 0;
initial count_minute <= 0;
initial count_hour <= 0;

//assign reg_local = input1;

always@(posedge clock_1_second) 
	begin
		if(reset)		
			begin
				count_second <= 0;
				count_minute <= 0;
				count_hour <= 0;	
			end	
		else
			begin
				count_second <= count_second + 1;
				if (count_second == 59)
					begin
						count_second <= 0;
						count_minute <= count_minute + 1;
					end
				if (count_minute == 59 && count_second == 59)
					begin
						count_minute <= 0;
						count_hour <= count_hour + 1;
					end
				if (count_hour == 23 && count_minute == 59 && count_second == 59)
					begin
						count_hour <= 0;
					end	
			end	
	end

endmodule
