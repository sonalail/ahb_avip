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
  `include "AhbVirtual8bitIncr4WriteSequence.sv"
  `include "AhbVirtual8bitIncr4ReadSequence.sv"
  `include "AhbVirtual32bitIncr8WriteSequence.sv"
  `include "AhbVirtual32bitIncr8ReadSequence.sv"
  `include "AhbVirtual16bitIncr8WriteSequence.sv"
  `include "AhbVirtual16bitIncr8ReadSequence.sv"
  `include "AhbVirtual32bitIncr16WriteSequence.sv"
  `include "AhbVirtual32bitIncr16ReadSequence.sv"
  `include "AhbVirtual16bitIncr16WriteSequence.sv"
  `include "AhbVirtual16bitIncr16ReadSequence.sv"
  `include "AhbVirtual8bitIncr8WriteSequence.sv"
  `include "AhbVirtual8bitIncr8ReadSequence.sv"
  `include "AhbVirtual8bitIncr16WriteSequence.sv"
  `include "AhbVirtual8bitIncr16ReadSequence.sv"

   `include "AhbVirtual32bitWrap4WriteSequence.sv"
   `include "AhbVirtual32bitWrap4ReadSequence.sv"
   `include "AhbVirtual32bitWrap8WriteSequence.sv"
   `include "AhbVirtual32bitWrap8ReadSequence.sv"
   `include "AhbVirtual32bitWrap16WriteSequence.sv"
   `include "AhbVirtual32bitWrap16ReadSequence.sv"
   `include "AhbVirtual16bitWrap4WriteSequence.sv"
   `include "AhbVirtual16bitWrap4ReadSequence.sv"
   `include "AhbVirtual16bitWrap8WriteSequence.sv"
   `include "AhbVirtual16bitWrap8ReadSequence.sv"
   `include "AhbVirtual16bitWrap16WriteSequence.sv"
   `include "AhbVirtual16bitWrap16ReadSequence.sv"
   `include "AhbVirtual8bitWrap4WriteSequence.sv"
   `include "AhbVirtual8bitWrap4ReadSequence.sv"
   `include "AhbVirtual8bitWrap8WriteSequence.sv"
   `include "AhbVirtual8bitWrap8ReadSequence.sv"
   `include "AhbVirtual8bitWrap16WriteSequence.sv"
   `include "AhbVirtual8bitWrap16ReadSequence.sv"
  
   `include "AhbVirtual32bitIncr4WriteSequenceWithWaitState.sv"
   `include "AhbVirtual32bitIncr4ReadSequenceWithWaitState.sv"
   `include "AhbVirtual32bitIncr8WriteSequenceWithWaitState.sv"
   `include "AhbVirtual32bitIncr8ReadSequenceWithWaitState.sv"
   `include "AhbVirtual32bitIncr16WriteSequenceWithWaitState.sv"
   `include "AhbVirtual32bitIncr16ReadSequenceWithWaitState.sv"
   `include "AhbVirtual32bitWrap4WriteSequenceWithWaitState.sv"
   `include "AhbVirtual32bitWrap4ReadSequenceWithWaitState.sv"
   `include "AhbVirtual32bitWrap8WriteSequenceWithWaitState.sv"
   `include "AhbVirtual32bitWrap8ReadSequenceWithWaitState.sv"
   `include "AhbVirtual32bitWrap16WriteSequenceWithWaitState.sv"
   `include "AhbVirtual32bitWrap16ReadSequenceWithWaitState.sv"


endpackage : AhbVirtualSequencePackage

`endif
