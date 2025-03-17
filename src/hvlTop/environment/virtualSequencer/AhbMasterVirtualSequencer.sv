`ifndef AHBMASTERVIRTUALSEQUENCER_INCLUDED_
`define AHBMASTERVIRTUALSEQUENCER_INCLUDED_

class AhbMasterVirtualSequencer extends uvm_sequencer;
  `uvm_component_utils(AhbMasterVirtualSequencer)

  extern function new(string name = "AhbMasterVirtualSequencer", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
endclass : AhbMasterVirtualSequencer
    
function AhbMasterVirtualSequencer::new(string name = "AhbMasterVirtualSequencer", uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void AhbMasterVirtualSequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

function void AhbMasterVirtualSequencer::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

`endif

