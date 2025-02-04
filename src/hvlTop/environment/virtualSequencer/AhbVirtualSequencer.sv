`ifndef AHBVIRTUALSEQUENCER_INCLUDED_
`define AHBVIRTUALSEQUENCER_INCLUDED_

class AhbVirtualSequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(AhbVirtualSequencer)

AhbMasterSequencer ahbMasterSequencer;

AhbSlaveSequencer  ahbSlaveSequencer;  


  extern function new(string name = "AhbVirtualSequencer", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
    
endclass : AhbVirtualSequencer

function AhbVirtualSequencer::new(string name = "AhbVirtualSequencer",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void AhbVirtualSequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

`endif
