module labK;
reg [31:0] x;
reg [0:0] one;
reg [1:0] two;
reg [2:0] three;

initial
begin
	$display("%5d", $time, " %b", x);
	x= 32'hffff0000;
	$display("time = %5d, x = %b", $time, x);
	x=x+2;
	$display($time, " %b", x);
	one = &x;
	two = x[1:0];
	three = {one, two};
	$display($time, " %b", one);
	$display($time, " %b", two);
	$display($time, " %b", three);
	$finish;
end

endmodule
	