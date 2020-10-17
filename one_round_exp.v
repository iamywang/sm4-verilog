module one_round_exp (input [127:0] data_in,
                      input [31:0] ck_param,
                      input [4:0] count_round,
                      output [127:0] res_out);
localparam FK0 = 32'ha3b1bac6;
localparam FK1 = 32'h56aa3350;
localparam FK2 = 32'h677d9197;
localparam FK3 = 32'hb27022dc;

wire [31:0] word_0;
wire [31:0] word_1;
wire [31:0] word_2;
wire [31:0] word_3;

wire [31:0] ck_in;
wire [31:0] trans_in;
wire [31:0] trans_out;

wire [31:0] k0;
wire [31:0] k1;
wire [31:0] k2;
wire [31:0] k3;

assign {word_0, word_1, word_2, word_3} = data_in;

assign k0 = word_0 ^ FK0;
assign k1 = word_1 ^ FK1;
assign k2 = word_2 ^ FK2;
assign k3 = word_3 ^ FK3;

assign ck_in    = ck_param;
assign trans_in = count_round == 'd0 ? k1 ^ k2 ^ k3 ^ ck_in : word_1 ^ word_2 ^ word_3 ^ ck_in;

assign res_out = count_round == 'd0 ? {k1, k2, k3, trans_out ^ k0} : {word_1, word_2, word_3, trans_out ^ word_0};

trans_rk t_rk(.data_in(trans_in), .res_out(trans_out));

endmodule
