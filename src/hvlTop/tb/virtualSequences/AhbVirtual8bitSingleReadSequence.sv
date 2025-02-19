`ifndef AHBVIRTUAL8BITSINGLEREADSEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITSINGLEREADSEQUENCE_INCLUDED_

class AhbVirtual8bitSingleReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitSingleReadSequence)

  AhbMaster8bitSingleReadSequence ahbMaster8bitSingleReadSequence;

  AhbSlave8bitSingleReadSequence ahbSlave8bitSingleReadSequence;

  extern function new(string name ="AhbVirtual8bitSingleReadSequence");
  extern task body();

endclass : AhbVirtual8bitSingleReadSequence

function AhbVirtual8bitSingleReadSequence::new(string name ="AhbVirtual8bitSingleReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitSingleReadSequence::body();
  super.body();
  ahbMaster8bitSingleReadSequence = AhbMaster8bitSingleReadSequence::type_id::create("ahbMaster8bitSingleReadSequence");
  ahbSlave8bitSingleReadSequence  = AhbSlave8bitSingleReadSequence::type_id::create("ahbSlave8bitSingleReadSequence");
 fork
    forever begin
      ahbSlave8bitSingleReadSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster8bitSingleReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

 endtask : body

`endif
