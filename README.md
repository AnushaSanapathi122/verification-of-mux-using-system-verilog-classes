# Multiplexer Design and Verification using SystemVerilog

## Overview

This repository contains the design and verification of a **2:1 Multiplexer (MUX)** implemented using SystemVerilog. The project demonstrates both **RTL design** and a **class-based verification environment** to validate the functionality of the multiplexer.

The verification environment follows a **transaction-based architecture** using SystemVerilog Object-Oriented Programming (OOP) concepts.

---

## Design Description

A **2:1 Multiplexer** selects one of two input signals based on a select line and forwards it to the output.

### Logic

```
If sel = 0 → output = a  
If sel = 1 → output = b
```

### Truth Table

| sel | a | b | y |
| --- | - | - | - |
| 0   | 0 | X | 0 |
| 0   | 1 | X | 1 |
| 1   | X | 0 | 0 |
| 1   | X | 1 | 1 |

---

## Verification Architecture

The testbench uses a **class-based verification methodology** consisting of the following components:

```
Generator → Driver → DUT → Monitor → Scoreboard
```

Each component plays a specific role in generating stimulus, applying inputs, observing outputs, and verifying correctness.

---

## Verification Components

### Interface

The interface connects the DUT and the testbench components.
It groups the DUT signals and provides a clean communication channel between the verification environment and the design.

### Transaction

The transaction class represents a single packet of data containing input values and expected output values.
It is used to pass information between different verification components.

### Generator

The generator creates randomized input transactions and sends them to the driver using a mailbox.

### Driver

The driver receives transactions from the generator and drives the corresponding signals to the DUT through the virtual interface.

### Monitor

The monitor observes the DUT signals, captures the input and output values, and sends them to the scoreboard.

### Scoreboard

The scoreboard checks whether the DUT output matches the expected result based on the multiplexer logic.
It prints **PASS** or **FAIL** depending on the comparison.

### Environment

The environment instantiates and connects all verification components such as generator, driver, monitor, and scoreboard.
It also controls the execution of the verification flow.

---

## Key Concepts Used

* SystemVerilog Classes
* Object-Oriented Programming (OOP)
* Randomization
* Mailbox Communication
* Virtual Interface
* Transaction-Based Verification
* Parallel Processes (fork-join)

---

## Simulation

The design and verification can be simulated using tools such as:

* EDA Playground
* QuestaSim
* Riviera-PRO
* Synopsys VCS

---

## Learning Outcome

This project helped in understanding:

* How a verification environment is structured
* How different verification components interact
* The importance of interfaces and virtual interfaces
* The use of OOP concepts in hardware verification

---

## Author

**Anusha Sanapathi**

Electronics and Communication Engineering
Interested in **Digital VLSI, RTL Design, and Verification using SystemVerilog**
