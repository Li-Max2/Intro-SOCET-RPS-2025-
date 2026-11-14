module rps_fsm(
        input  [1:0] A,
        input  [1:0] B,
	input start,
	input rst,
	input clk,
        output a_wins,
        output b_wins,
        output error
);

	parameter IDLE = 1'b0, DISPLAY = 1'b1;
	reg state;

	rps_logic rps(
  		.A(A),
    		.B(B),
    		.a_wins(a_wins),
    		.b_wins(b_wins),
    		.error(error)
	);

	always@(posedge clk or posedge rst) begin
		
		if(rst) begin
			state <= IDLE;
		end
		else begin
   		case (state)
       			IDLE: begin
				if(start) begin
					state <= DISPLAY;
				end    
			end
        		DISPLAY: begin
			
			end 
       		   
   		endcase
		end		
	end	


endmodule
