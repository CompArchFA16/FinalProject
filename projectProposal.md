# Exploring FPUs

## Ian Paul

## Description 

In all the CPUs we’ve looked at and the one we designed we’ve only seen integer math done at the hardware level. In the real world, many CPUs come with a floating point unit integrated for hardware level floating point math. In this project I’d like to explore the design decisions behind including or not including an FPU and try implementing all or part of one.
FPUs usually are able to do addition, subtraction, multiplication, and division, and often square root and bitshifting as well. I’d like to build something that can handle performing some of these operations on IEEE 754 standard numbers in verilog. This will involve modules to encode/decode numbers into the IEEE 754 standard as well as to perform each operation.
In addition to actually implementing parts of an FPU, I’d like to look at some microcontrollers used in embedded systems that use or don’t use an FPU. This is less important to me than actually building my own unit, but I’m still interested to see what other people implement.

## Planned References

- USB lecture notes on IEEE 754
- Design Trade-Offs in Floating-Point Unit Implementation for EMbedded and Processing-In-Memory Systems (Kwon, Sondeen, Draper)

## Deliverables

Minimum: An FPU that can add 2 IEEE 754 numbers.

Planned: An FPU that can add, subtract, and multiply 2 IEEE 754 numbers and a brief write up analyzing 2 similar processors, one with an FPU and one without (EG arduino uno and duo).

Stretch: Also implement division, square root, bitshifting, and exponentiation.

## Work Plan

|Item|Time Estimate|
|----|-------------|
|Planning|2 hr|
|Implementing IEEE 754| 2hr|
|Addition| 1 hr|
|Subtraction| 1 hr|
|Multiplication| .5 hr|
|Comparative write up| 3 hr|
|Division| 1 hr|
|Documentation| 4 hr|
