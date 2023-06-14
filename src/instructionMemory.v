module instructionMemory(
    input wire clock,
    input wire reset,
    input wire [31:0] endereco,
    output reg [31:0] instrucao);


    reg [31:0] instrucoes [0:31];

    always @(posedge clock) begin
        if (reset) begin

            // Instruções:
            instrucoes[0]<= 32'b00000110010000000000000110010011; // ADDI x3, x0, 100
            instrucoes[1]<= 32'b00001100100000000000001000010011; // ADDI x4, x0, 200
            instrucoes[2]<= 32'b00010010110000000000001010010011; // ADDI x5, x0, 300
            instrucoes[3]<= 32'b00011001000000000000001100010011; // ADDI x6, x0, 400
            instrucoes[4]<= 32'b00000000010000011000001110110011; // ADD x7, x3, x4
            instrucoes[5]<= 32'b01000000010000011000010000110011; // SUB x8, x3, x4
            instrucoes[6]<= 32'b00000000001000110111010010110011; // AND x9, x6, x2
            instrucoes[7]<= 32'b00000000001000110110010100110011; // OR x10, x6, x2
            instrucoes[8]<= 32'b00000000000000000000000000000000; // SW x2, 0(x0)
            instrucoes[9]<= 32'b00000000000000000000000000000000; // SW x6, 0(x0)
            instrucoes[10] <= 32'b00000000000000000000000000000000; // LW x7, 0(x0)
            instrucoes[11] <= 32'b00000000000000000000000000000000; // LW x8, 0(x0)
            instrucoes[12] <= 32'b00000000010100011100001100110011; // XOR x6, x3, x5
            instrucoes[13] <= 32'b00000000001000101000001010110011; // ADD x5, x5, x2
            instrucoes[14] <= 32'b00000000001000110000001100110011; // ADD x6, x6, x2
            instrucoes[15] <= 32'b00000000111000111001011001100111; // BNE x7, x14, 12
            instrucoes[16] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[17] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[18] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[19] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[20] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[21] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[22] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[23] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[24] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[25] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[26] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[27] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[28] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[29] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[30] <= 32'b00000000000000000000000000000000; // Instrução vazia
            instrucoes[31] <= 32'b00000000000000000000000000000000; // Instrução vazia


        end else begin
            instrucao = instrucoes[endereco];
        end
    end

endmodule