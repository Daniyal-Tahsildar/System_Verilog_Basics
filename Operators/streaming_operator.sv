module mul_div;
//streaming operator shifts data into the queue
    // << left shift: first item will be last in the queue (reversal)
    // >> right shift: first item will be first in the queue
    bit [7:0] num; 
    bit [7:0] num1;
    bit [7:0] num2;
    bit [7:0] num3;
    bit[7:0] shift_Q[$];
  
      initial begin
        num = 3; 
        num1 = 19; 
        num2 = 16;       
        num3 = 12; 
  
        shift_Q = {<<byte{num, num1, num2, num3}};

        $display("Elemets to be pushed into the queue");
        $display("\t num = %0d, num1 = %0d, num2 = %0d, num3 = %0d,", num, num1, num2, num3);

        $display("##################################"); 
        $display(" Left(<<) shift_Q = %p",shift_Q);
        $display("Element at 0 index (first element) of shift_Q = %0d",shift_Q[0]);
        $display("##################################"); 
    
    //deleting queue elements, can also be done using shift_Q.delete()
        shift_Q = {};

        $display("Right shifting elements into queue"); 
        shift_Q = {>>byte{num, num1, num2, num3}};

        $display("##################################"); 
        $display(" Right(>>) shift_Q = %p",shift_Q);
        $display("Element at 0 index (first element) of shift_Q = %0d",shift_Q[0]);
        $display("##################################"); 

      end
  
  endmodule