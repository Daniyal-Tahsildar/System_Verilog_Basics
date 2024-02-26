module sample_MA;
    logic [7:0] mema [0:15]; // 2d array with 16 elements each of 8 bits
    logic [7:0] [3:0] memb [0:3]; // 3d array with 4 elements, each of which holds 8 elements of 4 bits

    initial begin
        foreach(mema[i]) begin
            mema[i] = $urandom_range(10, 150);
        end

        foreach(memb[j,k]) begin
            memb[j][k] = $urandom_range(0, 15);
        end

        $display("mema = %p", mema);
        $display("memb = %p", memb);
    // Individually accessing elements
        $display("2nd element of mema mema[1]= %0d : %0b",mema[1], mema[1]);
        $display("\t3rd bit mema[1][3]= %0d ",mema[1][2]);

        $display("3rd element of memb memb[2]= %p",memb[2]);
        $display("\t4th element of memb[2] memb[2][3]= %0d",memb[2][3]);
        $display("\t\t reads left to right since we have assigned MSB:LSB (7:0)");

    end

endmodule