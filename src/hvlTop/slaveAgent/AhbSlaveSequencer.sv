`ifndef AHBSLAVESEQUENCER_INCLUDED_
`define AHBSLAVESEQUENCER_INCLUDED_

class AhbSlaveSequencer extends uvm_sequencer#(AhbSlaveTransaction);
  `uvm_component_utils(AhbSlaveSequencer)
  
  AhbSlaveAgentConfig ahbSlaveAgentConfig;

  extern function new(string name = "AhbSlaveSequencer", uvm_component parent = null);
  
endclass : AhbSlaveSequencer

function AhbSlaveSequencer::new(string name = "AhbSlaveSequencer",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

`endif
