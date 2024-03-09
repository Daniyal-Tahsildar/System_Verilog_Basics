module mul_div;
//streaming operator shifts data into the queue
  // << left shift: first item will be last in the queue (reversal)
  // >> right shift: first item will be first in the queue

  bit [7:0] num, num1, num2, num3; 
  bit[7:0] shift_Q[$];

  // using typedef to create a data type 
  typedef bit[15:0] data_t;
  data_t num_combined_1, num_combined_2;

  initial begin
    num = 1; 
    num1 = 2; 
    num2 = 3;       
    num3 = 4; 

    $display("Elemets to be pushed into the queue");
    $display("\t num = %0d, num1 = %0d, num2 = %0d, num3 = %0d,", num, num1, num2, num3);

// streaming operator on RHS 
  // Left shift
    shift_Q = {<<byte{num, num1, num2, num3}};
    $display(" Left(<<) shift_Q = %p",shift_Q);
    $display("Element at 0 index (first element) of shift_Q = %0d",shift_Q[0]);
    $display("##################################"); 

  //deleting queue elements, can also be done using shift_Q.delete()
    shift_Q = {};

  // Right shift
    shift_Q = {>>byte{num, num1, num2, num3}};
    $display(" Right(>>) shift_Q = %p",shift_Q);
    $display("Element at 0 index (first element) of shift_Q = %0d",shift_Q[0]);
    $display("##################################"); 

// streaming operator on LHS, for data_t type
    {>>data_t{num_combined_1, num_combined_2}} = shift_Q;
    $display("num_combined_1 = %b \nnum_combined_2 = %b",num_combined_1, num_combined_2);

  // checking if the result matches with the concatinated values of the numbers
    if (({num, num1}== num_combined_1) &&({num2, num3}== num_combined_2)) begin
      $display("\tData match");
    end
    else $display("\tData mismatch");

  end  
endmodule