module labK;
reg a, b, c, expect, flag;
wire z;
integer i, j, k;

not my_not(tmp1, c);
and my_and(temp2, a, tmp1);
and my_and(temp3, c, b);
or my_or(z, temp2, temp3);

initial
begin 
		flag = $value$plusargs("a=%b", a);
		flag = $value$plusargs("b=%b", b);
		flag = $value$plusargs("c=%b", c);
		expect = (a & ~c) | (c & b);
		#1;
		if(expect===z)
		$display("PASS: a=%b b=%b c=%b z=%b", a, b,c, z);
		else
		$display("FAIL: a=%b b=%b c=%b z=%b", a, b,c, z);
	$finish;
end

endmodule