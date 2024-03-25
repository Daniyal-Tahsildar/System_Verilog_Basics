## Directory Specifications:

This repository contains illustrative code snippets to aid in understanding Object-Oriented Programming concepts in `SystemVerilog`. Each section focuses on different aspects of OOP, including class definition, properties, inheritance, constructors, methods, and variable scoping.

*The suggested order to read the files is as follows:*

- **[Simple Class](simple_class.sv):**
  - Introduces basic class definition, attributes, and object instantiation.

- **[Properties](properties):**
  - Explores various property types such as protected, local, rand, randc, static, and automatic.
  - Demonstrates enabling and disabling randomization for specific properties.

- **[Class Inheritance](class_inheritance.sv):**
  - Demonstrates inheritance, showing how derived classes access base class properties and methods.
 
- **[Different ways of using new() constructor](different_new.sv):**
  - Explores different methods of instantiating the `new()` constructor.
  - Discusses default definitions, field instantiation, `new()` arguments, and default `new()` arguments.
    
- **[Methods](methods):**
  - Illustrates various method implementations, including `copy()` and `compare()` functions.
  - Demonstrates task execution in simulation time and explains the use of `this`, `super`, static methods, and virtual methods.

- **[Null Check](null_check.sv):**
  - Emphasizes the importance of null checks for ensuring proper memory allocation for objects.

- **[Variable Scope](variable_scope.sv):**
  - Clarifies the distinction between global and local scope and accessing variables across different scopes.
