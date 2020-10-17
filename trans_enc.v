module trans_enc (input [31:0] data_in,
                  output [31:0] res_out);
wire [7:0] byte_0;
wire [7:0] byte_1;
wire [7:0] byte_2;
wire [7:0] byte_3;

wire [7:0] re_0;
wire [7:0] re_1;
wire [7:0] re_2;
wire [7:0] re_3;
wire [31:0] re;

assign {byte_0, byte_1, byte_2, byte_3} = data_in;

assign re = {re_0, re_1, re_2, re_3};

// S
sbox s0(.data_in(byte_0), .res_out(re_0));
sbox s1(.data_in(byte_1), .res_out(re_1));
sbox s2(.data_in(byte_2), .res_out(re_2));
sbox s3(.data_in(byte_3), .res_out(re_3));

// L
assign res_out = re ^ {re[29:0], re[31:30]} ^ {re[21:0], re[31:22]} ^ {re[13:0], re[31:14]} ^ {re[7:0], re[31:8]};
endmodule
