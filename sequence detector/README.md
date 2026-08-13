# 1011 Sequence Detector using Verilog

## Overview

This project implements and simulates a **1011 Sequence Detector** using Verilog HDL.

A sequence detector is a digital circuit that monitors a serial input stream and produces an output when a specific sequence of bits is detected.

In this project, the target sequence is:

```text
1011
```

The design uses a **Finite State Machine (FSM)** and implements an **overlapping Mealy sequence detector**.

## Features

* Detects the sequence `1011`
* Finite State Machine implementation
* Mealy machine design
* Overlapping sequence detection
* Verilog HDL implementation
* Testbench verification
* GTKWave simulation

## Block Diagram

```text
                  ┌──────────────────────┐
       X ────────►│                      │
                  │   1011 Sequence      │────► Z
      CLK ───────►│      Detector        │
                  │       (FSM)          │
     RESET ──────►│                      │
                  └──────────────────────┘
```

## Target Sequence

The detector searches for:

```text
1011
```

When the complete sequence is detected:

```text
Z = 1
```

Otherwise:

```text
Z = 0
```

## FSM States

The sequence detector has four states.

| State | Description      |
| ----- | ---------------- |
| S0    | No matching bits |
| S1    | Detected `1`     |
| S2    | Detected `10`    |
| S3    | Detected `101`   |

### State transitions

```text
S0 --1--> S1
S0 --0--> S0

S1 --0--> S2
S1 --1--> S1

S2 --1--> S3
S2 --0--> S0

S3 --1--> S1, Z=1
S3 --0--> S2
```

## State Diagram

```text
             1
        ┌──────────┐
        │          ▼
       S0 ───────► S1
        ▲          │
        │          │ 0
        │          ▼
        │         S2
        │          │
        │          │ 1
        │          ▼
        └───────── S3
          0        │
                   │ 1 / Z=1
                   ▼
                  S1
```

## Example

For the input sequence:

```text
1 0 1 1
```

the detector produces:

```text
Input  :  1 0 1 1
Output :  0 0 0 1
```

The output becomes `1` when the final bit of `1011` is received.

## Overlapping Detection

This project uses overlapping detection.

For example, consider:

```text
1011011
```

The sequence `1011` occurs twice:

```text
1011 011
    1011
```

The detector can recognize both occurrences.

## Project Structure

```text
sequence-detector-verilog/
│
├── README.md
├── sequence_detector_1011.v
├── tb_sequence_detector_1011.v
└── simulation/
    └── waveform.vcd
```

## Files

### `sequence_detector_1011.v`

Contains the Verilog implementation of the 1011 sequence detector using a Mealy FSM.

### `tb_sequence_detector_1011.v`

Contains the testbench that supplies serial input data and verifies the detector output.

### `simulation/waveform.vcd`

Contains the waveform generated during simulation.

## Simulation

This project can be simulated using **Icarus Verilog** and **GTKWave**.

### Step 1: Compile

```bash
iverilog -o sequence_sim sequence_detector_1011.v tb_sequence_detector_1011.v
```

### Step 2: Run

```bash
vvp sequence_sim
```

The simulation generates:

```text
waveform.vcd
```

### Step 3: View Waveform

```bash
gtkwave waveform.vcd
```

Add the following signals:

```text
CLK
RESET
X
Z
```

## Expected Output

For the input:

```text
1011
```

the output is:

```text
Input  : 1 0 1 1
Output : 0 0 0 1
```

The output `Z` becomes HIGH when the complete sequence is detected.

## Applications

Sequence detectors are used in:

* Digital communication systems
* Serial data processing
* Protocol detection
* Control systems
* Pattern recognition
* Digital security systems
* FPGA designs
* Finite state machines

## Advantages

* Detects a specific serial bit pattern
* Can detect overlapping sequences
* Easy to implement using FSMs
* Useful in digital communication
* Suitable for FPGA and ASIC designs

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* GitHub

## Conclusion

A `1011` sequence detector was successfully designed using Verilog HDL and a Mealy finite state machine. The testbench verifies the detection of the required sequence, and the simulation waveform demonstrates that the output becomes HIGH when `1011` is detected.

## Author

**Shahanaj**
