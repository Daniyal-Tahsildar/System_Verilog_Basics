## Directory Specifications:

This directory contains example code illustrating usage of events.

*The suggested order to read the files is as follows:*

- **[Simple Event](simple_event.sv):**
  - Clarifies the differences between event triggering in `Verilog` and `SystemVerilog`.
  - Illustrates event usage for synchronizing multiple processes.

- **[Event Operations](operations_on_event.sv):**
  - Explores operations such as merging events and null assignment to events.

- **[Event Sequencing](event_sequencing.sv):**
  - Demonstrates event sequencing through `wait_order()`.

- **[Generator and Driver Event](gen_drv_event.sv):**
  - Explores event usage in testbench development with a basic generator and driver class.
  - The generator initiates new transactions only when the driver completes the current one.
  - Synchronization among testbench components is achieved by passing a single event to each component.
