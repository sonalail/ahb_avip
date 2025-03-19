# ahb_avip
This project deals with the ahb protocol

# Accelerated VIP for ahb Protocol
The idea of using Accelerated VIP is to push the synthesizable part of the testbench into the separate top module along with the interface and it is named as HDL TOP and the unsynthesizable part is pushed into the HVL TOP. This setup provides the ability to run longer tests quickly. This particular testbench can be used for the simulation as well as the emulation based on the mode of operation.

## Key Features
- Supports 32-bit address bus 
- Pipelined structure for high-performance data transfers
- Burst transfers for efficient block data movement
- Programmable wait states for slower slaves
- Error reporting using HRESP signal 
- Separate address and data phases for improved efficiency
- Flexibility for high-speed memory access
- Supports large data widths (32, 64 bits or more)

## Testbench Architecture Diagram
![image (4)](https://github.com/user-attachments/assets/1193b880-cc13-41cd-99c0-e2accacb5fa4)

## Developers, Welcome
We believe in growing together and if you'd like to contribute, please do check out the contributing guide below:
https://github.com/mbits-mirafra/ahb_avip/blob/main/ContributionGuidelines.md

## Installation - Get the VIP collateral from the GitHub repository
```bash
# Checking for git software, open the terminal type the command
git version

# Get the VIP collateral
git@github.com:sonalail/ahb_avip.git
```
## Running the test
### Using Questasim simulator
```bash
cd ahb_avip/sim/questaSim

# Compilation:  
make compile

# Simulation:
make simulate test=<test_name> uvm_verbosity=<VERBOSITY_LEVEL>

ex: make simulate test=AhbWriteTest uvm_verbosity=UVM_HIGH

# Note: You can find all the test case names in the path given below
ahb_avip/src/hvlTop/tb/testList/AhbRegression.list

# Wavefrom:  
vsim -view <test_name>/waveform.wlf &

ex:  vsim -view AhbWriteTest/waveform.wlf &

# Regression:
make regression testlist_name=<regression_testlist_name.list>

ex: make regression testlist_name=AhbRegression.list

# Coverage: 
 ## Individual test:
 firefox <test_name>/html_cov_report/index.html &

 ex: firefox AhbWriteTest/html_cov_report/index.html &

 ## Regression:
 firefox merged_cov_html_report/index.html &
```
