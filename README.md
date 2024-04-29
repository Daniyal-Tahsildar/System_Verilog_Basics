***Note:*** *This repository receives continuous updates. To ensure you have the latest content, consider forking or cloning it periodically.*

---

## Introduction:
SystemVerilog, an extension of Verilog, is a hardware description and verification language widely adopted in the semiconductor industry for designing and verifying complex digital systems. This repository primarily focuses on explaining SystemVerilog concepts and testbench development for verification using the language. Here, you'll find comprehensive explanations, examples, best practices and variations for SystemVerilog methods and functions usage whereever applicable. 

The [System_Verilog_Basics](System_Verilog_Basics.pdf) document offers comprehensive notes on each topic covered in this repository. It is recommended to review the documentation before exploring the code provided here.

## Prerequisites:
To make the most out of this tutorial, a foundational understanding of digital logic, Verilog (or VHDL), and simulators is required. All code snippets provided have undergone testing using tools such as Mentor Questa 2021.3 and Synopsys VCS 2021.03, both available on [EDA Playground](https://www.edaplayground.com/).

# 

### *Recommended Reading Order:*
The suggested reading order begins with foundational concepts, starting from data types, and progresses to the development of sophisticated testbenches.

- **[Data Types](Data%20Types):**
  - Delve into a spectrum of integral and real data types, covering default values, sizes, and various string manipulation methods.
  - Explore diverse applications of enums, examine `typedef` usage, and clarify the usage of `struct`, and `void` within SystemVerilog functions.

- **[Operators](Operators):**
  - Explore concatenation and replication across different data types, along with wildcard equality and inequality.
  - Showcase various usage scenarios of the set membership operator and left and right streaming operators for SV and user-defined data types.

- **[Arrays](Arrays):**
  - Understand the differences between packed and unpacked arrays, including multidimensional, static, and dynamic arrays.
  - Explore various queue types, associative arrays, and array methods such as searching, ordering, and reduction methods.
 
- **[Classes and Methods I](Classes%20and%20Methods%20I):**
  - Introduces basic class definition, attributes, object instantiation, and property types.
  - Demonstrates inheritance, different `new()` constructor instantiations, and method implementations, including the use of `this`, `super`, static, and virtual methods.
  - Emphasizes null checks, global vs. local scope distinction.
 
- **[Classes and Methods II](Classes%20and%20Methods%20II):**
  - Demonstrates `extern` usage and explores `const` properties.
  - Explores abstract classes, pure virtual methods, and polymorphism operation in test environments.
  - Illustrates parameterized and interface class implementations and demonstrates various methods of copying class instances.
 
- **[Compiler Directives](Compiler%20Directives):**
  - Introduces the functionality of `'define` and `'undef`.
  - Demonstrates the creation of methods using `'define`, and illustrates the application of conditional directives,

- **[Inter-process Synchronization](Inter-process%20Synchronization):**
  - Introduction to creating mailboxes, events, semaphores and  exploring their methods.
  - Understanding parameterized and non-parameterized mailboxes. Insights into event and semaphore usage,
  - Practical application of mailboxes, events, and semaphores in testbench development.

#


***Coming soon:***

Interfaces, fork-join, testbench components, packages, coverage, assertions, Constraints, CRV
