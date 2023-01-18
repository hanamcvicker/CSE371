// The inputs are the clock and reset, as well as inner and outer, the
// sensor inputs. The outputs are enter and exit, which are true if a car is either 
// entering or exiting the parking lot. 

module carDetect(clk, reset, outer, inner, enter, exit);
	input logic clk, reset;
	input logic outer, inner;
	output logic enter, exit;
	 
	//set states equal to bits
	enum {start, outerBlock, bothBlocked, innerBlock} ps, ns;
	 
	// FSM
	always_comb begin
		case (ps)
		
		start: 		if (~outer & inner) ns = innerBlock;
						else if (outer & ~inner) ns = outerBlock; 
						else ns = start; 
			
		outerBlock: if (~outer & ~inner) ns = start; 
		                else if (outer & inner) ns = bothBlocked;
						else ns = outerBlock; 
		
		bothBlocked: if (outer & ~inner) ns = outerBlock;
						 else if (~outer & inner) ns = innerBlock; 
						 else ns = bothBlocked;
		
		innerBlock: if (~outer & ~inner) ns = start; 
						  else if (outer & inner) ns = bothBlocked;
						  else ns = innerBlock; 
		endcase
	end
 
	// DFF
		always_ff @(posedge clk) begin
			if (reset)
				ps <= start;
			else
				ps <= ns;
		end

	// If present state is both  and ns is outer block or inner block
	assign enter = ((ps == bothBlocked) & (ns == innerBlock));
	assign exit = ((ps == bothBlocked) & (ns == outerBlock));
	 
endmodule
 
module carDetect_testbench();
	logic clk, reset, outer, inner, enter, exit;
	logic [4:0] count;

	carDetect dut (.clk, .reset, .outer, .inner, .enter, .exit);

	 // Set up a simulated clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end

	 // Set up the inputs to the design. Each line is a clock cycle.
	initial begin
																					@(posedge clk);
		reset <= 1; 																@(posedge clk);
		reset <= 0; inner <= 0; outer <= 0;									@(posedge clk);

		//entering
		outer <= 1;																   @(posedge clk);
																						@(posedge clk);
		inner <= 1;																	@(posedge clk);
																						@(posedge clk);																	
		outer <= 0;																	@(posedge clk);
																						@(posedge clk);																	
		inner <= 0;																	@(posedge clk);																	
		reset <= 1;													repeat(3)	@(posedge clk);

		//exiting																	
		reset <= 1; 																@(posedge clk);
																						@(posedge clk);
		reset <= 0; inner <= 0; outer <= 0;									@(posedge clk);
																						@(posedge clk);
		inner <= 1;																   @(posedge clk);
																						@(posedge clk);
		outer <= 1;																	@(posedge clk);
																						@(posedge clk);																	
		inner <= 0;																	@(posedge clk);
																						@(posedge clk);																	
		outer <= 0;																	@(posedge clk);																	

	$stop;
	end
endmodule
