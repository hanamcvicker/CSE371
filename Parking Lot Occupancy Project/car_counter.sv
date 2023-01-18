// The inputs are the clock and reset, as well as increase and decrease,
// which are true if the number of cars increases or decreases.
// The output is the count, which is the number of cars currently in the lot. 

module car_counter (clk, reset, incr, decr, count); 

	input logic clk, reset, incr, decr;
	output logic [4:0] count;
	
	logic [4:0] ns;
		
	always_ff @(posedge clk) begin
		if (reset)
			count <= 5'b0;
		else if (incr & (count < 5'b10000))
			count <= count + 5'b1;
		else if (decr & (count > 5'b0))
			count <= count - 5'b1;
	end
	
endmodule


module car_counter_testbench();

	logic clk, reset, incr, decr;
	logic [4:0] count;
	
	logic [4:0] ns;
					
	 car_counter dut (.clk, .reset, .incr, .decr, .count);
	
	
	// Set up a simulated clock.   
	parameter CLOCK_PERIOD=100;  
	initial begin  
		clk <= 0;  
		forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock 
	end  
   
	// Set up the inputs to the design.  Each line is a clock cycle.  
	initial begin
											@(posedge clk);
				reset <= 1;				@(posedge clk);
				reset <= 0;				@(posedge clk);
				incr = 0;	decr = 0;@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
				incr = 1;				@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
								decr = 1;@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
				incr = 0;				@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
		$stop; // End the simulation.  
	end

endmodule