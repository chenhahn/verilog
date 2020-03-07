module testbench;
   reg a, b, c;
   wire z;
   reg 	expz;
   integer i, j, k;

   yMux1 mux(z, a, b, c);
   
   initial
    begin
	$display("----");
	for (i=0; i<2; i=i+1)
	  for (j=0; j<2; j=j+1)
	    for (k=0; k<2; k=k+1)
	    begin
		a = i;
		b = j;
		c = k;
		#1;
		expz = (i&~c | b&c);
		$display("Expected: z=%b", expz);
		if (expz===z)
		  $display("PASS: a=%b, b=%b, c=%b, z=%b", a, b, c, z);
		else
		  $display("FAIL: a=%b, b=%b, c=%b, z=%b", a, b, c, z);
		end
	$finish;
    end // initial begin
endmodule // testbench