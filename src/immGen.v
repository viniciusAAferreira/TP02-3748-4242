module immGen (
    input wire clock,
    input wire [31:0] entrada,//erro
    output reg signed [31:0] saida
);
    always @(posedge clock) begin
        if (entrada[6:0] == 7'b0000011) begin // lw
            saida = {{21{entrada[31]}}, entrada[31:20]};
            saida = saida / 4;
        end
        if (entrada[6:0] == 7'b0100011) begin // sw
            saida = {{21{entrada[31]}}, entrada[31:25], entrada[11:7]};
            saida = saida / 4;
        end
        if (entrada[6:0] == 7'b0010011) begin // addi
            saida = {{20{entrada[31]}}, entrada[31:20]};
        end
        if (entrada[6:0] == 7'b1100011) begin // beq
            saida = { {21{entrada[31]}}, entrada[7], entrada[30:25], entrada[11:8]};
        end
    end

endmodule