`timescale 1ns/1ps

module rps_tb(

);

	reg [1:0] a, b;
	reg  rst, start, clk;
	wire aWin, bWin, error;

rps_fsm DUT(

	.A(a),
	.B(b),
	.rst(rst),
	.start(start),
	.clk(clk),
	.a_wins(aWin),
	.b_wins(bWin),
	.error(error)
	
);

always #5 clk = ~clk;

initial begin

	clk = 0;
	rst = 0;
	start = 0;
	a = 2'b00;
	b = 2'b00;

	rst = 1;
	#10;
	rst = 0;
	
	$dumpfile("sim/rps.vcd");
	$dumpvars(0, rps_tb);
	$display("Time | A | B | a_wins | b_wins | error");
	$monitor("%0t | %b | %b | %b | %b | %b", $time, a, b, aWin, bWin, error);

	a = 2'b00; b = 2'b00;	
	start = 1; #10;
	start = 0; #10;

	a = 2'b00; b = 2'b01;
        start = 1; #10;
        start = 0; #10;

	a = 2'b00; b = 2'b10;
        start = 1; #10;
        start = 0; #10;
			
	a = 2'b00; b = 2'b11;
        start = 1; #10;
        start = 0; #10;

	a = 2'b01; b = 2'b00;
        start = 1; #10;
        start = 0; #10;


	a = 2'b01; b = 2'b01;
        start = 1; #10;
        start = 0; #10;

	a = 2'b01; b = 2'b10;
        start = 1; #10;
        start = 0; #10;


	a = 2'b01; b = 2'b11;
        start = 1; #10;
        start = 0; #10;

	a = 2'b10; b = 2'b00;
        start = 1; #10;
        start = 0; #10;

	a = 2'b10; b = 2'b01;
        start = 1; #10;
        start = 0; #10;

	a = 2'b10; b = 2'b10;
        start = 1; #10;
        start = 0; #10;

	a = 2'b10; b = 2'b11;
        start = 1; #10;
        start = 0; #10;

	a = 2'b11; b = 2'b00;
        start = 1; #10;
        start = 0; #10;

	a = 2'b11; b = 2'b01;
        start = 1; #10;
        start = 0; #10;

	a = 2'b11; b = 2'b10;
        start = 1; #10;
        start = 0; #10;

	a = 2'b11; b = 2'b11;
        start = 1; #10;
        start = 0; #10;

	#400;
	$finish;
end
endmodule
