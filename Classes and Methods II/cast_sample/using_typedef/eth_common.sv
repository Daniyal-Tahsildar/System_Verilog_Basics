typedef enum bit [1:0]{
    GOOD = 2'b00,
    BAD,
    ILL
} pkt_type_t;

class eth_common;
 static mailbox gen2bfm_mbox = new();

endclass