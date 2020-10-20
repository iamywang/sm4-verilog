module sm4_enc (input clk,
                input sm4_enable,
                input enc_dec_enable,
                input key_exp_out,
                input [127:0] data_in,
                input [31:0] rk_00,
                input [31:0] rk_01,
                input [31:0] rk_02,
                input [31:0] rk_03,
                input [31:0] rk_04,
                input [31:0] rk_05,
                input [31:0] rk_06,
                input [31:0] rk_07,
                input [31:0] rk_08,
                input [31:0] rk_09,
                input [31:0] rk_10,
                input [31:0] rk_11,
                input [31:0] rk_12,
                input [31:0] rk_13,
                input [31:0] rk_14,
                input [31:0] rk_15,
                input [31:0] rk_16,
                input [31:0] rk_17,
                input [31:0] rk_18,
                input [31:0] rk_19,
                input [31:0] rk_20,
                input [31:0] rk_21,
                input [31:0] rk_22,
                input [31:0] rk_23,
                input [31:0] rk_24,
                input [31:0] rk_25,
                input [31:0] rk_26,
                input [31:0] rk_27,
                input [31:0] rk_28,
                input [31:0] rk_29,
                input [31:0] rk_30,
                input [31:0] rk_31,
                output reg[127:0] res_out,
                output ready_out);

    // store res
    wire [127:0] res_00;
    wire [127:0] res_01;
    wire [127:0] res_02;
    wire [127:0] res_03;
    wire [127:0] res_04;
    wire [127:0] res_05;
    wire [127:0] res_06;
    wire [127:0] res_07;
    wire [127:0] res_08;
    wire [127:0] res_09;
    wire [127:0] res_10;
    wire [127:0] res_11;
    wire [127:0] res_12;
    wire [127:0] res_13;
    wire [127:0] res_14;
    wire [127:0] res_15;
    wire [127:0] res_16;
    wire [127:0] res_17;
    wire [127:0] res_18;
    wire [127:0] res_19;
    wire [127:0] res_20;
    wire [127:0] res_21;
    wire [127:0] res_22;
    wire [127:0] res_23;
    wire [127:0] res_24;
    wire [127:0] res_25;
    wire [127:0] res_26;
    wire [127:0] res_27;
    wire [127:0] res_28;
    wire [127:0] res_29;
    wire [127:0] res_30;
    wire [127:0] res_31;

    // store round
    reg [31:0] reg_tmp;
    reg [1:0] current; // 0-none 1-wait 2-go
    reg [1:0] next;// 0 1

    always@(*) begin
        next = 2'b00;
        case(current)
            2'b00:
            if (sm4_enable && enc_dec_enable)
                next = 2'b01;
            else
                next = 2'b00;
            2'b01:
            if (key_exp_out)
                next = 2'b10;
            else
                next = 2'b01;
            2'b10:
            if (!enc_dec_enable || !sm4_enable)
                next = 2'b00;
            else
                next = 2'b10;
            default :
            next = 2'b00;
        endcase
        end

        always@(posedge clk) begin
            if (sm4_enable)
                current = next;
        end
        
        always@(posedge clk) begin
            if (current == 2'b10)
                reg_tmp = {reg_tmp[30:0], 1'b1};
            else
                reg_tmp = {reg_tmp[30:0], 1'b0};
        end

        always@(posedge clk) begin
            // out
            if(reg_tmp[31])
                res_out = {word_3, word_2, word_1, word_0};
        end
        
        // cal res_out
        wire [31:0] word_0;
        wire [31:0] word_1;
        wire [31:0] word_2;
        wire [31:0] word_3;

        assign ready_out = reg_tmp[31];
        assign {word_0, word_1, word_2, word_3} = res_31;

        // 32 rounds
        one_round_enc round_00 (.data_in(data_in), .round_key(rk_00), .res_out(res_00));
        one_round_enc round_01 (.data_in(res_00), .round_key(rk_01), .res_out(res_01));
        one_round_enc round_02 (.data_in(res_01), .round_key(rk_02), .res_out(res_02));
        one_round_enc round_03 (.data_in(res_02), .round_key(rk_03), .res_out(res_03));
        one_round_enc round_04 (.data_in(res_03), .round_key(rk_04), .res_out(res_04));
        one_round_enc round_05 (.data_in(res_04), .round_key(rk_05), .res_out(res_05));
        one_round_enc round_06 (.data_in(res_05), .round_key(rk_06), .res_out(res_06));
        one_round_enc round_07 (.data_in(res_06), .round_key(rk_07), .res_out(res_07));
        one_round_enc round_08 (.data_in(res_07), .round_key(rk_08), .res_out(res_08));
        one_round_enc round_09 (.data_in(res_08), .round_key(rk_09), .res_out(res_09));
        one_round_enc round_10 (.data_in(res_09), .round_key(rk_10), .res_out(res_10));
        one_round_enc round_11 (.data_in(res_10), .round_key(rk_11), .res_out(res_11));
        one_round_enc round_12 (.data_in(res_11), .round_key(rk_12), .res_out(res_12));
        one_round_enc round_13 (.data_in(res_12), .round_key(rk_13), .res_out(res_13));
        one_round_enc round_14 (.data_in(res_13), .round_key(rk_14), .res_out(res_14));
        one_round_enc round_15 (.data_in(res_14), .round_key(rk_15), .res_out(res_15));
        one_round_enc round_16 (.data_in(res_15), .round_key(rk_16), .res_out(res_16));
        one_round_enc round_17 (.data_in(res_16), .round_key(rk_17), .res_out(res_17));
        one_round_enc round_18 (.data_in(res_17), .round_key(rk_18), .res_out(res_18));
        one_round_enc round_19 (.data_in(res_18), .round_key(rk_19), .res_out(res_19));
        one_round_enc round_20 (.data_in(res_19), .round_key(rk_20), .res_out(res_20));
        one_round_enc round_21 (.data_in(res_20), .round_key(rk_21), .res_out(res_21));
        one_round_enc round_22 (.data_in(res_21), .round_key(rk_22), .res_out(res_22));
        one_round_enc round_23 (.data_in(res_22), .round_key(rk_23), .res_out(res_23));
        one_round_enc round_24 (.data_in(res_23), .round_key(rk_24), .res_out(res_24));
        one_round_enc round_25 (.data_in(res_24), .round_key(rk_25), .res_out(res_25));
        one_round_enc round_26 (.data_in(res_25), .round_key(rk_26), .res_out(res_26));
        one_round_enc round_27 (.data_in(res_26), .round_key(rk_27), .res_out(res_27));
        one_round_enc round_28 (.data_in(res_27), .round_key(rk_28), .res_out(res_28));
        one_round_enc round_29 (.data_in(res_28), .round_key(rk_29), .res_out(res_29));
        one_round_enc round_30 (.data_in(res_29), .round_key(rk_30), .res_out(res_30));
        one_round_enc round_31 (.data_in(res_30), .round_key(rk_31), .res_out(res_31));

endmodule
