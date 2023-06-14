module mux2pra1(
    input wire clock,
    input wire [31:0] entrada1,
    input wire [31:0] entrada2,
    input wire controle,
    output reg [31:0] saida);

    always @(posedge clock) begin

        if (controle == 0) begin
            saida <= entrada1;
        end

        if (controle == 1) begin
            saida <= entrada2;
        end

    end

endmodule