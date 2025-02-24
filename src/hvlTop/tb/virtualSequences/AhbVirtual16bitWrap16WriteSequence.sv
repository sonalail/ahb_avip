`ifndef AHBVIRTUAL16BITWRAP16WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITWRAP16WRITESEQUENCE_INCLUDED_

class AhbVirtual16bitWrap16WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitWrap16WriteSequence)

  AhbMaster16bitWrap16WriteSequence ahbMaster16bitWrap16WriteSequence;

  AhbSlave16bitWrap16WriteSequence ahbSlave16bitWrap16WriteSequence;

  extern function new(string name ="AhbVirtual16bitWrap16WriteSequence");
  extern task body();

endclass : AhbVirtual16bitWrap16WriteSequence

function AhbVirtual16bitWrap16WriteSequence::new(string name ="AhbVirtual16bitWrap16WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitWrap16WriteSequence::body();
  super.body();
  ahbMaster16bitWrap16WriteSequence = AhbMaster16bitWrap16WriteSequence::type_id::create("ahbMaster16bitWrap16WriteSequence");
  ahbSlave16bitWrap16WriteSequence  = AhbSlave16bitWrap16WriteSequence::type_id::create("ahbSlave16bitWrap16WriteSequence");
  fork
    ahbSlave16bitWrap16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster16bitWrap16WriteSequence.start(p_sequencer.ahbMasterSequencer);
  join

  /*repeat(1) begin
    ahbMaster16bitWrap16WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave16bitWrap16WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
