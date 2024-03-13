//Sequence detector - 10110
//moore FSM
module fsm(
    input clk, rst,
    input in,
    output reg out
);
  
  typedef enum bit [2:0] {s0 , s1, s2 , s3 , s4 , s5} state_t;
  
  state_t state, next_state;

// parameter s0 =3'b000 , s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100 , s5 = 3'b101 ;
// reg [2:0] state, next_state;

    always @(posedge clk) begin
        if (rst) begin
            state <= s0;
        end
        else begin
            state <=next_state;
        end

    end

    always @(*) begin
        out = 1'b0;
        next_state = state;
        
        case(state)
            s0: begin
                if (in == 1'b1) next_state = s1;
                //else next_state = s0;
            end

            s1: begin
                if (in == 1'b0) next_state = s2;
                //else next_state = s1;
            end

            s2: begin
                if (in == 1'b1) next_state = s3;
            // else next_state = s0;
            end

            s3: begin
                if (in == 1'b1) next_state = s4;
                //else next_state = 20;
            end

            s4: begin
            if (in == 1'b0) begin
                next_state = s5;
            end
                //else next_state = s1;
            end

            s5: begin
                out = 1'b1;

                if (in == 1'b1) next_state = s3;
            // else next_state = s0;
            end
        endcase
    end
endmodule