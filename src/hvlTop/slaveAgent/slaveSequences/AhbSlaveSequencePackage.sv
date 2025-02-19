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
  `include "AhbSlave16bitSingleWriteSequence.sv"
  `include "AhbSlave16bitSingleReadSequence.sv"
  `include "AhbSlave8bitSingleWriteSequence.sv"
  `include "AhbSlave8bitSingleReadSequence.sv"

endpackage : AhbSlaveSequencePackage

`endif

