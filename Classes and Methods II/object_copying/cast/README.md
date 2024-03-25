## Directory Specifications:

This directory contains example code illustrating different usecases of casting. Dive into these examples to gain a deeper understanding of how casting can be utilized effectively.

*The suggested order to read the files is as follows:*

- **[Simple Cast](simple_cast.sv):**
  - Illustrates the difference between static and dynamic casting.
  - Demonstrates dynamic casting as both a function and a task.

- **[Cast using a bit variable](using_bit_variable):**
  - Demonstrates dynamic casting in a test environment by assigning different packet types based on a bit vector value.
  - Utilizes inline constraints to specify different packet types.
  - File Specifications:
    - [top.sv](using_bit_variable/top.sv): Contains the top module running the test environment.
    - [common.sv](using_bit_variable/common.sv): Includes common parameters required by the test environment. (Mailboxes are discussed in the Inter-process synchronization section - [TODO]().)
    - [sample_pkt.sv](using_bit_variable/sample_pkt.sv): Transaction class with different types of packets derived from it.
    - [sample_env.sv](using_bit_variable/sample_env.sv): Encapsulates the driver and generator.
    - [sample_gen.sv](using_bit_variable/sample_gen.sv): Generates different types of packets randomly based on a bit vector.
    - [sample_drv.sv](using_bit_variable/sample_drv.sv): Receives packets from the generator and performs functionality based on the packet type received.

- **[Cast using a typedef](using_typedef):**
  - Utilizes a typedef to define different packet types instead of a bit vector.
  - Inline constraints are used to specify different packet types.
  - Modifications are made in [common.sv](using_typedef/common.sv), [sample_gen.sv](using_typedef/sample_gen.sv), and [sample_drv.sv](using_typedef/sample_drv.sv). The transaction class ([sample_pkt.sv](using_typedef/sample_pkt.sv)) now uses an enum type instead of a bit vector for packet types.

- **[Cast using a typedef class constraints](using_typedef_with_constraints):**
  - Each packet class implements its own constraints, eliminating the need for inline constraints in the generator.
  - Changes are made in [sample_pkt.sv](using_typedef/sample_pkt.sv) and [sample_gen.sv](using_typedef/sample_gen.sv).

Explore these examples to enhance your understanding of casting and its applications in SystemVerilog. Happy coding!
