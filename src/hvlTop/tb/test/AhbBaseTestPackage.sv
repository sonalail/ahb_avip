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
  `include "Ahb32bitIncr4ReadTest.sv"
  `include "Ahb16bitIncr4WriteTest.sv"
  `include "Ahb16bitIncr4ReadTest.sv"
  `include "Ahb8bitIncr4WriteTest.sv"
  `include "Ahb8bitIncr4ReadTest.sv"
  `include "Ahb32bitIncr8WriteTest.sv"
  `include "Ahb32bitIncr8ReadTest.sv"
  `include "Ahb16bitIncr8WriteTest.sv"
  `include "Ahb16bitIncr8ReadTest.sv"
  `include "Ahb16bitIncr16WriteTest.sv"
  `include "Ahb16bitIncr16ReadTest.sv"
  `include "Ahb32bitIncr16WriteTest.sv"
  `include "Ahb32bitIncr16ReadTest.sv"
  `include "Ahb32bitWrap4WriteTest.sv"
  `include "Ahb32bitWrap4ReadTest.sv"
  `include "Ahb32bitWrap8WriteTest.sv"
  `include "Ahb32bitWrap8ReadTest.sv"
  `include "Ahb32bitWrap16WriteTest.sv"
  `include "Ahb32bitWrap16ReadTest.sv"

  `include "Ahb16bitWrap4WriteTest.sv"
  `include "Ahb16bitWrap4ReadTest.sv"
  `include "Ahb16bitWrap8WriteTest.sv"
  `include "Ahb16bitWrap8ReadTest.sv"
  `include "Ahb16bitWrap16WriteTest.sv"
  `include "Ahb16bitWrap16ReadTest.sv"

endpackage : AhbBaseTestPackage

`endif
