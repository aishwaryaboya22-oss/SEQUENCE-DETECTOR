// 4-bit Johnson Counter

module johnson_counter_4bit (
    input       CLK,
    input       RESET,
    output reg [3:0] Q
);

    always @(posedge CLK or posedge RESET) begin
        if (RESET)
            Q <= 4'b0000;
        else
            Q <= {~Q[0], Q[3:1]};
    end

endmodule