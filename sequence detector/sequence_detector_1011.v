// Sequence Detector for 1011
// Overlapping Mealy FSM

module sequence_detector_1011 (
    input  CLK,
    input  RESET,
    input  X,
    output reg Z
);

    reg [2:0] state, next_state;

    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;

    // State register
    always @(posedge CLK or posedge RESET) begin
        if (RESET)
            state <= S0;
        else
            state <= next_state;
    end

    // Next-state and output logic
    always @(*) begin

        next_state = S0;
        Z = 1'b0;

        case (state)

            // No bits matched
            S0: begin
                if (X == 1'b1)
                    next_state = S1;
                else
                    next_state = S0;
            end

            // Detected "1"
            S1: begin
                if (X == 1'b0)
                    next_state = S2;
                else
                    next_state = S1;
            end

            // Detected "10"
            S2: begin
                if (X == 1'b1)
                    next_state = S3;
                else
                    next_state = S0;
            end

            // Detected "101"
            S3: begin
                if (X == 1'b1) begin
                    Z = 1'b1;
                    next_state = S1;
                end
                else
                    next_state = S2;
            end

            default: begin
                next_state = S0;
                Z = 1'b0;
            end

        endcase

    end

endmodule