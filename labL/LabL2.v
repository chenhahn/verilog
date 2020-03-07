module testbench;
   reg [1:0] a, b;
   reg c;
   wire [1:0] z;
   reg 	[1:0] expz;
   integer i, j, k, m, n;

   yMux2 mux2(z, a, b, c);
   
   initial
    begin
	$display("----");
	for (i=0; i<2; i=i+1)
	  for (j=0; j<2; j=j+1)
		for (m=0; m<2; m=m+1)
			for (n=0; n<2; n=n+1)
				for (k=0; k<2; k=k+1)
				begin
				a[0] = i;
				a[1] = j;
				b[0] = m;
				b[1] = n;
				c = k;
				#1;
				expz[0] = (i&~k | m&k);
				expz[1] = (j&~k | n&k);
				$display("Expected: z=%b", expz);
				if (expz[0]===z[0] && expz[1]===z[1])
				$display("PASS: a=%b, b=%b, c=%b, z=%b", a, b, c, z);
				else
				$display("FAIL: a=%b, b=%b, c=%b, z=%b", a, b, c, z);
				end
	$finish;
    end // initial begin
endmodule // testbench