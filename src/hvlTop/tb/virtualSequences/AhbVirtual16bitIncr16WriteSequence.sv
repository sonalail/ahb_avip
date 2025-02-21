
`ifndef AHBVIRTUAL16BITINCR16WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITINCR16WRITESEQUENCE_INCLUDED_

class AhbVirtual16bitIncr16WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitIncr16WriteSequence)

  AhbMaster16bitIncr16WriteSequence ahbMaster16bitIncr16WriteSequence;

  AhbSlave16bitIncr16WriteSequence ahbSlave16bitIncr16WriteSequence;

  extern function new(string name ="AhbVirtual16bitIncr16WriteSequence");
  extern task body();

endclass : AhbVirtual16bitIncr16WriteSequence

function AhbVirtual16bitIncr16WriteSequence::new(string name ="AhbVirtual16bitIncr16WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitIncr16WriteSequence::body();
  super.body();
  ahbMaster16bitIncr16WriteSequence = AhbMaster16bitIncr16WriteSequence::type_id::create("ahbMaster16bitIncr16WriteSequence");
  ahbSlave16bitIncr16WriteSequence  = AhbSlave16bitIncr16WriteSequence::type_id::create("ahbSlave16bitIncr16WriteSequence");
 /*fork
    forever begin
      ahbSlave16bitIncr16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster16bitIncr16WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end*/
 fork 
        ahbMaster16bitIncr16WriteSequence.start(p_sequencer.ahbMasterSequencer);
  	ahbSlave16bitIncr16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
 join

   /* repeat(1)begin
  	ahbSlave16bitIncr16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
