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
    protected bit [55:0] preamble; //local can only be accessed by this class
    
    protected rand bit [47:0] sa;

    protected rand bit [7:0] len;
    protected rand bit [7:0] payload[$]; //queue of octets
    protected static int count;
//methods
    function new();
        preamble = {28{2'b10}};
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
    constraint sa_c{
        sa inside {[100:150]};
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
    $display("\tpreamble = %h", preamble);
    $display("\tsa = %h", sa);
    $display("\tlen = %0d", len);
    $display("\tpayload = %p", payload);
    $display("\tcount = %0d\n", count);
endfunction

function void sample_pkt::copy(output sample_pkt pkt);
    pkt = new();
    pkt.pkt_type = pkt_type;
    pkt.preamble = preamble;
    pkt.sa = sa;
    pkt.len = len;
    pkt.payload = payload;
    pkt.count = count;
endfunction

function bit sample_pkt::compare(sample_pkt pkt);
    if ( pkt_type == pkt.pkt_type
    && preamble == pkt.preamble 
    && sa == pkt.sa 
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
    byteQ = {>>byte{preamble, sa, len, payload}};
endfunction

function void sample_pkt::unpack(input byte byteQ[$]);
    preamble = {byteQ[0], byteQ[1], byteQ[2], byteQ[3], byteQ[4], byteQ[5], byteQ[6]};
    sa = {byteQ[7], byteQ[8], byteQ[9], byteQ[10], byteQ[11], byteQ[12]};
    len = byteQ[13];
    for(int i = 0; i < len; i++) begin
        payload[i] = byteQ[14+i];
        //payload.push_back(byteQ[14+i]); also works here
    end
    if (len inside {[1:20]}) pkt_type = SMALL;
    if (len inside {[21:100]}) pkt_type = MEDIUM ;
    if (len inside {[101:255]}) pkt_type = LARGE;
endfunction

