/*-------------------------------------------------------------------------
 SM4 Encryption/Decryption Macro (ASIC version)
 
 File name   : SM4.v
 Version     : Version 1.0
 Created     : Oct/28/2020
 Last update : Oct/29/2020
 Desgined by : iamywang
 -------------------------------------------------------------------------*/


//`timescale 1ns / 1ps

module SM4(Kin, Din, Dout, Krdy, Drdy, EncDec, RSTn, EN, CLK, BSY, Kvld, Dvld);
    input  [127:0] Kin;  // Key input
    input  [127:0] Din;  // Data input
    output [127:0] Dout; // Data output
    input  Krdy;         // Key input ready
    input  Drdy;         // Data input ready
    input  EncDec;       // 0:Encryption 1:Decryption
    input  RSTn;         // Reset (Low active)
    input  EN;           // SM4 circuit enable
    input  CLK;          // System clock
    output BSY;          // Busy signal
    output Kvld;         // Data output valid
    output Dvld;         // Data output valid

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
    
    assign BSY = ~Dvld;
    SM4_EncDec enc(.clk(CLK),
    .rstn(RSTn),
    .sm4_enable(EN),
    .data_in(Din),
    .res_out(Dout),
    .enc_dec_enable(Drdy),
    .ready_out(Dvld),
    .key_exp_out(Kvld),
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
    .rk_31(rk_31));
    
    SM4_KeyExp k_exp(.clk(CLK),
    .rstn(RSTn),
    .sm4_enable(EN),
    .enc_dec(EncDec),
    .key(Kin),
    .key_exp_enable(Krdy),
    .key_exp_out(Kvld),
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
    .rk_31(rk_31));
endmodule

