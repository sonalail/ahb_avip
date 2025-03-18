# ahb_avip
This project deals with the ahb protocol

# Accelerated VIP for ahb Protocol
The idea of using Accelerated VIP is to push the synthesizable part of the testbench into the separate top module along with the interface and it is named as HDL TOP and the unsynthesizable part is pushed into the HVL TOP. This setup provides the ability to run longer tests quickly. This particular testbench can be used for the simulation as well as the emulation based on the mode of operation.

## Key Features
- **Supports 32-bit and 64-bit address bus (To do)**
- **Pipelined structure for high-performance data transfers**
- **Multi-master, multi-slave architecture with centralized arbitration (To do)**
- **High throughput optimized for low-latency communication**
- **Burst transfers for efficient block data movement**
- **Programmable wait states for slower slaves**
- **Error reporting using HRESP signal (To do)**
- **Separate address and data phases for improved efficiency**
- **Flexibility for high-speed memory access**
- **Supports large data widths (32, 64 bits or more) (To do)**
- **Centralized arbitration to resolve master access conflicts**
- **Suitable for high-speed peripherals like GPUs, memory, and accelerators**

# Testbench Architecture Diagram
![image (4)](https://github.com/user-attachments/assets/1193b880-cc13-41cd-99c0-e2accacb5fa4)
