module add4(
    input wire clock,
    input wire reset,
    input wire [31:0] saidaPC,
    output reg [31:0] saida
);

    always @(posedge clock) begin
        if (reset) begin
            saida = 32'b0;
        end
        else begin
            saida = saidaPC + 32'b1;
        end
    end
endmodule