module SM4_SBOX (input [7:0] data_in, output reg [7:0] res_out);
    always@(*)
        case(data_in)
            8'h00 : res_out <= 8'hd6;
            8'h01 : res_out <= 8'h90;
            8'h02 : res_out <= 8'he9;
            8'h03 : res_out <= 8'hfe;
            8'h04 : res_out <= 8'hcc;
            8'h05 : res_out <= 8'he1;
            8'h06 : res_out <= 8'h3d;
            8'h07 : res_out <= 8'hb7;
            8'h08 : res_out <= 8'h16;
            8'h09 : res_out <= 8'hb6;
            8'h0a : res_out <= 8'h14;
            8'h0b : res_out <= 8'hc2;
            8'h0c : res_out <= 8'h28;
            8'h0d : res_out <= 8'hfb;
            8'h0e : res_out <= 8'h2c;
            8'h0f : res_out <= 8'h05;
            8'h10 : res_out <= 8'h2b;
            8'h11 : res_out <= 8'h67;
            8'h12 : res_out <= 8'h9a;
            8'h13 : res_out <= 8'h76;
            8'h14 : res_out <= 8'h2a;
            8'h15 : res_out <= 8'hbe;
            8'h16 : res_out <= 8'h04;
            8'h17 : res_out <= 8'hc3;
            8'h18 : res_out <= 8'haa;
            8'h19 : res_out <= 8'h44;
            8'h1a : res_out <= 8'h13;
            8'h1b : res_out <= 8'h26;
            8'h1c : res_out <= 8'h49;
            8'h1d : res_out <= 8'h86;
            8'h1e : res_out <= 8'h06;
            8'h1f : res_out <= 8'h99;
            8'h20 : res_out <= 8'h9c;
            8'h21 : res_out <= 8'h42;
            8'h22 : res_out <= 8'h50;
            8'h23 : res_out <= 8'hf4;
            8'h24 : res_out <= 8'h91;
            8'h25 : res_out <= 8'hef;
            8'h26 : res_out <= 8'h98;
            8'h27 : res_out <= 8'h7a;
            8'h28 : res_out <= 8'h33;
            8'h29 : res_out <= 8'h54;
            8'h2a : res_out <= 8'h0b;
            8'h2b : res_out <= 8'h43;
            8'h2c : res_out <= 8'hed;
            8'h2d : res_out <= 8'hcf;
            8'h2e : res_out <= 8'hac;
            8'h2f : res_out <= 8'h62;
            8'h30 : res_out <= 8'he4;
            8'h31 : res_out <= 8'hb3;
            8'h32 : res_out <= 8'h1c;
            8'h33 : res_out <= 8'ha9;
            8'h34 : res_out <= 8'hc9;
            8'h35 : res_out <= 8'h08;
            8'h36 : res_out <= 8'he8;
            8'h37 : res_out <= 8'h95;
            8'h38 : res_out <= 8'h80;
            8'h39 : res_out <= 8'hdf;
            8'h3a : res_out <= 8'h94;
            8'h3b : res_out <= 8'hfa;
            8'h3c : res_out <= 8'h75;
            8'h3d : res_out <= 8'h8f;
            8'h3e : res_out <= 8'h3f;
            8'h3f : res_out <= 8'ha6;
            8'h40 : res_out <= 8'h47;
            8'h41 : res_out <= 8'h07;
            8'h42 : res_out <= 8'ha7;
            8'h43 : res_out <= 8'hfc;
            8'h44 : res_out <= 8'hf3;
            8'h45 : res_out <= 8'h73;
            8'h46 : res_out <= 8'h17;
            8'h47 : res_out <= 8'hba;
            8'h48 : res_out <= 8'h83;
            8'h49 : res_out <= 8'h59;
            8'h4a : res_out <= 8'h3c;
            8'h4b : res_out <= 8'h19;
            8'h4c : res_out <= 8'he6;
            8'h4d : res_out <= 8'h85;
            8'h4e : res_out <= 8'h4f;
            8'h4f : res_out <= 8'ha8;
            8'h50 : res_out <= 8'h68;
            8'h51 : res_out <= 8'h6b;
            8'h52 : res_out <= 8'h81;
            8'h53 : res_out <= 8'hb2;
            8'h54 : res_out <= 8'h71;
            8'h55 : res_out <= 8'h64;
            8'h56 : res_out <= 8'hda;
            8'h57 : res_out <= 8'h8b;
            8'h58 : res_out <= 8'hf8;
            8'h59 : res_out <= 8'heb;
            8'h5a : res_out <= 8'h0f;
            8'h5b : res_out <= 8'h4b;
            8'h5c : res_out <= 8'h70;
            8'h5d : res_out <= 8'h56;
            8'h5e : res_out <= 8'h9d;
            8'h5f : res_out <= 8'h35;
            8'h60 : res_out <= 8'h1e;
            8'h61 : res_out <= 8'h24;
            8'h62 : res_out <= 8'h0e;
            8'h63 : res_out <= 8'h5e;
            8'h64 : res_out <= 8'h63;
            8'h65 : res_out <= 8'h58;
            8'h66 : res_out <= 8'hd1;
            8'h67 : res_out <= 8'ha2;
            8'h68 : res_out <= 8'h25;
            8'h69 : res_out <= 8'h22;
            8'h6a : res_out <= 8'h7c;
            8'h6b : res_out <= 8'h3b;
            8'h6c : res_out <= 8'h01;
            8'h6d : res_out <= 8'h21;
            8'h6e : res_out <= 8'h78;
            8'h6f : res_out <= 8'h87;
            8'h70 : res_out <= 8'hd4;
            8'h71 : res_out <= 8'h00;
            8'h72 : res_out <= 8'h46;
            8'h73 : res_out <= 8'h57;
            8'h74 : res_out <= 8'h9f;
            8'h75 : res_out <= 8'hd3;
            8'h76 : res_out <= 8'h27;
            8'h77 : res_out <= 8'h52;
            8'h78 : res_out <= 8'h4c;
            8'h79 : res_out <= 8'h36;
            8'h7a : res_out <= 8'h02;
            8'h7b : res_out <= 8'he7;
            8'h7c : res_out <= 8'ha0;
            8'h7d : res_out <= 8'hc4;
            8'h7e : res_out <= 8'hc8;
            8'h7f : res_out <= 8'h9e;
            8'h80 : res_out <= 8'hea;
            8'h81 : res_out <= 8'hbf;
            8'h82 : res_out <= 8'h8a;
            8'h83 : res_out <= 8'hd2;
            8'h84 : res_out <= 8'h40;
            8'h85 : res_out <= 8'hc7;
            8'h86 : res_out <= 8'h38;
            8'h87 : res_out <= 8'hb5;
            8'h88 : res_out <= 8'ha3;
            8'h89 : res_out <= 8'hf7;
            8'h8a : res_out <= 8'hf2;
            8'h8b : res_out <= 8'hce;
            8'h8c : res_out <= 8'hf9;
            8'h8d : res_out <= 8'h61;
            8'h8e : res_out <= 8'h15;
            8'h8f : res_out <= 8'ha1;
            8'h90 : res_out <= 8'he0;
            8'h91 : res_out <= 8'hae;
            8'h92 : res_out <= 8'h5d;
            8'h93 : res_out <= 8'ha4;
            8'h94 : res_out <= 8'h9b;
            8'h95 : res_out <= 8'h34;
            8'h96 : res_out <= 8'h1a;
            8'h97 : res_out <= 8'h55;
            8'h98 : res_out <= 8'had;
            8'h99 : res_out <= 8'h93;
            8'h9a : res_out <= 8'h32;
            8'h9b : res_out <= 8'h30;
            8'h9c : res_out <= 8'hf5;
            8'h9d : res_out <= 8'h8c;
            8'h9e : res_out <= 8'hb1;
            8'h9f : res_out <= 8'he3;
            8'ha0 : res_out <= 8'h1d;
            8'ha1 : res_out <= 8'hf6;
            8'ha2 : res_out <= 8'he2;
            8'ha3 : res_out <= 8'h2e;
            8'ha4 : res_out <= 8'h82;
            8'ha5 : res_out <= 8'h66;
            8'ha6 : res_out <= 8'hca;
            8'ha7 : res_out <= 8'h60;
            8'ha8 : res_out <= 8'hc0;
            8'ha9 : res_out <= 8'h29;
            8'haa : res_out <= 8'h23;
            8'hab : res_out <= 8'hab;
            8'hac : res_out <= 8'h0d;
            8'had : res_out <= 8'h53;
            8'hae : res_out <= 8'h4e;
            8'haf : res_out <= 8'h6f;
            8'hb0 : res_out <= 8'hd5;
            8'hb1 : res_out <= 8'hdb;
            8'hb2 : res_out <= 8'h37;
            8'hb3 : res_out <= 8'h45;
            8'hb4 : res_out <= 8'hde;
            8'hb5 : res_out <= 8'hfd;
            8'hb6 : res_out <= 8'h8e;
            8'hb7 : res_out <= 8'h2f;
            8'hb8 : res_out <= 8'h03;
            8'hb9 : res_out <= 8'hff;
            8'hba : res_out <= 8'h6a;
            8'hbb : res_out <= 8'h72;
            8'hbc : res_out <= 8'h6d;
            8'hbd : res_out <= 8'h6c;
            8'hbe : res_out <= 8'h5b;
            8'hbf : res_out <= 8'h51;
            8'hc0 : res_out <= 8'h8d;
            8'hc1 : res_out <= 8'h1b;
            8'hc2 : res_out <= 8'haf;
            8'hc3 : res_out <= 8'h92;
            8'hc4 : res_out <= 8'hbb;
            8'hc5 : res_out <= 8'hdd;
            8'hc6 : res_out <= 8'hbc;
            8'hc7 : res_out <= 8'h7f;
            8'hc8 : res_out <= 8'h11;
            8'hc9 : res_out <= 8'hd9;
            8'hca : res_out <= 8'h5c;
            8'hcb : res_out <= 8'h41;
            8'hcc : res_out <= 8'h1f;
            8'hcd : res_out <= 8'h10;
            8'hce : res_out <= 8'h5a;
            8'hcf : res_out <= 8'hd8;
            8'hd0 : res_out <= 8'h0a;
            8'hd1 : res_out <= 8'hc1;
            8'hd2 : res_out <= 8'h31;
            8'hd3 : res_out <= 8'h88;
            8'hd4 : res_out <= 8'ha5;
            8'hd5 : res_out <= 8'hcd;
            8'hd6 : res_out <= 8'h7b;
            8'hd7 : res_out <= 8'hbd;
            8'hd8 : res_out <= 8'h2d;
            8'hd9 : res_out <= 8'h74;
            8'hda : res_out <= 8'hd0;
            8'hdb : res_out <= 8'h12;
            8'hdc : res_out <= 8'hb8;
            8'hdd : res_out <= 8'he5;
            8'hde : res_out <= 8'hb4;
            8'hdf : res_out <= 8'hb0;
            8'he0 : res_out <= 8'h89;
            8'he1 : res_out <= 8'h69;
            8'he2 : res_out <= 8'h97;
            8'he3 : res_out <= 8'h4a;
            8'he4 : res_out <= 8'h0c;
            8'he5 : res_out <= 8'h96;
            8'he6 : res_out <= 8'h77;
            8'he7 : res_out <= 8'h7e;
            8'he8 : res_out <= 8'h65;
            8'he9 : res_out <= 8'hb9;
            8'hea : res_out <= 8'hf1;
            8'heb : res_out <= 8'h09;
            8'hec : res_out <= 8'hc5;
            8'hed : res_out <= 8'h6e;
            8'hee : res_out <= 8'hc6;
            8'hef : res_out <= 8'h84;
            8'hf0 : res_out <= 8'h18;
            8'hf1 : res_out <= 8'hf0;
            8'hf2 : res_out <= 8'h7d;
            8'hf3 : res_out <= 8'hec;
            8'hf4 : res_out <= 8'h3a;
            8'hf5 : res_out <= 8'hdc;
            8'hf6 : res_out <= 8'h4d;
            8'hf7 : res_out <= 8'h20;
            8'hf8 : res_out <= 8'h79;
            8'hf9 : res_out <= 8'hee;
            8'hfa : res_out <= 8'h5f;
            8'hfb : res_out <= 8'h3e;
            8'hfc : res_out <= 8'hd7;
            8'hfd : res_out <= 8'hcb;
            8'hfe : res_out <= 8'h39;
            8'hff : res_out <= 8'h48;
        endcase
