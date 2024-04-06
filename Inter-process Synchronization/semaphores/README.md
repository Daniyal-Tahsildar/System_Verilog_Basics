## Directory Specifications:

This directory contains illustrative code demonstrating the use of semaphores in `SystemVerilog`.

*The suggested order to read the files is as follows:*

- **[Semaphore Usage and Methods](semaphore_usage_and_methods.sv):**
  - Provides insights into semaphore usage in scenarios with limited resources and their creation with specified keys.
  - Demonstrates various methods available for semaphores.

- **[Sharing Resources Using Semaphore](sharing_resource_using_semaphore):**
  - Illustrates semaphore utilization in a test environment featuring two drivers and one generator.
  - Elaborates on how semaphores serve as arbiters for the two drivers, granting them alternate access.
