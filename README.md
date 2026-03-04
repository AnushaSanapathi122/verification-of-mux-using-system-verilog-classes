# Multiplexer Design and Verification using SystemVerilog

## Overview

This repository contains the **design and verification of a 2:1 Multiplexer (MUX)** implemented using SystemVerilog.
The project demonstrates both **RTL design** and a **class-based verification environment** to validate the functionality of the multiplexer.

The verification environment follows a **transaction-based architecture** using SystemVerilog Object-Oriented Programming (OOP) concepts.

---

## Design Description

A **2:1 Multiplexer** selects one of two input signals based on the select line and forwards it to the output.

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

The testbench uses a **class-based verification architecture** consisting of the following components:

```
Generator → Driver → DUT → Monitor → Scoreboard
```

* **Generator** creates randomized transactions.
* **Driver** applies inputs to the DUT.
* **Monitor** observes DUT inputs and outputs.
* **Scoreboard** checks the correctness of the DUT output.

---

## Verification Components

### Interface

The interface connects the DUT and the testbench.
It groups the signals together and allows classes to access them using a **virtual interface**.

### Transaction

Represents a single data packet containing input values and output values.

### Generator

Creates randomized input transactions and sends them to the driver through a mailbox.

### Driver

Receives transactions and drives signals to the DUT using the virtual interface.

### Monitor

Observes the DUT signals and sends the captured data to the scoreboard.

### Scoreboard

Compares the DUT output with the expected result and prints **PASS/FAIL**.

### Environment

Instantiates and connects generator, driver, monitor, and scoreboard.
It controls the overall verification flow.

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

You can run the simulation directly using **EDA Playground**.

🔗 **EDA Playground Link:**
https://www.edaplayground.com/x/8FNv

---

## Learning Outcome

This project helped in understanding:

* How a verification environment is structured
* Interaction between generator, driver, monitor, and scoreboard
* The role of virtual interfaces in class-based testbenches
* Practical usage of SystemVerilog OOP concepts in verification

---

## Author

**Anusha Sanapathi**
Electronics and Communication Engineering

Interested in **Digital VLSI, RTL Design, and Verification using SystemVerilog**
