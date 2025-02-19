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
  //`include "AhbMaster32bitSingleReadSequenceWithWaitState.sv"
  `include "AhbMaster16bitSingleWriteSequence.sv"
  `include "AhbMaster16bitSingleReadSequence.sv"
  `include "AhbMaster16bitSingleWriteSequenceWithWaitState.sv"
  `include "AhbMaster16bitSingleReadSequenceWithWaitState.sv"
  `include "AhbMaster8bitSingleReadSequenceWithWaitState.sv"
  `include "AhbMaster8bitSingleWriteSequence.sv"
  `include "AhbMaster8bitSingleReadSequence.sv"
  `include "AhbMaster8bitSingleWriteSequenceWithWaitState.sv"
  `include "AhbMaster8bitSingleReadSequenceWithWaitState.sv"

endpackage : AhbMasterSequencePackage

`endif
