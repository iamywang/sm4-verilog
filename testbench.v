module testbench ();
    reg CLK;
    reg RSTn;
    reg EN;
    wire BSY;
    reg  EncDec;
    reg [127:0] Kin;
    reg [127:0] Din;
    wire [127:0] Dout;
    reg Krdy;
    reg Drdy;
    wire Dvld;
    wire Kvld;
    
    always #1 CLK = ~CLK;
    
    initial
        begin
            CLK = 0; // clk信号
            RSTn = 0; // rstn
            EN = 0; // 控制开关
            Krdy = 0; // 是否开始密钥扩展
            Drdy = 0; // 是否加解密
            EncDec = 0; // 加密还是解密
            Din = 0; // 输入数据
            Kin = 0; // 密钥

            // gen round key
            RSTn = 1;
            EN = 1;
            Kin = 128'h0123456789abcdeffedcba9876543210;
            Din = 128'h0123456789abcdeffedcba9876543210;
            Krdy = 1;
            wait(Kvld);

            // start
            EncDec = 0;
            Drdy = 1;
            wait(Dvld);

            // finish
            RSTn = 0;
            EN = 0;
            Krdy = 0;
            Drdy = 0;
            EncDec = 0;
            Din = 0;
            Kin = 0;
        end


    SM4 s(.CLK(CLK),
    .RSTn(RSTn),
    .EN(EN),
    .EncDec(EncDec),
    .Kin(Kin),
    .Din(Din),
    .Dout(Dout),
    .Krdy(Krdy),
    .Drdy(Drdy),
    .Kvld(Kvld),
    .Dvld(Dvld),
    .BSY(BSY)
    );
endmodule