endmodule

module SM4_Get_CK (input clk, input [4:0] count, output reg [31:0] cki_out);
    always@(posedge clk)
        case(count)
            5'b0_0000 : cki_out <= 32'h00070e15;
            5'b0_0001 : cki_out <= 32'h1c232a31;
            5'b0_0010 : cki_out <= 32'h383f464d;
            5'b0_0011 : cki_out <= 32'h545b6269;
            5'b0_0100 : cki_out <= 32'h70777e85;
            5'b0_0101 : cki_out <= 32'h8c939aa1;
            5'b0_0110 : cki_out <= 32'ha8afb6bd;
            5'b0_0111 : cki_out <= 32'hc4cbd2d9;
            5'b0_1000 : cki_out <= 32'he0e7eef5;
            5'b0_1001 : cki_out <= 32'hfc030a11;
            5'b0_1010 : cki_out <= 32'h181f262d;
            5'b0_1011 : cki_out <= 32'h343b4249;
            5'b0_1100 : cki_out <= 32'h50575e65;
            5'b0_1101 : cki_out <= 32'h6c737a81;
            5'b0_1110 : cki_out <= 32'h888f969d;
            5'b0_1111 : cki_out <= 32'ha4abb2b9;
            5'b1_0000 : cki_out <= 32'hc0c7ced5;
            5'b1_0001 : cki_out <= 32'hdce3eaf1;
            5'b1_0010 : cki_out <= 32'hf8ff060d;
            5'b1_0011 : cki_out <= 32'h141b2229;
            5'b1_0100 : cki_out <= 32'h30373e45;
            5'b1_0101 : cki_out <= 32'h4c535a61;
            5'b1_0110 : cki_out <= 32'h686f767d;
            5'b1_0111 : cki_out <= 32'h848b9299;
            5'b1_1000 : cki_out <= 32'ha0a7aeb5;
            5'b1_1001 : cki_out <= 32'hbcc3cad1;
            5'b1_1010 : cki_out <= 32'hd8dfe6ed;
            5'b1_1011 : cki_out <= 32'hf4fb0209;
            5'b1_1100 : cki_out <= 32'h10171e25;
            5'b1_1101 : cki_out <= 32'h2c333a41;
            5'b1_1110 : cki_out <= 32'h484f565d;
            5'b1_1111 : cki_out <= 32'h646b7279;
            default : cki_out   <= 32'h0;
        endcase
