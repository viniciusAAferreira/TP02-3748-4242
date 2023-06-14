module alu(
    input wire clock,
    input wire [3:0] ALUcontrol,
    input wire [31:0] entrada1,
    input wire [31:0] entrada2,
    output reg [31:0] saida,
    output reg Zero);


    always @(posedge clock) begin

        case (ALUcontrol)

            4'b0000: begin
               saida <= entrada1 & entrada2;
               Zero = 1'b0;
            end

            4'b0001: begin
                saida <= entrada1 | entrada2;
                Zero = 1'b0;
            end

            4'b0010: begin
                saida <= entrada1 + entrada2;
                Zero = 1'b0;
            end

            4'b0110: begin
                saida <= entrada1 - entrada2;

                if (saida == 0) begin
                    Zero = 1'b1;
                end else begin
                    Zero = 1'b0;
                end
            end
        endcase
    end

endmodule