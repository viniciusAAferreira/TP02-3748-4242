`include "src/add.v"
`include "src/add4.v"
`include "src/alu.v"
`include "src/pc.v"
`include "src/instructionMemory.v"
`include "src/dataMemory.v"
`include "src/register.v"
`include "src/control.v"
`include "src/aluControl.v"
`include "src/immGen.v"
`include "src/mux2pra1.v"
`include "src/muxBranch.v"

module main2(
    input wire reset,
    input wire clock
);

    wire [31:0] enderecoPC;
    wire [31:0] instrucao;
    wire [31:0] readData1;
    wire [31:0] readData2;

    wire [1:0] ALUop;
    wire ALUsrc;
    wire MenToReg;
    wire RegWrite;
    wire WriteRegiter;
    wire MenRead;
    wire MenWrite;
    wire Branch;

    wire [31:0] saidaImmGen;
    wire [3:0] saidaALUcontrol;
    wire [31:0] saidaALU;
    wire [31:0] saidaMuxALU;
    wire [31:0] saidaMuxDM;
    wire [31:0] saidaDM;
    wire [31:0] saidaADD4;
    wire [31:0] saidaADD;
    wire [31:0] saidaPC;
    wire saidaZeroALU;



    pc PC(
        .clock(clock),
        .reset(reset),
        .enderecoEntrada(enderecoPC),
        .enderecoSaida(saidaPC)
    );

    add4 ADD4(
        .clock(clock),
        .reset(reset),
        .saidaPC(saidaPC),
        .saida(saidaADD4)
    );

    instructionMemory IM(
        .clock(clock),
        .reset(reset),
        .endereco(saidaPC),
        .instrucao(instrucao)
    );

    control CONTROLE(
        .clock(clock),
        .opcodeDaInstrucao(instrucao[6:0]),
        .ALUSrc(ALUsrc),
        .MemToReg(MenToReg),
        .RegWrite(regWrite),
        .MemRead(MenRead),
        .MemWrite(MenWrite),
        .Branch(Branch),
        .ALUOp(ALUop)
    );

    register REGISTRADOR(
        .clock(clock),
        .regWrite(regWrite),
        .rs1(instrucao[19:15]),
        .rs2(instrucao[24:20]),
        .writeRegister(instrucao[11:7]),
        .writeData(saidaMuxDM),
        .readData1(readData1),
        .readData2(readData2)
    );

    immGen IG(
        .clock(clock),
        .entrada(instrucao),
        .saida(saidaImmGen)
    );

    aluControl CONTROLE_ALU(
        .clock(clock),
        .ALUOp(ALUop),
        .funct7(instrucao[31:25]),
        .funct3(instrucao[14:12]),
        .saida(saidaALUcontrol)
    );

    mux2pra1 MuxALU(
        .clock(clock),
        .entrada1(readData2),
        .entrada2(saidaImmGen),
        .controle(ALUsrc),
        .saida(saidaMuxALU)
    );

    alu ALU(
        .clock(clock),
        .ALUcontrol(saidaALUcontrol),
        .entrada1(readData1),
        .entrada2(saidaMuxALU),
        .saida(saidaALU),
        .Zero(saidaZeroALU)
    );


    dataMemory DM(
        .clock(clock),
        .reset(reset),
        .MemWrite(MenWrite),
        .MemRead(MenRead),
        .enderecoDeEntrada(saidaALU),
        .writeData(readData2),
        .readData(saidaDM)
    );


    mux2pra1 MuxDM(
        .clock(clock),
        .entrada1(saidaALU),
        .entrada2(saidaDM),
        .controle(MenToReg),
        .saida(saidaMuxDM)
    );

    add ADD(
        .clock(clock),
        .reset(reset),
        .saidaPC(saidaPC),
        .saidaImmGen(saidaImmGen),
        .saida(saidaADD)
    );

    muxBranch Muxbranch(
        .clock(clock),
        .entradaADD4(saidaADD4),
        .entradaADD(saidaADD),
        .branch(branch),
        .saidaZeroALU(aluZero),
        .saida(enderecoPC)
    );



endmodule