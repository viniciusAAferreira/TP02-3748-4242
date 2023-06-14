module control(
    input wire clock,
    input [6:0] opcodeDaInstrucao,
    output reg ALUSrc,
    output reg MemToReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg [1:0] ALUOp);

    //LD, SD, LW, SW, BNE
    always @(posedge clock) begin
        case (opcodeDaInstrucao)
            7'b0110011: begin//R-type - ADD, SUB, AND, OR, XOR, SLL
                ALUSrc <= 0;
                MemToReg <= 0;
                RegWrite <= 1;
                MemRead <= 0;
                MemWrite <= 0;
                Branch <= 0;
                ALUOp <= 2'b10;
            end

            7'b0000011: begin//LOAD
                ALUSrc <= 1;
                MemToReg <= 1;
                RegWrite <= 1;
                MemRead <= 1;
                MemWrite <= 0;
                Branch <= 0;
                ALUOp <= 2'b00;
            end

            7'b0100011: begin//STORE
                ALUSrc <= 1;
                MemToReg <= 0;
                RegWrite <= 0;
                MemRead <= 0;
                MemWrite <= 1;
                Branch <= 0;
                ALUOp <= 2'b00;
            end

            7'b1100011: begin//BEQ
                ALUSrc <= 0;
                MemToReg <= 0;
                RegWrite <= 0;
                MemRead <= 0;
                MemWrite <= 0;
                Branch <= 1;
                ALUOp <= 2'b01;
            end

            7'b0010011: begin // Tipo-I - ADDI
                ALUSrc <= 1;
                MemToReg <= 0;
                RegWrite <= 1;
                MemRead <= 0;
                MemWrite <= 0;
                Branch <= 0;
                ALUOp <= 2'b11;
            end

            default: begin
                ALUSrc <= -1;
                MemToReg <= -1;
                RegWrite <= 0;
                MemRead <= 0;
                MemWrite <= 0;
                Branch <= 1;
                ALUOp <= 2'b11;
            end
        endcase
    end
endmodule