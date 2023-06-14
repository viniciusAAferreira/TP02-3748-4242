module aluControl(
    input wire clock,
    input wire [1:0] ALUOp,
    input wire [6:0] funct7,
    input wire [2:0] funct3,
    output reg [3:0] saida);

    always @(posedge clock)begin
        casex ({ALUOp, funct7, funct3})
            12'b00XXXXXXX010: saida <= 4'b0010; //add - load and Store - ld, lw, sd, sw
            12'b100000000000: saida <= 4'b0010; //add
            12'b11XXXXXXX000: saida <= 4'b0010; //add
            12'b100100000000: saida <= 4'b0110; //sub
            12'b01XXXXXXX000: saida <= 4'b0110; //beq
            12'b100000000111: saida <= 4'b0000; //and
            12'b100000000110: saida <= 4'b0001; //or
            12'b100000000001: saida <= 4'b0111; //bne
            12'b10XXXXXXX000: saida <= 4'b0111; //addi
            12'b100000000000: saida <= 4'b0111; //addi
            12'b000000000001: saida <= 4'b0000; //sll
        endcase
    end

endmodule