`ifndef AHBSLAVEVIRTUALSEQUENCERINCLUDED_
`define AHBSLAVEVIRTUALSEQUENCERINCLUDED_

class AhbSlaveVirtualSequencer extends uvm_sequencer;
  `uvm_component_utils(AhbSlaveVirtualSequencer)

  extern function new(string name = "AhbSlaveVirtualSequencer", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : AhbSlaveVirtualSequencer

function AhbSlaveVirtualSequencer::new(string name = "AhbSlaveVirtualSequencer", uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void AhbSlaveVirtualSequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

function void AhbSlaveVirtualSequencer::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase
   
`endif
