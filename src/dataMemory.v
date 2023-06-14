module dataMemory(
	input wire clock,
	input reset,
	input wire MemWrite,
	input wire MemRead,
	input wire [31:0] enderecoDeEntrada,
	input wire [31:0] writeData,
	output reg [31:0] readData);

	reg [31:0] dadosMemoria [0:31];

	always @(posedge clock) begin

		if(reset) begin

			for (integer i = 0; i < 32; i = i + 1) begin
				dadosMemoria[i] <= 32'd0;
			end

		end else begin

			if(MemWrite) begin
				dadosMemoria[enderecoDeEntrada] = writeData;
			end

			if(MemRead) begin
				readData = dadosMemoria[enderecoDeEntrada];
			end
		end
	end
endmodule