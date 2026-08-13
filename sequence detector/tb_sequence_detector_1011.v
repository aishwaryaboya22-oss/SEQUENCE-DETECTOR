`timescale 1ns/1ps

module tb_sequence_detector_1011;

    reg CLK;
    reg RESET;
    reg X;
    wire Z;

    // Instantiate sequence detector
    sequence_detector_1011 DUT (
        .CLK(CLK),
        .RESET(RESET),
        .X(X),
        .Z(Z)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    // Generate waveform
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_sequence_detector_1011);
    end

    // Task to send one input bit
    task send_bit;
        input bit_value;
        begin
            X = bit_value;
            #10;

            $display("Time = %0t | Input = %b | Output = %b",
                     $time, X, Z);
        end
    endtask

    initial begin

        $display("-----------------------------------------");
        $display("     1011 Sequence Detector");
        $display("-----------------------------------------");
        $display("Time | Input | Output");
        $display("-----------------------------------------");

        // Reset
        RESET = 1;
        X = 0;
        #10;

        RESET = 0;

        // Input sequence: 1011
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);

        // Additional bits
        send_bit(0);
        send_bit(1);
        send_bit(1);

        // Another 1011
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);

        #10;

        $finish;

    end

endmodule