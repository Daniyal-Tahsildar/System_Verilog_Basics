## Directory Specifications:

This directory contains example code demonstrating mailbox usage.

*The suggested order to read the files is as follows:*

- **[Simple Mailbox](simple_mailbox.sv):**
  - Introduces mailbox creation and demonstrates basic usage to pass data between components.
    
- **[Mailbox Types and Methods](mailbox_types_and_methods.sv):**
  - Explores parameterized and non-parameterized mailboxes.
  - Demonstrates various mailbox methods and their usage.

- **[Issue with Non-Parameterized Mailbox](non_parameterized_mbox_issue.sv):**
  - Highlights the limitations of using a non-parameterized mailbox.
  - Explains the advantages of utilizing a parameterized mailbox, especially when working with class objects.
 
- **[Mailbox Instantiations](different_mailbox_instantiations):**
  - Explores different methods of instantiating mailboxes.
    - [Static Mailbox](different_mailbox_instantiations/static_mbox.sv) showcases how a mailbox can be a static construct and passed around using the scope resolution operator.
    - [Using new() Arguments](different_mailbox_instantiations/using_new_args.sv) demonstrates how a mailbox instantiated in a higher-level component can be passed as an argument to the `new` function of a class. 
      
- **[Using Mailboxes in Testbenches](using_mailboxes_in_testbenches):**
  - Illustrates the application of mailboxes in testbenches for transferring various types of transaction packets across different components.
