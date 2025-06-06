`ifndef AHBSLAVESEQUENCEPACKAGE_INCLUDED_
`define AHBSLAVESEQUENCEPACKAGE_INCLUDED_

package AhbSlaveSequencePackage;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import AhbGlobalPackage::*;
  import AhbSlavePackage::*;

  `include "AhbSlaveBaseSequence.sv"
  `include "AhbSlaveSequence.sv"

endpackage : AhbSlaveSequencePackage

`endif

