module bmc010
(
   input    [1:0] rx_pair,
   output   [1:0] path_0_bmc,
   output   [1:0] path_1_bmc);

logic tmp00;
logic tmp01;
logic tmp10;
logic tmp11;

assign tmp00 = rx_pair[0];
assign tmp01 = ~rx_pair[1];
assign tmp10 = ~rx_pair[0];
assign tmp11 = rx_pair[1];

assign path_0_bmc[1] = tmp00 & tmp01;
assign path_0_bmc[0] = tmp00 ^ tmp01;
assign path_1_bmc[1] = tmp10 & tmp11;
assign path_1_bmc[0] = tmp10 ^ tmp11;

endmodule
