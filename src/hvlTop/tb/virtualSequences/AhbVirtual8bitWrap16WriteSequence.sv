`ifndef AHBVIRTUAL8BITWRAP16WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITWRAP16WRITESEQUENCE_INCLUDED_

class AhbVirtual8bitWrap16WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitWrap16WriteSequence)

  AhbMaster8bitWrap16WriteSequence ahbMaster8bitWrap16WriteSequence;

  AhbSlave8bitWrap16WriteSequence ahbSlave8bitWrap16WriteSequence;

  extern function new(string name ="AhbVirtual8bitWrap16WriteSequence");
  extern task body();

endclass : AhbVirtual8bitWrap16WriteSequence

function AhbVirtual8bitWrap16WriteSequence::new(string name ="AhbVirtual8bitWrap16WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitWrap16WriteSequence::body();
  super.body();
  ahbMaster8bitWrap16WriteSequence = AhbMaster8bitWrap16WriteSequence::type_id::create("ahbMaster8bitWrap16WriteSequence");
  ahbSlave8bitWrap16WriteSequence  = AhbSlave8bitWrap16WriteSequence::type_id::create("ahbSlave8bitWrap16WriteSequence");
  fork
    ahbSlave8bitWrap16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster8bitWrap16WriteSequence.start(p_sequencer.ahbMasterSequencer);
  join

  /*repeat(1) begin
    ahbMaster8bitWrap16WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave8bitWrap16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
