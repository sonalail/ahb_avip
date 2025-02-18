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

endpackage : AhbBaseTestPackage

`endif
