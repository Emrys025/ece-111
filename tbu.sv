module tbu
(
   input       clk,
   input       rst,
   input       enable,
   input       selection,
   input [7:0] d_in_0,
   input [7:0] d_in_1,
   output logic  d_o,
   output logic  wr_en);

   logic         d_o_reg;
   logic         wr_en_reg;
   
   logic   [2:0] pstate;
   logic   [2:0] nstate;

   logic         selection_buf;

   always @(posedge clk)    begin
      selection_buf  <= selection;
      wr_en          <= wr_en_reg;
      d_o            <= d_o_reg;
   end
   always @(posedge clk, negedge rst) begin
      if(!rst)
         pstate   <= 3'b000;
      else if(!enable)
         pstate   <= 3'b000;
      else if(selection_buf && !selection)
         pstate   <= 3'b000;
      else
         pstate   <= nstate;
   end

/*  combinational logic drives:
wr_en_reg, d_o_reg, nstate (next state)
from selection, d_in_1[pstate], d_in_0[pstate]
See assignment text for details
*/

assign wr_en_reg = selection;

always_comb begin
	case (pstate)
		0: if (selection) begin
			d_o_reg = d_in_1[0];
			if (d_in_1[0]) begin
				nstate = 1;
			end
			else begin
				nstate = 0;
			end
		end
		else begin 
			if (d_in_0[0]) begin
				nstate = 1;
			end
			else begin 
				nstate = 0;
			end
		end
		
		1: if (selection) begin
			d_o_reg = d_in_1[1];
			if (d_in_1[1]) begin
				nstate = 2;
			end
			else begin
				nstate = 3;
			end
		end
		else begin 
			if (d_in_0[1]) begin
				nstate = 2;
			end
			else begin 
				nstate = 3;
			end
		end
		
		2: if (selection) begin
			d_o_reg = d_in_1[2];
			if (d_in_1[2]) begin
				nstate = 5;
			end
			else begin
				nstate = 4;
			end
		end
		else begin 
			if (d_in_0[2]) begin
				nstate = 5;
			end
			else begin 
				nstate = 4;
			end
		end
		
		3: if (selection) begin
			d_o_reg = d_in_1[3];
			if (d_in_1[3]) begin
				nstate = 6;
			end
			else begin
				nstate = 7;
			end
		end
		else begin 
			if (d_in_0[3]) begin
				nstate = 6;
			end
			else begin 
				nstate = 7;
			end
		end
		
		4: if (selection) begin
			d_o_reg = d_in_1[4];
			if (d_in_1[4]) begin
				nstate = 0;
			end
			else begin
				nstate = 1;
			end
		end
		else begin 
			if (d_in_0[4]) begin
				nstate = 0;
			end
			else begin 
				nstate = 1;
			end
		end
		
		5: if (selection) begin
			d_o_reg = d_in_1[5];
			if (d_in_1[5]) begin
				nstate = 3;
			end
			else begin
				nstate = 2;
			end
		end
		else begin 
			if (d_in_0[5]) begin
				nstate = 3;
			end
			else begin 
				nstate = 2;
			end
		end
		
		6: if (selection) begin
			d_o_reg = d_in_1[6];
			if (d_in_1[6]) begin
				nstate = 4;
			end
			else begin
				nstate = 5;
			end
		end
		else begin 
			if (d_in_0[6]) begin
				nstate = 4;
			end
			else begin 
				nstate = 5;
			end
		end
		
		7: if (selection) begin
			d_o_reg = d_in_1[7];
			if (d_in_1[7]) begin
				nstate = 7;
			end
			else begin
				nstate = 6;
			end
		end
		else begin 
			if (d_in_0[7]) begin
				nstate = 7;
			end
			else begin 
				nstate = 6;
			end
		end
	endcase
	end

endmodule
