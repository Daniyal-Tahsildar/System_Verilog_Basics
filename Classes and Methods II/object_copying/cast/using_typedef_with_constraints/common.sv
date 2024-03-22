typedef enum bit [1:0]{
    GOOD = 2'b00,
    BAD,
    ILL
} pkt_type_t;

class common;
 static mailbox gen2drv_mbox = new();

endclass