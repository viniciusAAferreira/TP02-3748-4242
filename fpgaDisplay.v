module fpgaDisplay(
	input [2:0] bits,
	output [13:0] saida
);
	wire s1, s2, s3, s4, s5;
	wire [13:0] saidaDisplay1;


	main2 main2(.saidaPC(saidaDisplay1), .teste(bits));
	 
	decodificadorBCD display1(
		4'b1000,
		saida[6:0]);

	decodificadorBCD display2(
		4'b0010,
		saida[13:7]);
endmodule