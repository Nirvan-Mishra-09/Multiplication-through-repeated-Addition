# Multiplication-through-repeated-Addition(MTRA)
# MTRA Datapath

This repository contains Verilog modules for an MTRA datapath.

## Module List

- `MTRA_datapath.v`: Main datapath module
- `reg1.v`: Register 1 module
- `reg2.v`: Register 2 module
- `counter.v`: Counter module
- `add.v`: Adder module
- `eqz.v`: Comparator module

## Description

### MTRA_datapath.v

The `MTRA_datapath` module is the main module that integrates various components to form a datapath for MTRA operations. It includes the following submodules:

- **reg1**: A simple register that loads data on a positive clock edge.
- **reg2**: A register with additional clear functionality.
- **counter**: A counter module that can be loaded with a value and decremented on each clock cycle.
- **add**: An adder module that adds two 16-bit inputs.
- **eqz**: A comparator module that checks if the input is zero.

The `MTRA_datapath` module connects these components as follows:

- **Reg_A (`reg1`)**: Loads data into register `X` when `ldA` is high.
- **Reg_P (`reg2`)**: Loads data into register `Y` when `ldP` is high and clears it when `clrP` is high.
- **Counter (`counter`)**: Loads data into `bout` when `ldB` is high and decrements it when `decB` is high.
- **Adder (`add`)**: Adds the contents of `X` and `Y` to produce `Z`.
- **Comparator (`eqz`)**: Checks if `bout` is zero and sets `eqz` accordingly.

### Other Modules

- **reg1.v**: Defines the `reg1` module which is a simple loadable register (A from the data path shown in the diagram)..
- **reg2.v**: Defines the `reg2` module which is a register with clear functionality (P from the data path shown in the diagram).
- **counter.v**: Defines the `counter` module which is a loadable and decrementable counter (B from the data path shown in the diagram).
- **add.v**: Defines the `add` module which is a simple 16-bit adder.
- **eqz.v**: Defines the `eqz` module which checks if a 16-bit input (B) is zero.



### MTRA Datapath
![image](https://github.com/Nirvan-Mishra-09/Multiplication-through-repeated-Addition/assets/127642231/49463a28-a23d-4ff0-b897-dd6929a53dad)

### controller.v

The `controller` module implements a finite state machine (FSM) to control the operation of the MTRA datapath. The FSM consists of five states:

- **S0**: Idle state. Waits for the `start` signal to transition to `S1`.
- **S1**: Loads data into register `A` (sets `ldA` high).
- **S2**: Loads data into register `B` (sets `ldB` high) and clears register `P` (sets `clrP` high).
- **S3**: Starts the main operation, loading data into register `P` (sets `ldP` high) and decrementing the counter (sets `decB` high). If the counter is zero (`eqz` is high), transitions to `S4`.
- **S4**: Done state. Sets the `done` signal high and stops all operations.

#### State Transitions
- **S0**: Transitions to `S1` when `start` is high.
- **S1**: Automatically transitions to `S2`.
- **S2**: Automatically transitions to `S3`.
- **S3**: Transitions to `S4` if `eqz` is high.
- **S4**: Remains in `S4`.

#### Control Signals
- **S0**: Resets all control signals (`ldA`, `ldB`, `ldP`, `clrP`, `decB`, `done`).
- **S1**: Sets `ldA` high to load data into register `A`.
- **S2**: Sets `ldB` high to load data into register `B` and `clrP` high to clear register `P`.
- **S3**: Sets `ldP` high to load data into register `P` and `decB` high to decrement the counter.
- **S4**: Sets `done` high to indicate completion and resets other control signals.

#### Schematic Diagram from synthesis Tool
![image](https://github.com/Nirvan-Mishra-09/Multiplication-through-repeated-Addition/assets/127642231/cab4e32c-80c7-4073-a628-e68c9e2d8275)

