module pes_add(y,y0,y1,y2,y3,y4,y5,a0,a1,a2,a3,b0,b1,b2,b3,rst);
input [7:0] a0,a1,a2,a3,b0,b1,b2,b3;
input rst;
output wire[10:0] y;

output wire [8:0] y0,y1,y2,y3;
output wire [9:0] y4,y5;

 


add8 A1(y0,a0,b0,rst);
add8 A2(y1,a1,b1,rst);
add8 A3(y2,a2,b2,rst);
add8 A4(y3,a3,b3,rst);


add9 A5(y4,y0,y1,rst);
add9 A6(y5,y2,y3,rst);

add10 A7(y,y4,y5,rst);


endmodule

module add8(y,a,b,rst);
input wire[7:0] a,b;
 reg cin;
output reg[8:0] y;
input wire rst;
reg[5:0] d1;
reg[2:0] d2;
always @*
begin
if(rst)
y=0;
else begin
cin = a[2] & b[2];
d2[0] = 1;
d2[1]= a[1] | b[1];

if(a[2] & b[2])
d2[2] = a[1] & b[1];
else 
d2[2] = a[2] | b[2];
d1=a[7:3] + b[7:3]+cin ;
y = {d1,d2}; 
end
end
endmodule


module add9(y,a,b,rst);
input wire[8:0] a,b;
output reg[9:0] y;
 reg cin ;
input wire rst;
reg[6:0] d1;
reg[2:0] d2;

always @*
begin
if(rst) 
y=0;
else 
begin
cin = a[2] & b[2];
d2[0] = 1;
d2[1]= a[1] | b[1];

if(a[2] & b[2])
d2[2] = a[1] & b[1];
else 
d2[2] = a[2] | b[2];
d1= a[8:3] + b[8:3] + cin ;
y={d1,d2};
end
end


endmodule


module add10(y,a,b,rst);
input wire[9:0] a,b;
output reg[10:0] y;
 reg cin ;
input wire rst;
reg[7:0] d1;
reg[2:0] d2;

always @* 
begin
if(rst)
y=0;
else 
begin
cin = a[2] & b[2];
d2[0] = 1;
d2[1]= a[1] | b[1];

if(a[2] & b[2])
d2[2] = a[1] & b[1];
else 
d2[2] = a[2] | b[2];
d1=a[9:3] + b[9:3] + cin  ;
y={d1,d2};
end
end



endmodule


