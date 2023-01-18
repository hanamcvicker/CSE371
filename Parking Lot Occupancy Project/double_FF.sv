// D flip-flop w/synchronous reset
module double_FF (q, d, reset, clk);
	 output logic q;
	 input logic d, reset, clk;
	 logic temp;
	 
	 always_ff @(posedge clk) begin // Hold val until clock edge
	 if (reset)
		q <= 0; // On reset, set to 0
	 else
		 temp <= d;
		 q <= temp;
	 end
endmodule 

module double_FF_testbench();
	logic Clock, Reset, d, temp;
	logic q;

	double_FF dut (.clk(Clock), .reset(Reset), .d, .q);

	// Set up a simulated clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		Clock <= 0;
		forever #(CLOCK_PERIOD/2) Clock <= ~Clock;
	end

	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin

		Reset <= 1;				@(posedge Clock);								
		Reset <= 0; d <= 0; 	@(posedge Clock);
		d <= 1; 					@(posedge Clock);
									@(posedge Clock);
									@(posedge Clock);
									@(posedge Clock);
		$stop;
	end
endmodule