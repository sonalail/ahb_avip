
`ifndef AHBVIRTUAL8BITWRAP8WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITWRAP8WRITESEQUENCE_INCLUDED_

class AhbVirtual8bitWrap8WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitWrap8WriteSequence)

  AhbMaster8bitWrap8WriteSequence ahbMaster8bitWrap8WriteSequence;

  AhbSlave8bitWrap8WriteSequence ahbSlave8bitWrap8WriteSequence;

  extern function new(string name ="AhbVirtual8bitWrap8WriteSequence");
  extern task body();

endclass : AhbVirtual8bitWrap8WriteSequence

function AhbVirtual8bitWrap8WriteSequence::new(string name ="AhbVirtual8bitWrap8WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitWrap8WriteSequence::body();
  super.body();
  ahbMaster8bitWrap8WriteSequence = AhbMaster8bitWrap8WriteSequence::type_id::create("ahbMaster8bitWrap8WriteSequence");
  ahbSlave8bitWrap8WriteSequence  = AhbSlave8bitWrap8WriteSequence::type_id::create("ahbSlave8bitWrap8WriteSequence");
  fork
    ahbSlave8bitWrap8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster8bitWrap8WriteSequence.start(p_sequencer.ahbMasterSequencer);
  join

  /*repeat(1) begin
    ahbMaster8bitWrap8WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave8bitWrap8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
