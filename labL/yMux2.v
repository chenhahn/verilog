module yMux2(z, a, b, c);
output [1:0] z;
input [1:0] a, b;
input c;

yMux1 upper1(z[0], a[0], b[0], c);
yMux1 upper2(z[1], a[1], b[1], c);

endmodule