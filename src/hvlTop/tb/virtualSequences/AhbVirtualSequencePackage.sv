`ifndef AHBVIRTUALSEQUENCEPACKAGE_INCLUDED_
`define AHBVIRTUALSEQUENCEPACKAGE_INCLUDED_

package AhbVirtualSequencePackage;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import AhbGlobalPackage::*;
  import AhbMasterPackage::*;
  import AhbSlavePackage::*;
  import AhbMasterSequencePackage::*;
  import AhbSlaveSequencePackage::*;
  import AhbEnvironmentPackage::*;

  `include "AhbVirtualBaseSequence.sv"
  `include "AhbVirtual32bitSingleWriteSequence.sv"
  `include "AhbVirtual32bitSingleReadSequence.sv"
  `include "AhbVirtual32bitSingleWriteReadSequence.sv"
  `include "AhbVirtual32bitSingleWriteSequenceWithWaitState.sv"

endpackage : AhbVirtualSequencePackage

`endif
