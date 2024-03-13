## Directory Specifications:

This directory contains example code illustrating different types of operators used in `SystemVerilog`.

*The suggested order to read the files is as follows:*

- **[Concatenation and Replication Operator](concatenation_replication.sv):**
  - Explores concatenation across different data types, explains differences between right-hand-side and left-hand-side concatenation.
  - Demonstrates replication using a constant number and a `'WIDTH` macro.

- **[Wildcard Equality Operator](wildcard_equality.sv):**
  - Delves into wildcard equality and inequality, highlighting their utility in comparing masked variables generated using XOR.

- **[Set Membership Operator](set_membership.sv):**
  - Showcases various usage scenarios of the set membership operator across different data types.
  - Explains its application in both conditional statements and constraint blocks.

- **[Streaming Operator](streaming_operator.sv):**
  - Demonstrates left and right streaming operators for SV and user-defined data types, detailing distinct behaviors for left-hand-side (LHS) and right-hand-side (RHS) assignments.
  - The [Example](pack_unpack_sample) offers a comprehensive demonstration of using the streaming operator within a class to execute pack and unpack operations.
    - It is advisable to explore this example after becoming familiar with object-oriented concepts in `SystemVerilog`.

