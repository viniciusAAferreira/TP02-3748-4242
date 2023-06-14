module pc (
    input wire clock,
    input wire reset,
    input wire [31:0] enderecoEntrada,
    output reg [31:0] enderecoSaida);

    always @(posedge clock) begin

        if (reset) begin
            enderecoSaida = 31'b0;
        end
        else begin
            enderecoSaida = enderecoEntrada;
        end

        
    end

endmodule