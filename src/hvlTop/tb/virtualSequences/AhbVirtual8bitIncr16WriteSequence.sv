
`ifndef AHBVIRTUAL8BITINCR16WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITINCR16WRITESEQUENCE_INCLUDED_

class AhbVirtual8bitIncr16WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitIncr16WriteSequence)

  AhbMaster8bitIncr16WriteSequence ahbMaster8bitIncr16WriteSequence;

  AhbSlave8bitIncr16WriteSequence ahbSlave8bitIncr16WriteSequence;

  extern function new(string name ="AhbVirtual8bitIncr16WriteSequence");
  extern task body();

endclass : AhbVirtual8bitIncr16WriteSequence

function AhbVirtual8bitIncr16WriteSequence::new(string name ="AhbVirtual8bitIncr16WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitIncr16WriteSequence::body();
  super.body();
  ahbMaster8bitIncr16WriteSequence = AhbMaster8bitIncr16WriteSequence::type_id::create("ahbMaster8bitIncr16WriteSequence");
  ahbSlave8bitIncr16WriteSequence  = AhbSlave8bitIncr16WriteSequence::type_id::create("ahbSlave8bitIncr16WriteSequence");
 fork
    forever begin
      ahbSlave8bitIncr16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster8bitIncr16WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave8bitIncr16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
