module display7Segmentos(
    input wire [3:0] pc,
    input wire clock,
    input wire reset,
    output wire [6:0] segmento
);

always @(posedge clock || posedge reset) begin
    if (reset)
        pc <= 4'b0000;
    else
        pc <= pc + 1;
end

always @(pc) begin
    case(pc)
        4'b0000: segmento = 7'b1000000; // 0
        4'b0001: segmento = 7'b1111001; // 1
        4'b0010: segmento = 7'b0100100; // 2
        4'b0011: segmento = 7'b0110000; // 3
        4'b0100: segmento = 7'b0011001; // 4
        4'b0101: segmento = 7'b0010010; // 5
        4'b0110: segmento = 7'b0000010; // 6
        4'b0111: segmento = 7'b1111000; // 7
        4'b1000: segmento = 7'b0000000; // 8
        4'b1001: segmento = 7'b0011000; // 9
        default: segmento = 7'b1111111;  // blank
    endcase
end

endmodule