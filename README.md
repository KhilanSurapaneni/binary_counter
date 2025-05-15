# 3-Bit Binary Counter on FPGA

This project implements a 3-bit binary counter (counts 0–7) on an FPGA using Verilog.

## 🔧 Features
- Counts from 0 to 7, loops around
- Enable switch to pause/resume counting
- Direction switch for up/down counting
- Reset input to zero the counter
- Seven-segment display output (common cathode)
- External clock input via function generator

## 🧠 Design Overview
- Counter updates on rising clock edge
- Controlled by DIP switch inputs:
  - `Enable` (ON/OFF)
  - `Direction` (UP/DOWN)
  - `Reset`
- Seven-segment display decoder module maps output value (0–7) to segment patterns

## 🧪 Testbench
- Verifies counting in both directions
- Tests enable gating and reset behavior


## 🔩 Hardware Used
- UCSB DigiLab FPGA board
- Breadboard + 10-input DIP switch
- BNC to alligator clip cable (for external clock)
- Seven-segment display (common cathode)
- Resistors for display and switches
