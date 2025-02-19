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
  `include "AhbVirtual16bitSingleWriteSequence.sv"
 // `include "AhbVirtual16bitSingleReadSequence.sv"
 // `include "AhbVirtual16bitSingleWriteSequenceWithWaitState.sv"
//  `include "AhbVirtual16bitSingleReadSequenceWithWaitState.sv"
  `include "AhbVirtual8bitSingleWriteSequence.sv"
  `include "AhbVirtual8bitSingleReadSequence.sv"
  `include "AhbVirtual8bitSingleWriteSequenceWithWaitState.sv"
  `include "AhbVirtual8bitSingleReadSequenceWithWaitState.sv"

endpackage : AhbVirtualSequencePackage

`endif
