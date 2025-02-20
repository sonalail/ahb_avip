`ifndef AHBBASETESTPACKAGE_INCLUDED_
`define AHBBASETESTPACKAGE_INCLUDED_

package AhbBaseTestPackage;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import AhbGlobalPackage::*;
  import AhbMasterPackage::*;
  import AhbSlavePackage::*; 
  import AhbEnvironmentPackage::*;
  import AhbMasterSequencePackage::*;
  import AhbSlaveSequencePackage::*;
  import AhbVirtualSequencePackage::*;

  `include "AhbBaseTest.sv"
  `include "Ahb32bitSingleWriteTest.sv"
  `include "Ahb32bitSingleReadTest.sv"
  `include "Ahb32bitSingleWriteReadTest.sv"
  `include "Ahb32bitSingleWriteWithWaitStateTest.sv"
  `include "Ahb32bitSingleReadWithWaitStateTest.sv"
  `include "Ahb16bitSingleWriteTest.sv"
  `include "Ahb16bitSingleReadTest.sv" 
  `include "Ahb16bitSingleWriteWithWaitStateTest.sv"
  `include "Ahb16bitSingleReadWithWaitStateTest.sv"
  `include "Ahb8bitSingleWriteTest.sv"
  `include "Ahb8bitSingleReadTest.sv"
  `include "Ahb8bitSingleWriteWithWaitStateTest.sv"
  `include "Ahb8bitSingleReadWithWaitStateTest.sv"
  `include "Ahb32bitIncr4WriteTest.sv"
  //`include "Ahb32bitIncr4ReadTest.sv"

endpackage : AhbBaseTestPackage

`endif
