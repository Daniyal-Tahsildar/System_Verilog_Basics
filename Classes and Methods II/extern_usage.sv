//typedef enum is used to create user defined data-types
typedef enum bit[1:0] {
    SMALL = 2'b00,
    MEDIUM = 2'b01,
    LARGE = 2'b10
}pkt_type_t;
class sample_pkt;
    //properties
    rand pkt_type_t pkt_type; //pkt_type can take any value

    //its good practice to keep class properties protected
    protected bit [55:0] sync; 
    protected rand bit [47:0] addr;
    protected rand bit [7:0] len;
    protected rand bit [7:0] payload[$]; //queue of octets
    protected static int count;
//methods
    function new();
        sync = {28{2'b10}};
        count++;  //everytime sample_pkt class has new instantiation, count gets incremented
    endfunction

//extern functions make the code more readable by defining only the function prototype
// The function can be implemented outside the class or in a seperate file
    extern function void print(string name = "sample_pkt");
    extern function void copy(output sample_pkt pkt);
    extern function bit compare(sample_pkt pkt);
    extern function void pack(output byte byteQ[$]);
    extern function void unpack(input byte byteQ[$]);
       
//constraints
//these constraints are only for sample puropses, they hold no explicit meaning
    constraint addr_c{
        addr inside {[100:150]};
    }

    constraint len_c{
        len inside{[5:10]};
    }

    constraint payload_c{
        payload.size() == len;
        foreach(payload[i]){
            payload[i] inside{8'h1F, 8'h5F};
        }
    }

    constraint pkt_type_c{
        (pkt_type == SMALL) -> (len inside {[1:20]});
        (pkt_type == MEDIUM) -> (len inside {[21:100]});
        (pkt_type == LARGE) -> (len inside {[101:255]});
    }

endclass

//Functions defined in sample_pkt class using extern
//Use the scope resolution operator (::) to assign these functions to respective classes 
function void sample_pkt::print(string name = "sample_pkt");
    $display(name);
    $display("\tpkt_type = %s", pkt_type);
    $display("\tsync = %h", sync);
    $display("\taddr = %h", addr);
    $display("\tlen = %0d", len);
    $display("\tpayload = %p", payload);
    $display("\tcount = %0d\n", count);
endfunction

function void sample_pkt::copy(output sample_pkt pkt);
    pkt = new();
    pkt.pkt_type = pkt_type;
    pkt.sync = sync;
    pkt.addr = addr;
    pkt.len = len;
    pkt.payload = payload;
    pkt.count = count;
endfunction

function bit sample_pkt::compare(sample_pkt pkt);
    if ( pkt_type == pkt.pkt_type
    && sync == pkt.sync 
    && addr == pkt.addr 
    && len == pkt.len 
    && payload == pkt.payload) begin
        $display("\tPackets match");
        return 1;
    end
    else begin
        $display("\tPackets mismatch");
        return 0; 
    end
endfunction

function void sample_pkt::pack(output byte byteQ[$]);
    byteQ = {>>byte{sync, addr, len, payload}};
endfunction

function void sample_pkt::unpack(input byte byteQ[$]);
    sync = {byteQ[0], byteQ[1], byteQ[2], byteQ[3], byteQ[4], byteQ[5], byteQ[6]};
    addr = {byteQ[7], byteQ[8], byteQ[9], byteQ[10], byteQ[11], byteQ[12]};
    len = byteQ[13];
    for(int i = 0; i < len; i++) begin
        payload[i] = byteQ[14+i];
        //payload.push_back(byteQ[14+i]); also works here
    end
    if (len inside {[1:20]}) pkt_type = SMALL;
    if (len inside {[21:100]}) pkt_type = MEDIUM ;
    if (len inside {[101:255]}) pkt_type = LARGE;
endfunction


// Top module
module top;   
    sample_pkt pkt, pkt_1, pkt_2;
    byte dataQ[$];

    initial begin
        pkt = new();
    //randomization
        assert(pkt.randomize());
    //printing
        pkt.print("sample_pkt");
    //copy pkt to pkt_1
        $display("*****Copy pkt to pkt_1*****");
        pkt.copy(pkt_1);
        pkt_1.print("sample_pkt_1");
    //compare
        $display("*****Compare pkt to pkt_1*****");
        assert(pkt.compare(pkt_1));
    //pack pkt in dataQ
        $display("*****Packing pkt into dataQ*****");
        pkt.pack(dataQ);
    //unpack dataQ to pkt_2
        pkt_2 = new();
        $display("*****Unpacking dataQ into pkt_2*****");
        pkt_2.unpack(dataQ);
        pkt_2.print("sample_pkt_2");

    //comapring again
        $display("*****Compare pkt to pkt_2*****");
        assert(pkt.compare(pkt_2));
    //printing
        pkt_1.print("sample_pkt_1");
        pkt_2.print("sample_pkt_2");
    end
endmodule