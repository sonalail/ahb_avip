`ifndef AHBMASTERSEQUENCER_INCLUDED_
`define AHBMASTERSEQUENCER_INCLUDED_

  `uvm_component_utils(AhbMasterSequencer)

  AhbMasterAgentConfig ahbMasterAgentConfig;

  extern function new(string name = "AhbMasterSequencer", uvm_component parent);
    
endclass : AhbMasterSequencer
 
function AhbMasterSequencer::new(string name = "AhbMasterSequencer",uvm_component parent);
  super.new(name,parent);
endfunction : new

`endif
