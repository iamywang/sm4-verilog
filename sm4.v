module sm4 (input clk,
            input sm4_enable,
            input enc_dec_enable,
            input enc_dec,
            input [127:0] data_in,
            input key_exp_enable,
            input [127:0] key_in,
            output key_exp_out,
            output ready_out,
            output [127:0] res_out);
    
    wire [31:0] rk_00;
    wire [31:0] rk_01;
    wire [31:0] rk_02;
    wire [31:0] rk_03;
    wire [31:0] rk_04;
    wire [31:0] rk_05;
    wire [31:0] rk_06;
    wire [31:0] rk_07;
    wire [31:0] rk_08;
    wire [31:0] rk_09;
    wire [31:0] rk_10;
    wire [31:0] rk_11;
    wire [31:0] rk_12;
    wire [31:0] rk_13;
    wire [31:0] rk_14;
    wire [31:0] rk_15;
    wire [31:0] rk_16;
    wire [31:0] rk_17;
    wire [31:0] rk_18;
    wire [31:0] rk_19;
    wire [31:0] rk_20;
    wire [31:0] rk_21;
    wire [31:0] rk_22;
    wire [31:0] rk_23;
    wire [31:0] rk_24;
    wire [31:0] rk_25;
    wire [31:0] rk_26;
    wire [31:0] rk_27;
    wire [31:0] rk_28;
    wire [31:0] rk_29;
    wire [31:0] rk_30;
    wire [31:0] rk_31;
    
    sm4_enc enc(.clk(clk),
    .sm4_enable(sm4_enable),
    .enc_dec_enable(enc_dec_enable),
    .data_in(data_in),
    .key_exp_out(key_exp_out),
    .rk_00(rk_00),
    .rk_01(rk_01),
    .rk_02(rk_02),
    .rk_03(rk_03),
    .rk_04(rk_04),
    .rk_05(rk_05),
    .rk_06(rk_06),
    .rk_07(rk_07),
    .rk_08(rk_08),
    .rk_09(rk_09),
    .rk_10(rk_10),
    .rk_11(rk_11),
    .rk_12(rk_12),
    .rk_13(rk_13),
    .rk_14(rk_14),
    .rk_15(rk_15),
    .rk_16(rk_16),
    .rk_17(rk_17),
    .rk_18(rk_18),
    .rk_19(rk_19),
    .rk_20(rk_20),
    .rk_21(rk_21),
    .rk_22(rk_22),
    .rk_23(rk_23),
    .rk_24(rk_24),
    .rk_25(rk_25),
    .rk_26(rk_26),
    .rk_27(rk_27),
    .rk_28(rk_28),
    .rk_29(rk_29),
    .rk_30(rk_30),
    .rk_31(rk_31),
    .res_out(res_out),
    .ready_out(ready_out)
    );
    
    key_exp k_exp(.clk(clk),
    .sm4_enable(sm4_enable),
    .enc_dec(enc_dec),
    .key_exp_enable(key_exp_enable),
    .key(key_in),
    .key_exp_out(key_exp_out),
    .rk_00(rk_00),
    .rk_01(rk_01),
    .rk_02(rk_02),
    .rk_03(rk_03),
    .rk_04(rk_04),
    .rk_05(rk_05),
    .rk_06(rk_06),
    .rk_07(rk_07),
    .rk_08(rk_08),
    .rk_09(rk_09),
    .rk_10(rk_10),
    .rk_11(rk_11),
    .rk_12(rk_12),
    .rk_13(rk_13),
    .rk_14(rk_14),
    .rk_15(rk_15),
    .rk_16(rk_16),
    .rk_17(rk_17),
    .rk_18(rk_18),
    .rk_19(rk_19),
    .rk_20(rk_20),
    .rk_21(rk_21),
    .rk_22(rk_22),
    .rk_23(rk_23),
    .rk_24(rk_24),
    .rk_25(rk_25),
    .rk_26(rk_26),
    .rk_27(rk_27),
    .rk_28(rk_28),
    .rk_29(rk_29),
    .rk_30(rk_30),
    .rk_31(rk_31)
    );
endmodule
