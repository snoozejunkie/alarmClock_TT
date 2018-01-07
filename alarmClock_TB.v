`timescale 1ns / 1ps
//`timescale 1s / 1ms

module alarmClock_TB;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire [6:0] display_minute_LSB;
	wire [6:0] display_minute_MSB;
	wire [6:0] display_hour_LSB;
	wire [6:0] display_hour_MSB;

	// Instantiate the Unit Under Test (UUT)
	alarmClock uut (
		.clock(clock), 
		.reset(reset), 
		.display_minute_LSB(display_minute_LSB), 
		.display_minute_MSB(display_minute_MSB), 
		.display_hour_LSB(display_hour_LSB), 
		.display_hour_MSB(display_hour_MSB)
	);
	
	initial begin
		clock = 0;
		forever begin
			# 4 clock = ~clock;
		end
	end
	
	initial begin
		// Initialize Inputs
		reset = 0;
      #10 reset = 1;
		#10 reset = 0;
		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
      
endmodule

