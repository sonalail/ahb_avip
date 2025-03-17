`ifndef AHBSLAVEBASESEQUENCE_INCLUDED_
`define AHBSLAVEBASESEQUENCE_INCLUDED_

class AhbSlaveBaseSequence extends uvm_sequence#(AhbSlaveTransaction);
  `uvm_object_utils(AhbSlaveBaseSequence)
  `uvm_declare_p_sequencer(AhbSlaveSequencer)
  AhbSlaveSequencer ahbSlaveSequencer;

  AhbSlaveTransaction ahbSlaveTransaction;

  extern function new(string name = "AhbSlaveBaseSequence");
  extern task body();
  
endclass : AhbSlaveBaseSequence

function AhbSlaveBaseSequence::new(string name = "AhbSlaveBaseSequence");
  super.new(name);
endfunction : new

task AhbSlaveBaseSequence::body();

  if(!$cast(p_sequencer,m_sequencer))begin
    `uvm_error(get_full_name(),"Virtual sequencer pointer cast failed")
  end

endtask : body


`endif






