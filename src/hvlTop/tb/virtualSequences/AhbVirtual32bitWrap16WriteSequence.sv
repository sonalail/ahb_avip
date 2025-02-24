`ifndef AHBVIRTUAL32BITWRAP16WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITWRAP16WRITESEQUENCE_INCLUDED_

class AhbVirtual32bitWrap16WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap16WriteSequence)

  AhbMaster32bitWrap16WriteSequence ahbMaster32bitWrap16WriteSequence;

  AhbSlave32bitWrap16WriteSequence ahbSlave32bitWrap16WriteSequence;

  extern function new(string name ="AhbVirtual32bitWrap16WriteSequence");
  extern task body();

endclass : AhbVirtual32bitWrap16WriteSequence

function AhbVirtual32bitWrap16WriteSequence::new(string name ="AhbVirtual32bitWrap16WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitWrap16WriteSequence::body();
  super.body();
  ahbMaster32bitWrap16WriteSequence = AhbMaster32bitWrap16WriteSequence::type_id::create("ahbMaster32bitWrap16WriteSequence");
  ahbSlave32bitWrap16WriteSequence  = AhbSlave32bitWrap16WriteSequence::type_id::create("ahbSlave32bitWrap16WriteSequence");
 fork
    ahbSlave32bitWrap16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster32bitWrap16WriteSequence.start(p_sequencer.ahbMasterSequencer);
   
  join

  /*repeat(1) begin
    ahbMaster32bitWrap16WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave32bitWrap16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
