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
  `include "AhbVirtual32bitSingleReadSequenceWithWaitState.sv"
  `include "AhbVirtual16bitSingleWriteSequence.sv"
  `include "AhbVirtual16bitSingleReadSequence.sv"
  `include "AhbVirtual16bitSingleWriteSequenceWithWaitState.sv"
  `include "AhbVirtual16bitSingleReadSequenceWithWaitState.sv"
  `include "AhbVirtual8bitSingleWriteSequence.sv"
  `include "AhbVirtual8bitSingleReadSequence.sv"
  `include "AhbVirtual8bitSingleWriteSequenceWithWaitState.sv"
  `include "AhbVirtual8bitSingleReadSequenceWithWaitState.sv"
  `include "AhbVirtual32bitIncr4WriteSequence.sv"
  `include "AhbVirtual32bitIncr4ReadSequence.sv"
  `include "AhbVirtual16bitIncr4WriteSequence.sv"
  `include "AhbVirtual16bitIncr4ReadSequence.sv"
 // `include "AhbVirtual8bitIncr4WriteSequence.sv"
 // `include "AhbVirtual8bitIncr4ReadSequence.sv"
  `include "AhbVirtual32bitWrap4WriteSequence.sv"
 // `include "AhbVirtual32bitWrap4ReadSequence.sv"

endpackage : AhbVirtualSequencePackage

`endif
