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
  `include "AhbVirtualWriteSequence.sv"
  `include "AhbVirtualReadSequence.sv"
  `include "AhbVirtualSingleWriteSequence.sv"
  `include "AhbVirtualSingleReadSequence.sv"
  `include "AhbVirtualWriteWithBusySequence.sv"
  `include "AhbVirtualReadWithBusySequence.sv"
  `include "AhbVirtualSingleWriteWithWaitStateSequence.sv"
  `include "AhbVirtualSingleReadWithWaitStateSequence.sv"
  `include "AhbVirtualWriteWithWaitStateSequence.sv"
  `include "AhbVirtualReadWithWaitStateSequence.sv"
  `include "AhbVirtualWriteFollowedByReadSequence.sv"
  `include "AhbVirtualWriteWithBusyToBusySequence.sv"
endpackage : AhbVirtualSequencePackage

`endif
