/* The top-level module of the parking lot counter. 
 * The inputs are connected to switches (outer - GPIO_0[5], inner - GPIO_0[6], reset - GPIO_0[7]).
 * The outputs are connected to the GPIO_O LEDs (GPIO_0[26] & GPIO_0[27]) and the HEXs.
 */
module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, GPIO_0);
	input logic CLOCK_50;
	
	output logic [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	inout logic [33:0] GPIO_0;

	logic reset;
	logic outer;
	logic inner;
	
	assign outer = GPIO_0[5]; // outer input
	assign inner = GPIO_0[6]; // inner input
	assign reset = GPIO_0[7]; // reset

	
	// Assign LED to switch
	assign GPIO_0[26] = GPIO_0[5]; 
	assign GPIO_0[27] = GPIO_0[6]; 
	
	logic [31:0] div_clk;    
	parameter whichClock = 23; 
	clock_divider cdiv (.clock(CLOCK_50),  
							  .reset(reset),  							  
							  .divided_clocks(div_clk));   
	  
	//  Clock  selection;  allows  for  easy  switching  between  simulation  and  board clocks 
	logic clkSelect; 
	
	// Uncomment ONE of the following two lines depending on intention 
	  
	//assign clkSelect = CLOCK_50;          // for simulation 
	assign clkSelect = div_clk[whichClock]; // for board 

   logic [4:0] count; 
   logic enter, exit;
	
	parking_lot_occupancy plo (.clk(clkSelect), .reset, .count, .outer, .inner);
   lot_display ld (.clk(clkSelect), .count, .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5);

endmodule  // DE1_SoC


/* testbench for the DE1_SoC */
module DE1_SoC_testbench();
    logic CLOCK_50;
   logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 
    // inout pins must be connected to a wire type 
   wire  [33:0] GPIO_0; 
   // additional logic required to simulate inout pins 
   logic [33:0] GPIO_0_in; 
   logic [33:0] GPIO_0_dir;  // 1 = input, 0 = output 


    // set up tristate buffers for inout pins 
   genvar i; 
   generate 
      for (i = 0; i < 34; i++) begin : gpio 
         assign GPIO_0[i] = GPIO_0_dir[i] ? GPIO_0_in[i] : 1'bZ; 
      end 
   endgenerate 

    // using SystemVerilog's implicit port connection syntax for brevity
    DE1_SoC dut (.CLOCK_50, .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .GPIO_0);

    //Set up a clock
    parameter CLOCK_PERIOD=100;
        initial begin
        CLOCK_50 <= 0;
        forever #(CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50; // Forever toggle the clock 
   end 


     initial begin 
      // you only need to set the pin directions once 
      GPIO_0_dir[6]  = 1'b1; 
      GPIO_0_dir[26] = 1'b0; 
        GPIO_0_dir[5]  = 1'b1; 
      GPIO_0_dir[27] = 1'b0; 
      // manipulate the GPIO_0 input bits indirectly through GPIO_0_in 
       GPIO_0_in[6] = 1'b1; GPIO_0_in[5] = 1'b1; #50; 
        GPIO_0_in[6] = 1'b0; GPIO_0_in[5] = 1'b1; #50;
        GPIO_0_in[6] = 1'b1; GPIO_0_in[5] = 1'b0; #50;
        GPIO_0_in[6] = 1'b0; GPIO_0_in[5] = 1'b0; #50;

   end

endmodule  // DE1_SoC_testbench