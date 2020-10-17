module testbench ();
    reg clk;
    reg sm4_enable;
    reg  enc_dec_enable;
    reg  enc_dec;
    reg [127:0] data_in;
    reg key_exp_enable;
    reg [127:0] key_in;
    wire ready_out;
    wire key_exp_out;
    wire [127:0] res_out;
    
    always #1 clk = ~clk;
    
    initial
        begin
            clk = 0; // clk信号
            sm4_enable = 0;
            enc_dec_enable = 0; // 是否加解密
            enc_dec = 0; // 加密还是解密
            key_exp_enable = 0; // 是否开始密钥扩展
            data_in = 0; // 输入数据
            key_in = 0; // 密钥

            // gen round key
            #100;
            sm4_enable = 1;
            #100;
            key_exp_enable = 1;
            #100;
            @(posedge clk)
            begin
                key_in = 128'h0123456789abcdeffedcba9876543210;
            end
            wait(key_exp_out);

            // start decrypt
            #100;
            enc_dec_enable = 0;
            #100;
            enc_dec = 0; // decrypt
            #100;
            @(posedge clk)
            begin
                data_in = 128'h0123456789abcdeffedcba9876543210;
            end
            wait(ready_out);

            // finish
            #100;
            sm4_enable = 0;
            enc_dec_enable = 0;
        end


    sm4 s(.clk(clk),
    .sm4_enable(sm4_enable),
    .enc_dec_enable(enc_dec_enable),
    .enc_dec(enc_dec),
    .data_in(data_in),
    .key_exp_enable(key_exp_enable),
    .key_in(key_in),
    .ready_out(ready_out),
    .key_exp_out(key_exp_out),
    .res_out(res_out)
    );
endmodule