endmodule

module SM4_Trans_RK (input [31:0] data_in, output [31:0] res_out);
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
    SM4_SBOX s0(.data_in(byte_0), .res_out(re_0));
    SM4_SBOX s1(.data_in(byte_1), .res_out(re_1));
    SM4_SBOX s2(.data_in(byte_2), .res_out(re_2));
    SM4_SBOX s3(.data_in(byte_3), .res_out(re_3));

    // L
    assign res_out = re ^ {re[18:0], re[31:19]} ^ {re[8:0], re[31:9]};
endmodule

module SM4_Trans_CT (input [31:0] data_in, output [31:0] res_out);
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
    SM4_SBOX s0(.data_in(byte_0), .res_out(re_0));
    SM4_SBOX s1(.data_in(byte_1), .res_out(re_1));
    SM4_SBOX s2(.data_in(byte_2), .res_out(re_2));
    SM4_SBOX s3(.data_in(byte_3), .res_out(re_3));

    // L
    assign res_out = re ^ {re[29:0], re[31:30]} ^ {re[21:0], re[31:22]} ^ {re[13:0], re[31:14]} ^ {re[7:0], re[31:8]};
endmodule

module SM4_One_Round_KeyExp (input [127:0] data_in, input [31:0] ck_param, input [4:0] count_round, output [127:0] res_out);
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

    SM4_Trans_RK t_rk(.data_in(trans_in), .res_out(trans_out));
