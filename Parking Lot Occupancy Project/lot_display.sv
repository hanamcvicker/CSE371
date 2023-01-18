// The inputs are the clock and the number of cars in the lot.
// The outputs are the HEXs, which display the count. 

module lot_display(clk, count, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

	input logic clk;
	input logic [4:0] count;
	output logic [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	parameter	zero		= 5'b00000,
					one		= 5'b00001,
					two		= 5'b00010,
					three		= 5'b00011,
					four		= 5'b00100,
					five		= 5'b00101,
					six		= 5'b00110,
					seven		= 5'b00111,
					eight		= 5'b01000,
					nine		= 5'b01001,
					ten		= 5'b01010,
					eleven	= 5'b01011,
					twelve	= 5'b01100,
					thirteen	= 5'b01101,
					fourteen	= 5'b01110,
					fifteen	= 5'b01111,
					sixteen	= 5'b10000;
	
	always_comb begin
		case(count)
		
		5'b00000: 	begin
					HEX0 = 7'b0000001; // 0
					HEX1 = 7'b1111010; // r
					HEX2 = 7'b0001000; // A
					HEX3 = 7'b0110000; // E
					HEX4 = 7'b1110001; // L
					HEX5 = 7'b0110001; // C
					end
					
		5'b00001: 		begin
					HEX0 = 7'b1001111; // 
					HEX1 = 7'b1111111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b00010:	 	begin
					HEX0 = 7'b0010010; // 
					HEX1 = 7'b1111111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b00011: 	begin
					HEX0 = 7'b0000110; // 
					HEX1 = 7'b1111111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b00100: 	begin
					HEX0 = 7'b1001100; // 
					HEX1 = 7'b1111111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b00101: 	begin
					HEX0 = 7'b0100100; // 
					HEX1 = 7'b1111111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b00110: 		begin
					HEX0 = 7'b0100000; // 
					HEX1 = 7'b1111111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b00111: 	begin
					HEX0 = 7'b0001111; // 
					HEX1 = 7'b1111111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b01000: 	begin
					HEX0 = 7'b0000000; // 
					HEX1 = 7'b1111111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b01001: 	begin
					HEX0 = 7'b0001100; // 
					HEX1 = 7'b1111111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b01010: 		begin
					HEX0 = 7'b0000001; // 
					HEX1 = 7'b1001111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b01011: 	begin
					HEX0 = 7'b1001111; // 
					HEX1 = 7'b1001111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
		
		5'b01100: 	begin
					HEX0 = 7'b0010010; // 
					HEX1 = 7'b1001111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b01101: begin
					HEX0 = 7'b0000110; // 
					HEX1 = 7'b1001111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b01110: begin
					HEX0 = 7'b1001100; // 
					HEX1 = 7'b1001111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
					
		5'b01111: begin
					HEX0 = 7'b0100100; // 
					HEX1 = 7'b1001111; // 
					HEX2 = 7'b1111111; // 
					HEX3 = 7'b1111111; // 
					HEX4 = 7'b1111111; // 
					HEX5 = 7'b1111111; // 
					end
		
		5'b10000:	begin
					HEX0 = 7'b1111111; // off
					HEX1 = 7'b1111111; // off
					HEX2 = 7'b1001111; // l
					HEX3 = 7'b1001111; // l
					HEX4 = 7'b1100011; // u
					HEX5 = 7'b0111000; // F
					end
					
		default: begin
					HEX0 = 7'b0000001; // 0
					HEX1 = 7'b1111010; // r
					HEX2 = 7'b0001000; // A
					HEX3 = 7'b1001111; // E
					HEX4 = 7'b1110001; // L
					HEX5 = 7'b0110001; // C
					end
		endcase
	end
		
endmodule

module lot_display_testbench();

	logic clk;
	logic [4:0] count;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	parameter	zero		= 5'b00000,
					one		= 5'b00001,
					two		= 5'b00010,
					three		= 5'b00011,
					four		= 5'b00100,
					five		= 5'b00101,
					six		= 5'b00110,
					seven		= 5'b00111,
					eight		= 5'b01000,
					nine		= 5'b01001,
					ten		= 5'b01010,
					eleven	= 5'b01011,
					twelve	= 5'b01100,
					thirteen	= 5'b01101,
					fourteen	= 5'b01110,
					fifteen	= 5'b01111,
					sixteen	= 5'b10000;
					
	lot_display dut (.clk, .count, .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5);
	
	// Set up a simulated clock.   
	parameter CLOCK_PERIOD=100;  
	initial begin  
		clk <= 0;  
		forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock 
	end 
	
	initial begin
											@(posedge clk);
						count <= zero;	@(posedge clk);
											@(posedge clk);
						count <= one;	@(posedge clk);
											@(posedge clk);
						count <= two;	@(posedge clk);
											@(posedge clk);
						count <= three;	@(posedge clk);
											@(posedge clk);					
						count <= four;	@(posedge clk);
											@(posedge clk);		
						count <= five;	@(posedge clk);
											@(posedge clk);
						count <= six;	@(posedge clk);
											@(posedge clk);
						count <= seven;	@(posedge clk);
											@(posedge clk);
						count <= eight;	@(posedge clk);
											@(posedge clk);
						count <= nine;	@(posedge clk);
											@(posedge clk);
						count <= ten;	@(posedge clk);
											@(posedge clk);
						count <= eleven;	@(posedge clk);
											@(posedge clk);
						count <= twelve;	@(posedge clk);
											@(posedge clk);
						count <= thirteen;	@(posedge clk);
											@(posedge clk);
						count <= fourteen;	@(posedge clk);
											@(posedge clk);
						count <= fifteen;	@(posedge clk);
											@(posedge clk);
						count <= sixteen;	@(posedge clk);
											@(posedge clk);
											@(posedge clk);

	end
	
endmodule