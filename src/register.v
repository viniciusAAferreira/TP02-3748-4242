module register(
	input wire clock,
	input wire regWrite,
	input wire [4:0] rs1,
	input wire [4:0] rs2,
	input wire [4:0] writeRegister,
	input wire [31:0] writeData,
	output reg [31:0] readData1,
	output reg [31:0] readData2);

	reg [4:0] atrasoDoclock1;
    reg [4:0] atrasoDoclock2;

	reg [31:0] registradores [0:31];

	integer i;


	always @(posedge clock) begin

		if(reset) begin

			for (i = 0; i < 32; i = i + 1) begin
				registradores[i] <= 32'b0;
			end

		end else begin

			readData1 = registradores[rs1];
			readData2 = registradores[rs2];

			atrasoDoclock1 <= writeRegister;
			atrasoDoclock2 <= atrasoDoclock1;

			if(regWrite == 1'b1) begin
				registradores[atrasoDoclock2] = writeData;
			end

			registradores[0] <= 32'b0;
		end
	end
endmodule