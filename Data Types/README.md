## Directory Specifications:

This directory contains example code illustrating different data types used in `SystemVerilog`.

*The suggested order to read the files is as follows:*

- **[Integral and Real type](integral_and_real.sv):**
  - Delves into different integral and real data types, covering default values and sizes.
  - Explores the flexibility of switching default values between signed and unsigned.

- **[Strings](strings.sv):**
  - Discusses various string manipulation methods and conversions.

- **[Enum type](enum_type.sv):**
  - Demonstrates diverse applications of enums and customizing default values.
  - The [Example](complex%20examples/FSM_using_typedef_enum.sv) showcases how enums can streamline FSM code design. 
 
- **[User-Defined types](user_defined.sv):**
  - Examines various uses of `typedef` and the creation of queues with user-defined types.
  - The [Example](complex%20examples/typedef_class.sv) illustrates how `typedef` facilitates arrays of queues of class types.

- **[Structure type (struct)](structure_type):**
  - Illustrates the creation of structures using `struct` and the establishment of queues containing struct elements.
  - The [Example](complex%20examples/sort_using_struct.sv) demonstrates the benefits of using `struct` when managing multiple SV objects.

- **[Void type](void_type.sv):**
  - Clarifies the usage of `void` within SystemVerilog functions through a simple class definition and function.
 

