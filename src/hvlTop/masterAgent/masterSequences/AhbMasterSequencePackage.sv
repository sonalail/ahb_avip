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

endpackage : AhbMasterSequencePackage

`endif
