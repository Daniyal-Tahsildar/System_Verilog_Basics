<h3 align="left">## Directory Specifications: </h3>

This directory contains example code illustrating different types of arrays used in `SystemVerilog`.

*The suggested order to read the files is as follows:*

- **[Packed and Unpacked arrays](packed_unpacked_arrays.sv):**
  - Explains the distinction in memory allocation and array operations between packed and unpacked arrays.

- **[Multidimensional arrays](multidimentional_arrays.sv):**
  - Discusses various methods of declaring multidimensional arrays, array allocation, and memory utilization.

- **[Dynamic arrays and Static arrays](dynamic_arrays.sv):**
  - Highlights the differences between static and dynamic arrays.
  - Demonstrates different usage scenarios of `new()` and other dynamic array methods.
 
- **[Queues](queues.sv):**
  - Explores different queue types, data allocation, and access methods.
  - The [Example](queue_and_DA.sv) showcases how queues integrate with Dynamic arrays and accessing queue elements at specific locations.

- **[Associative arrays](associative_arrays):**
  - Illustrates various ways of declaring associative arrays and accessing elements.
  - Explains how queues can be assigned associative array data and index values.
  - Presents different associative array methods.
  - Offers an example demonstrating associative arrays' behavior as linked lists.

- **[Array manipulation methods](Array_manipulation_methods):**
  - Encompasses searching, ordering, and reduction methods used across different array types: static arrays, dynamic arrays, queues, and associative arrays.
  - Clarifies the usage of the `with()` clause with various examples.
  - Discusses [array locator methods](array_locator.sv), [array ordering methods](array_ordering.sv), and [array reduction methods](array_reduction.sv) in detail.
