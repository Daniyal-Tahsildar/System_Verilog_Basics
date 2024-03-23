## Directory Specifications:

This directory contains example code explaining Object Oriented Programming in `SystemVerilog`. It discusses, properties (fields/variables), methods (tasks/functions) and their usage. 

*The suggested order to read the files is as follows:*

- **[Simple Class](simple_class.sv):**
  - Explains how a class is defined, its attributes and creating a class instance (object).

- **[Properties](properties):**
  - Discusses various types of properties: protected, local, rand, randc, static and automatic.
  - explains how different types of properties are used, enabling and disabling randomization for specific properties 

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
  - Discusses [array locator methods](Array_manipulation_methods/array_locator.sv), [array ordering methods](Array_manipulation_methods/array_ordering.sv), and [array reduction methods](Array_manipulation_methods/array_reduction.sv) in detail.
