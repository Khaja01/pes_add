module pes_add_tb();
reg [7:0] a0,a1,a2,a3,b0,b1,b2,b3;
wire [10:0] y;
wire [9:0] y4,y5;
wire [8:0] y0,y1,y2,y3;
reg rst;

pes_add DUT(y,y0,y1,y2,y3,y4,y5,a0,a1,a2,a3,b0,b1,b2,b3,rst);
 

initial begin
$dumpfile("add21.vcd");
$dumpvars(0,y,a0,a1,a2,a3,b0,b1,b2,b3,rst);

#5 a0=1;b0=3;a1=5;b1=7;a2=9;b2=11;a3=13;b3=15;rst=1;
#10 a0=1;b0=3;a1=5;b1=7;a2=9;b2=11;a3=13;b3=15;rst=0;
#200 $finish;

end 

endmodule
