`ifndef AHBMASTERSEQUENCEPACKAGE_INCLUDED_
`define AHBMASTERSEQUENCEPACKAGE_INCLUDED_

package AhbMasterSequencePackage;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import AhbGlobalPackage::*;
  import AhbMasterPackage::*;

  `include "AhbMasterBaseSequence.sv"
  `include "AhbMasterSequence.sv"

  endpackage : AhbMasterSequencePackage

`endif
