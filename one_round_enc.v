module one_round_enc (input [127:0] data_in,
                      input [31:0] round_key,
                      output [127:0] res_out);
wire [31:0] word_0;
wire [31:0] word_1;
wire [31:0] word_2;
wire [31:0] word_3;

wire [31:0] trans_in;
wire [31:0] trans_out;

assign {word_0, word_1, word_2, word_3} = data_in;

assign trans_in = word_1 ^ word_2 ^ word_3 ^ round_key;
assign res_out  = {word_1, word_2, word_3, trans_out ^ word_0};

trans_enc t_enc(.data_in(trans_in), .res_out(trans_out));

endmodule
