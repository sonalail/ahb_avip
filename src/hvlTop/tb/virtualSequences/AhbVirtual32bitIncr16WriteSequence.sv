`ifndef AHBVIRTUAL32BITINCR16WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITINCR16WRITESEQUENCE_INCLUDED_

class AhbVirtual32bitIncr16WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr16WriteSequence)

  AhbMaster32bitIncr16WriteSequence ahbMaster32bitIncr16WriteSequence;

  AhbSlave32bitIncr16WriteSequence ahbSlave32bitIncr16WriteSequence;

  extern function new(string name ="AhbVirtual32bitIncr16WriteSequence");
  extern task body();

endclass : AhbVirtual32bitIncr16WriteSequence

function AhbVirtual32bitIncr16WriteSequence::new(string name ="AhbVirtual32bitIncr16WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitIncr16WriteSequence::body();
  super.body();
  ahbMaster32bitIncr16WriteSequence = AhbMaster32bitIncr16WriteSequence::type_id::create("ahbMaster32bitIncr16WriteSequence");
  ahbSlave32bitIncr16WriteSequence  = AhbSlave32bitIncr16WriteSequence::type_id::create("ahbSlave32bitIncr16WriteSequence");
 /*fork
    forever begin
      ahbSlave32bitIncr16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster32bitIncr16WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave32bitIncr16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end
  */

   fork
      ahbSlave32bitIncr16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMaster32bitIncr16WriteSequence.start(p_sequencer.ahbMasterSequencer); 
   join	
 
endtask : body

`endif
