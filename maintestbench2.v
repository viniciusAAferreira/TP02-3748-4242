`include "main2.v"

module maintestbench2();

    reg reset;
    reg clock;
    main2 maintestbench2(reset, clock);

    integer i;

    always begin
        #1 clock = !clock;
        #1 clock = !clock;
        #1 clock = !clock;
        #1 clock = !clock;
        for (i = 0; i < 32; i++) begin
            $display("Registradores %d:    %d", i, maintestbench2.REGISTRADOR.registradores[i]);
        end
        if (maintestbench2.IM.instrucao == 0) begin
            $display("######TERMINOU!######");
            $finish;
        end
        $display("\n\n"); 

        
    end

    initial begin
        $dumpfile("maintestbench2.vcd");
        $dumpvars(0, maintestbench2);
        clock = 0;
        reset = 1;
        #1 clock = !clock;
        #4
        reset = 0;
        #130 $finish;
    end
endmodule