endmodule

module SM4_One_Round_EncDec (input [127:0] data_in, input [31:0] round_key, output [127:0] res_out);
    wire [31:0] word_0;
    wire [31:0] word_1;
    wire [31:0] word_2;
    wire [31:0] word_3;

    wire [31:0] trans_in;
    wire [31:0] trans_out;

    assign {word_0, word_1, word_2, word_3} = data_in;

    assign trans_in = word_1 ^ word_2 ^ word_3 ^ round_key;
    assign res_out  = {word_1, word_2, word_3, trans_out ^ word_0};

    SM4_Trans_CT t_enc(.data_in(trans_in), .res_out(trans_out));
endmodule

module SM4_KeyExp (input clk, // CLK
                input rstn, // RSTn
                input sm4_enable, // EN
                input enc_dec, // EncDec
                input key_exp_enable, // Krdy
                input [127:0] key, // Kin
                output reg key_exp_out, // Kvld
                output reg [31:0] rk_00,
                output reg [31:0] rk_01,
                output reg [31:0] rk_02,
                output reg [31:0] rk_03,
                output reg [31:0] rk_04,
                output reg [31:0] rk_05,
                output reg [31:0] rk_06,
                output reg [31:0] rk_07,
                output reg [31:0] rk_08,
                output reg [31:0] rk_09,
                output reg [31:0] rk_10,
                output reg [31:0] rk_11,
                output reg [31:0] rk_12,
                output reg [31:0] rk_13,
                output reg [31:0] rk_14,
                output reg [31:0] rk_15,
                output reg [31:0] rk_16,
                output reg [31:0] rk_17,
                output reg [31:0] rk_18,
                output reg [31:0] rk_19,
                output reg [31:0] rk_20,
                output reg [31:0] rk_21,
                output reg [31:0] rk_22,
                output reg [31:0] rk_23,
                output reg [31:0] rk_24,
                output reg [31:0] rk_25,
                output reg [31:0] rk_26,
                output reg [31:0] rk_27,
                output reg [31:0] rk_28,
                output reg [31:0] rk_29,
                output reg [31:0] rk_30,
                output reg [31:0] rk_31);
    reg [127:0] reg_key;
    
    reg [1:0] current; // 0-none 1-go
    reg [1:0] next;// 0 1
    
    reg [4:0] count_round; // 0-31
    reg [4:0] reg_count_round;
    wire [4:0] count_for_reg;
    
    reg reg_enable_key_exp;
    reg[127:0] reg_data_after_round;
    
    wire [31:0]  cki;
    wire [127:0] data_for_round;
    wire [127:0] data_after_round;
    
    assign data_for_round = (reg_count_round != 5'd0) ? reg_data_after_round : reg_key;
    assign count_for_reg = enc_dec == 1'b0 ? reg_count_round : 5'b1_1111 -  reg_count_round;
    
    SM4_Get_CK get_ck(.clk(clk), .count(count_round), .cki_out(cki));
    SM4_One_Round_KeyExp one_exp(.count_round(reg_count_round), .data_in(data_for_round), .ck_param(cki), .res_out(data_after_round));
    
    always@(*) begin
        next = 1'b0;
        case(current)
            1'b0:
            if (key_exp_enable)
                next = 1'b1;
            else
                next = 1'b0;
                
            1'b1:
            if (reg_count_round == 5'd31)
                next = 1'b0;
            else
                next = 1'b1;
            
            default:
                next = 1'b0;
        endcase
    end

    always@(posedge clk) begin
        if(rstn == 0) begin
            reg_key <= 128'b0;
            reg_count_round <= 5'b0;
            reg_enable_key_exp <= 1'b0;
            current <= 1'b0;
            key_exp_out <= 1'b0;
            count_round <= 5'b0;
            reg_data_after_round  <= 128'b0;
        end
        else begin
            reg_key            <= key;
            reg_count_round    <= count_round;
            reg_enable_key_exp <= key_exp_enable;
            if (sm4_enable)
                current <= next;
            else
                current <= 1'b0;
            
            // if (current == 1'b1 && count_for_reg == 5'b0_0000)
            if (current == 1'b1 && next == 1'b0)
                key_exp_out <= 1'b1;
            
            if (current == 1'b1)
                reg_data_after_round <= data_after_round;
            
            if (next == 1'b1)
                count_round <= count_round + 1'b1;
            else
                count_round <= 5'b0;
        end
    end

    always@(posedge clk) begin
        if(rstn == 0) begin
            rk_00 <= 32'b0;
            rk_01 <= 32'b0;
            rk_02 <= 32'b0;
            rk_03 <= 32'b0;
            rk_04 <= 32'b0;
            rk_05 <= 32'b0;
            rk_06 <= 32'b0;
            rk_07 <= 32'b0;
            rk_08 <= 32'b0;
            rk_09 <= 32'b0;
            rk_10 <= 32'b0;
            rk_11 <= 32'b0;
            rk_12 <= 32'b0;
            rk_13 <= 32'b0;
            rk_14 <= 32'b0;
            rk_15 <= 32'b0;
            rk_16 <= 32'b0;
            rk_17 <= 32'b0;
            rk_18 <= 32'b0;
            rk_19 <= 32'b0;
            rk_20 <= 32'b0;
            rk_21 <= 32'b0;
            rk_22 <= 32'b0;
            rk_23 <= 32'b0;
            rk_24 <= 32'b0;
            rk_25 <= 32'b0;
            rk_26 <= 32'b0;
            rk_27 <= 32'b0;
            rk_28 <= 32'b0;
            rk_29 <= 32'b0;
            rk_30 <= 32'b0;
            rk_31 <= 32'b0;
        end
        else begin
            rk_00 <= current == 1'b1 && count_for_reg == 5'b0_0000 ? data_after_round[31:0]:rk_00;
            rk_01 <= current == 1'b1 && count_for_reg == 5'b0_0001 ? data_after_round[31:0]:rk_01;
            rk_02 <= current == 1'b1 && count_for_reg == 5'b0_0010 ? data_after_round[31:0]:rk_02;
            rk_03 <= current == 1'b1 && count_for_reg == 5'b0_0011 ? data_after_round[31:0]:rk_03;
            rk_04 <= current == 1'b1 && count_for_reg == 5'b0_0100 ? data_after_round[31:0]:rk_04;
            rk_05 <= current == 1'b1 && count_for_reg == 5'b0_0101 ? data_after_round[31:0]:rk_05;
            rk_06 <= current == 1'b1 && count_for_reg == 5'b0_0110 ? data_after_round[31:0]:rk_06;
            rk_07 <= current == 1'b1 && count_for_reg == 5'b0_0111 ? data_after_round[31:0]:rk_07;
            rk_08 <= current == 1'b1 && count_for_reg == 5'b0_1000 ? data_after_round[31:0]:rk_08;
            rk_09 <= current == 1'b1 && count_for_reg == 5'b0_1001 ? data_after_round[31:0]:rk_09;
            rk_10 <= current == 1'b1 && count_for_reg == 5'b0_1010 ? data_after_round[31:0]:rk_10;
            rk_11 <= current == 1'b1 && count_for_reg == 5'b0_1011 ? data_after_round[31:0]:rk_11;
            rk_12 <= current == 1'b1 && count_for_reg == 5'b0_1100 ? data_after_round[31:0]:rk_12;
            rk_13 <= current == 1'b1 && count_for_reg == 5'b0_1101 ? data_after_round[31:0]:rk_13;
            rk_14 <= current == 1'b1 && count_for_reg == 5'b0_1110 ? data_after_round[31:0]:rk_14;
            rk_15 <= current == 1'b1 && count_for_reg == 5'b0_1111 ? data_after_round[31:0]:rk_15;
            rk_16 <= current == 1'b1 && count_for_reg == 5'b1_0000 ? data_after_round[31:0]:rk_16;
            rk_17 <= current == 1'b1 && count_for_reg == 5'b1_0001 ? data_after_round[31:0]:rk_17;
            rk_18 <= current == 1'b1 && count_for_reg == 5'b1_0010 ? data_after_round[31:0]:rk_18;
            rk_19 <= current == 1'b1 && count_for_reg == 5'b1_0011 ? data_after_round[31:0]:rk_19;
            rk_20 <= current == 1'b1 && count_for_reg == 5'b1_0100 ? data_after_round[31:0]:rk_20;
            rk_21 <= current == 1'b1 && count_for_reg == 5'b1_0101 ? data_after_round[31:0]:rk_21;
            rk_22 <= current == 1'b1 && count_for_reg == 5'b1_0110 ? data_after_round[31:0]:rk_22;
            rk_23 <= current == 1'b1 && count_for_reg == 5'b1_0111 ? data_after_round[31:0]:rk_23;
            rk_24 <= current == 1'b1 && count_for_reg == 5'b1_1000 ? data_after_round[31:0]:rk_24;
            rk_25 <= current == 1'b1 && count_for_reg == 5'b1_1001 ? data_after_round[31:0]:rk_25;
            rk_26 <= current == 1'b1 && count_for_reg == 5'b1_1010 ? data_after_round[31:0]:rk_26;
            rk_27 <= current == 1'b1 && count_for_reg == 5'b1_1011 ? data_after_round[31:0]:rk_27;
            rk_28 <= current == 1'b1 && count_for_reg == 5'b1_1100 ? data_after_round[31:0]:rk_28;
            rk_29 <= current == 1'b1 && count_for_reg == 5'b1_1101 ? data_after_round[31:0]:rk_29;
            rk_30 <= current == 1'b1 && count_for_reg == 5'b1_1110 ? data_after_round[31:0]:rk_30;
            rk_31 <= current == 1'b1 && count_for_reg == 5'b1_1111 ? data_after_round[31:0]:rk_31;
        end
    end
endmodule

module SM4_EncDec (input clk, // CLK
                input rstn, // RSTn
                input sm4_enable, // EN
                input enc_dec_enable, // Drdy
                input key_exp_out, // Kvld
                output ready_out, // Dvld
                input [127:0] data_in, // Din
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
                output reg[127:0] res_out); // Dout
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
        if (rstn == 0)
            current = 2'b0;
        else if (sm4_enable)
            current = next;
    end

    always@(posedge clk) begin
        if (rstn == 0)
            reg_tmp = 32'b0;
        else if (current == 2'b10)
            reg_tmp = {reg_tmp[30:0], 1'b1};
        else
            reg_tmp = {reg_tmp[30:0], 1'b0};
    end

    always@(posedge clk) begin
        // out
        if(rstn == 0)
            res_out = 32'b0;
        else if(reg_tmp[31])
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
    SM4_One_Round_EncDec round_00 (.data_in(data_in), .round_key(rk_00), .res_out(res_00));
    SM4_One_Round_EncDec round_01 (.data_in(res_00), .round_key(rk_01), .res_out(res_01));
    SM4_One_Round_EncDec round_02 (.data_in(res_01), .round_key(rk_02), .res_out(res_02));
    SM4_One_Round_EncDec round_03 (.data_in(res_02), .round_key(rk_03), .res_out(res_03));
    SM4_One_Round_EncDec round_04 (.data_in(res_03), .round_key(rk_04), .res_out(res_04));
    SM4_One_Round_EncDec round_05 (.data_in(res_04), .round_key(rk_05), .res_out(res_05));
    SM4_One_Round_EncDec round_06 (.data_in(res_05), .round_key(rk_06), .res_out(res_06));
    SM4_One_Round_EncDec round_07 (.data_in(res_06), .round_key(rk_07), .res_out(res_07));
    SM4_One_Round_EncDec round_08 (.data_in(res_07), .round_key(rk_08), .res_out(res_08));
    SM4_One_Round_EncDec round_09 (.data_in(res_08), .round_key(rk_09), .res_out(res_09));
    SM4_One_Round_EncDec round_10 (.data_in(res_09), .round_key(rk_10), .res_out(res_10));
    SM4_One_Round_EncDec round_11 (.data_in(res_10), .round_key(rk_11), .res_out(res_11));
    SM4_One_Round_EncDec round_12 (.data_in(res_11), .round_key(rk_12), .res_out(res_12));
    SM4_One_Round_EncDec round_13 (.data_in(res_12), .round_key(rk_13), .res_out(res_13));
    SM4_One_Round_EncDec round_14 (.data_in(res_13), .round_key(rk_14), .res_out(res_14));
    SM4_One_Round_EncDec round_15 (.data_in(res_14), .round_key(rk_15), .res_out(res_15));
    SM4_One_Round_EncDec round_16 (.data_in(res_15), .round_key(rk_16), .res_out(res_16));
    SM4_One_Round_EncDec round_17 (.data_in(res_16), .round_key(rk_17), .res_out(res_17));
    SM4_One_Round_EncDec round_18 (.data_in(res_17), .round_key(rk_18), .res_out(res_18));
    SM4_One_Round_EncDec round_19 (.data_in(res_18), .round_key(rk_19), .res_out(res_19));
    SM4_One_Round_EncDec round_20 (.data_in(res_19), .round_key(rk_20), .res_out(res_20));
    SM4_One_Round_EncDec round_21 (.data_in(res_20), .round_key(rk_21), .res_out(res_21));
    SM4_One_Round_EncDec round_22 (.data_in(res_21), .round_key(rk_22), .res_out(res_22));
    SM4_One_Round_EncDec round_23 (.data_in(res_22), .round_key(rk_23), .res_out(res_23));
    SM4_One_Round_EncDec round_24 (.data_in(res_23), .round_key(rk_24), .res_out(res_24));
    SM4_One_Round_EncDec round_25 (.data_in(res_24), .round_key(rk_25), .res_out(res_25));
    SM4_One_Round_EncDec round_26 (.data_in(res_25), .round_key(rk_26), .res_out(res_26));
    SM4_One_Round_EncDec round_27 (.data_in(res_26), .round_key(rk_27), .res_out(res_27));
    SM4_One_Round_EncDec round_28 (.data_in(res_27), .round_key(rk_28), .res_out(res_28));
    SM4_One_Round_EncDec round_29 (.data_in(res_28), .round_key(rk_29), .res_out(res_29));
    SM4_One_Round_EncDec round_30 (.data_in(res_29), .round_key(rk_30), .res_out(res_30));
    SM4_One_Round_EncDec round_31 (.data_in(res_30), .round_key(rk_31), .res_out(res_31));
endmodule
