module key_exp (input clk,
                input sm4_enable,
                input enc_dec,            // enc-0 dec-1
                input key_exp_enable,
                input [127:0] key,
                output reg key_exp_out,       // is finished
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
    
    ck get_ck(.clk(clk), .count(count_round), .cki_out(cki));
    one_round_exp one_exp(.count_round(reg_count_round), .data_in(data_for_round), .ck_param(cki), .res_out(data_after_round));
    
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
        reg_key            <= key;
        reg_count_round    <= count_round;
        reg_enable_key_exp <= key_exp_enable;
        if (sm4_enable)
            current <= next;
        else
            current <= 1'b0;
        
        if (current == 1'b1 && count_for_reg == 5'b0_0000)
        // if (current == 1'b1 && next == 1'b0)
            key_exp_out <= 1'b1;
        
        if (current == 1'b1)
            reg_data_after_round <= data_after_round;
        
        if (next == 1'b1)
            count_round <= count_round + 1'b1;
        else
            count_round <= 5'd0;
        
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
    
endmodule
