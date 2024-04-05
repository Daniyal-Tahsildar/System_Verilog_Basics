// EDA Playground issue: event_name.triggered() does not work with Synopsys VCS,   
// using Mentor Questa is recommended while working with triggered()

module top;

//events are used to synchronize processes in a component or accross
//various components
    event e1, e2, e3;
initial begin
   // @(e1); //verilog style of synchronizing
    wait(e1.triggered()); // SV style of synchronizing
    $display("Process_2");
    // triggereing e2
    -> e2;
end

initial begin
    @(e3);
    $display("Process_4");
end

initial begin
    $display("Without using event the order will be: \n\t Process_2 -> Process_4 -> Process_1 -> Process_3");
    $display("Process_1");
    -> e1;
end

initial begin
    @(e2);
    $display("Process_3");
    -> e3; 
end
endmodule