module labK;
reg a, b, c, expect;
wire z;
integer i, j, k;

not my_not(tmp1, c);
and my_and(temp2, a, tmp1);
and my_and(temp3, c, b);
or my_or(z, temp2, temp3);

initial
begin 
	for(i = 0; i<2; i=i+1)
	begin
		for(j=0;j<2;j=j+1)
		begin
			for(k=0;k<2;k=k+1)
				begin
					a=i;b=j;c=k;
					expect = (i & ~k) | (k & j);
					#1;
					if(expect===z)
					$display("PASS: a=%b b=%b c=%b z=%b", a, b,c, z);
					else
					$display("FAIL: a=%b b=%b c=%b z=%b", a, b,c, z);
				end
		end
	end
	$finish;
end

endmodule