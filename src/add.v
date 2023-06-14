module add(
    input wire clock,
    input reset,
    input wire [31:0] saidaPC,
    input wire [31:0] saidaImmGen,
    output reg [31:0] saida
);
    wire [31:0] mudancaIMM;

    assign mudancaIMM = (saidaImmGen <<< 1);

    always @(posedge clock) begin
        if (reset) begin
            saida = 32'b0;
        end
        else begin
            saida = saidaPC + (mudancaIMM);
        end
    end
endmodule