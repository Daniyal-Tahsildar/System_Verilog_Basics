## Directory Specifications:

This directory is a continuation of **[Classes and Methods I](../Classes%20and%20Methods%20I)**. It delves deeper into Object-Oriented Programming in `SystemVerilog`, featuring complex examples showcasing advanced features for classes and methods.

*The suggested order to read the files is as follows:*

- **[Extern Methods](extern_usage.sv):**
  - Demonstrates `extern` usage for methods and scope resolution for assigning these methods to their respective classes.
  - Illustrates `typedef` usage inside a class as a return argument for extern methods.

- **[Constant Class Properties](const_class_property.sv):**
  - Explores the usage of `const` properties, emphasizing the distinction between global constant and instance constant.

- **[Pure Virtual Methods](pure_virtual.sv):**
  - Explores abstract classes and pure virtual methods.
  - Explains how each derived class can have different implementations of a pure virtual method.

- **[Polymorphism with Inherited Classes](inheritance_and_polymorphism):**
  - Features a simple test environment for packet transactions.
  - Demonstrates the use of forward declaration in the top file to prevent errors.
  - Shows how polymorphism operates in a test environment where different derived classes are assigned to a base class, and the implemented functionality is selected according to the assigned derived class.

- **[Class Parameterization](class_parameterization):**
  - Explores parameterized classes, covering value and type parameterization.
  - Demonstrates how class objects behave differently based on parameterization and its usage in derived classes.

- **[Interface Classes](interface_class.sv):**
  - Illustrates implementing interface classes for a FIFO.
  - Explains parameterization's role in interface classes.

- **[Nested Classes](nested_scope.sv):**
  - Explains nested classes and how to access different levels of the nest using scope resolution.

- **[Object Copying](object_copying):**
  - Demonstrates various methods of copying class instances: copy by handle, shallow copy, deep copy, and casting.
  - The casting section illustrates how casting works for test environments. Please refer to the [README](object_copying/cast//README.md) for more details. 
