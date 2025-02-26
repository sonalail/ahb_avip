`ifndef AHBMASTERSEQUENCEPACKAGE_INCLUDED_
`define AHBMASTERSEQUENCEPACKAGE_INCLUDED_

package AhbMasterSequencePackage;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import AhbGlobalPackage::*;
  import AhbMasterPackage::*;

  `include "AhbMasterBaseSequence.sv"
  `include "AhbMaster32bitSingleWriteSequence.sv"
  `include "AhbMaster32bitSingleReadSequence.sv"
  `include "AhbMaster32bitSingleWriteReadSequence.sv"
  `include "AhbMaster32bitSingleReadWriteSequence.sv"
  `include "AhbMaster32bitSingleWriteSequenceWithWaitState.sv"
  `include "AhbMaster32bitSingleReadSequenceWithWaitState.sv"
  `include "AhbMaster16bitSingleWriteSequence.sv"
  `include "AhbMaster16bitSingleReadSequence.sv"
  `include "AhbMaster16bitSingleWriteSequenceWithWaitState.sv"
  `include "AhbMaster16bitSingleReadSequenceWithWaitState.sv"
  `include "AhbMaster8bitSingleReadSequenceWithWaitState.sv"
  `include "AhbMaster8bitSingleWriteSequence.sv"
  `include "AhbMaster8bitSingleReadSequence.sv"
  `include "AhbMaster8bitSingleWriteSequenceWithWaitState.sv"
  `include "AhbMaster8bitSingleReadSequenceWithWaitState.sv"
  `include "AhbMaster32bitIncr4WriteSequence.sv"
  `include "AhbMaster32bitIncr4ReadSequence.sv"
  `include "AhbMaster16bitIncr4WriteSequence.sv"
  `include "AhbMaster16bitIncr4ReadSequence.sv"
  `include "AhbMaster8bitIncr4WriteSequence.sv"
  `include "AhbMaster8bitIncr4ReadSequence.sv"
  `include "AhbMaster32bitIncr8WriteSequence.sv"
  `include "AhbMaster32bitIncr8ReadSequence.sv"
  `include "AhbMaster16bitIncr8WriteSequence.sv"
  `include "AhbMaster16bitIncr8ReadSequence.sv"
  `include "AhbMaster32bitIncr16WriteSequence.sv"
  `include "AhbMaster32bitIncr16ReadSequence.sv"
  `include "AhbMaster16bitIncr16WriteSequence.sv"
  `include "AhbMaster16bitIncr16ReadSequence.sv"

  `include "AhbMaster32bitWrap4WriteSequence.sv"
  `include "AhbMaster32bitWrap4ReadSequence.sv"
  `include "AhbMaster32bitWrap8WriteSequence.sv"
  `include "AhbMaster32bitWrap8ReadSequence.sv"
  `include "AhbMaster32bitWrap16WriteSequence.sv"
  `include "AhbMaster32bitWrap16ReadSequence.sv"
  `include "AhbMaster16bitWrap4WriteSequence.sv"
  `include "AhbMaster16bitWrap4ReadSequence.sv"
  `include "AhbMaster16bitWrap8WriteSequence.sv"
  `include "AhbMaster16bitWrap8ReadSequence.sv"
  `include "AhbMaster16bitWrap16WriteSequence.sv"
  `include "AhbMaster16bitWrap16ReadSequence.sv"

  
  `include "AhbMaster8bitWrap4WriteSequence.sv"
  `include "AhbMaster8bitWrap4ReadSequence.sv"
  `include "AhbMaster8bitWrap8WriteSequence.sv"
  `include "AhbMaster8bitWrap8ReadSequence.sv"
  `include "AhbMaster8bitWrap16WriteSequence.sv"
  `include "AhbMaster8bitWrap16ReadSequence.sv"

endpackage : AhbMasterSequencePackage

`endif
