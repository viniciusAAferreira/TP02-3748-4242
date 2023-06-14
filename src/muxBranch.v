module muxBranch(
    input wire clock,
    input wire [31:0] entradaADD4,
    input wire [31:0] entradaADD,
    input wire branch,
    input wire saidaZeroALU,
    output reg [31:0] saida
);
    reg resutado;

    always @(posedge clock) begin
        resutado = 1'b0;
        if(branch == 1 && saidaZeroALU == 1)begin
            resutado = 1'b1;
        end
        if (resutado == 0) begin
            saida = entradaADD4;
        end
        if (resutado == 1) begin
            saida = entradaADD;
        end
    end
endmodule
