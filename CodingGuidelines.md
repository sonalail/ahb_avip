// Coding Guidelines

1.Only one statement per line. // Variable definition: logic enable; logic completed; logic in_progress;
2.Always use a begin-end pair to bracket conditional statements.
3.Use the end label for classes, functions, tasks etc., called closing identifiers. Ex: function name () endfunction: Name
4.Use pascal case for class names and camel case for class handles. //Example : class name - AhbMasterDriverBFM , handle name - ahbMasterDriverBFM
5.All structs, unions and enums. They should use camelCase with the following distinction: Structs end with Struct Unions end with Union Enums end with Enum. Additionally, enumerations should use UPPERCASE
6.Declare class methods using extern: extern function new(string name);
7.Check that $cast() has succeeded: if(!$cast(t, toBeCloned.clone())begin `uvm_error("getAClone","$cast failed for toBeCloned") end
8.Check that randomize() has succeeded: // Using if() to check randomization result
9.Always declare functions/tasks to be virtual. Helps in using Polymorphism feature.
10.Do not use #0 procedural delays: Often, using a non-blocking assignment ( <= ) solves this class of problem.
11.Do not use hard-coded values. Always use constants/parameters.
12.Keep the file name same as the class name. 
