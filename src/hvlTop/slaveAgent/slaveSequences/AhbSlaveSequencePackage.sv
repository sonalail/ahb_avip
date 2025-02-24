`ifndef AHBSLAVESEQUENCEPACKAGE_INCLUDED_
`define AHBSLAVESEQUENCEPACKAGE_INCLUDED_

package AhbSlaveSequencePackage;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import AhbGlobalPackage::*;
  import AhbSlavePackage::*;

  `include "AhbSlaveBaseSequence.sv"
  `include "AhbSlave32bitSingleWriteSequence.sv"
  `include "AhbSlave32bitSingleReadSequence.sv"
  `include "AhbSlave32bitSingleWriteReadSequence.sv"
  `include "AhbSlave32bitSingleReadWriteSequence.sv"
  `include "AhbSlave32bitSingleWriteSequenceWithWaitState.sv"
  `include "AhbSlave32bitSingleReadSequenceWithWaitState.sv"
  `include "AhbSlave16bitSingleWriteSequence.sv"
  `include "AhbSlave16bitSingleReadSequence.sv"
  `include "AhbSlave16bitSingleWriteSequenceWithWaitState.sv"
  `include "AhbSlave16bitSingleReadSequenceWithWaitState.sv"
  `include "AhbSlave8bitSingleWriteSequence.sv"
  `include "AhbSlave8bitSingleReadSequence.sv"
  `include "AhbSlave8bitSingleWriteSequenceWithWaitState.sv"
  `include "AhbSlave8bitSingleReadSequenceWithWaitState.sv"
  `include "AhbSlave32bitIncr4WriteSequence.sv"
  `include "AhbSlave32bitIncr4ReadSequence.sv"
  `include "AhbSlave16bitIncr4WriteSequence.sv"
  `include "AhbSlave16bitIncr4ReadSequence.sv"
  `include "AhbSlave8bitIncr4WriteSequence.sv"
  `include "AhbSlave8bitIncr4ReadSequence.sv"
  `include "AhbSlave32bitIncr8WriteSequence.sv"
  `include "AhbSlave32bitIncr8ReadSequence.sv"
  `include "AhbSlave16bitIncr8WriteSequence.sv"
  `include "AhbSlave16bitIncr8ReadSequence.sv"
  `include "AhbSlave32bitIncr16WriteSequence.sv"
  `include "AhbSlave32bitIncr16ReadSequence.sv"
  `include "AhbSlave16bitIncr16WriteSequence.sv"
  `include "AhbSlave16bitIncr16ReadSequence.sv"
 
  `include "AhbSlave32bitWrap4WriteSequence.sv"
  `include "AhbSlave32bitWrap4ReadSequence.sv"
  `include "AhbSlave32bitWrap8WriteSequence.sv"
  `include "AhbSlave32bitWrap8ReadSequence.sv"
  `include "AhbSlave32bitWrap16WriteSequence.sv"
  `include "AhbSlave32bitWrap16ReadSequence.sv"

  `include "AhbSlave32bitWrap4WriteSequence.sv"
  `include "AhbSlave32bitWrap4ReadSequence.sv"
  `include "AhbSlave32bitWrap4WriteSequence.sv"
  `include "AhbSlave32bitWrap4ReadSequence.sv"
  `include "AhbSlave16bitWrap4WriteSequence.sv"
  `include "AhbSlave16bitWrap4ReadSequence.sv"
  `include "AhbSlave16bitWrap8WriteSequence.sv"
  `include "AhbSlave16bitWrap8ReadSequence.sv"
  `include "AhbSlave16bitWrap16WriteSequence.sv"
  `include "AhbSlave16bitWrap16ReadSequence.sv"


endpackage : AhbSlaveSequencePackage

`endif

