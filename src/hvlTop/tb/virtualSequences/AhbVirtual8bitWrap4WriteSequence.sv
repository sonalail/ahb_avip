
`ifndef AHBVIRTUAL8BITWRAP4WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITWRAP4WRITESEQUENCE_INCLUDED_

class AhbVirtual8bitWrap4WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitWrap4WriteSequence)

  AhbMaster8bitWrap4WriteSequence ahbMaster8bitWrap4WriteSequence;

  AhbSlave8bitWrap4WriteSequence ahbSlave8bitWrap4WriteSequence;

  extern function new(string name ="AhbVirtual8bitWrap4WriteSequence");
  extern task body();

endclass : AhbVirtual8bitWrap4WriteSequence

function AhbVirtual8bitWrap4WriteSequence::new(string name ="AhbVirtual8bitWrap4WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitWrap4WriteSequence::body();
  super.body();
  ahbMaster8bitWrap4WriteSequence = AhbMaster8bitWrap4WriteSequence::type_id::create("ahbMaster8bitWrap4WriteSequence");
  ahbSlave8bitWrap4WriteSequence  = AhbSlave8bitWrap4WriteSequence::type_id::create("ahbSlave8bitWrap4WriteSequence");
  fork
    ahbSlave8bitWrap4WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster8bitWrap4WriteSequence.start(p_sequencer.ahbMasterSequencer);
  join

  /*repeat(1) begin
    ahbMaster8bitWrap4WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave8bitWrap4WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
