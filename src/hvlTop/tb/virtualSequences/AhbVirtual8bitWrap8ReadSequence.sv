`ifndef AHBVIRTUAL8BITWRAP8READSEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITWRAP8READSEQUENCE_INCLUDED_

class AhbVirtual8bitWrap8ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitWrap8ReadSequence)

  AhbMaster8bitWrap8ReadSequence ahbMaster8bitWrap8ReadSequence;

  AhbSlave8bitWrap8ReadSequence ahbSlave8bitWrap8ReadSequence;

  extern function new(string name ="AhbVirtual8bitWrap8ReadSequence");
  extern task body();

endclass : AhbVirtual8bitWrap8ReadSequence

function AhbVirtual8bitWrap8ReadSequence::new(string name ="AhbVirtual8bitWrap8ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitWrap8ReadSequence::body();
  super.body();
  ahbMaster8bitWrap8ReadSequence = AhbMaster8bitWrap8ReadSequence::type_id::create("ahbMaster8bitWrap8ReadSequence");
  ahbSlave8bitWrap8ReadSequence  = AhbSlave8bitWrap8ReadSequence::type_id::create("ahbSlave8bitWrap8ReadSequence");
 fork
    ahbSlave8bitWrap8ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster8bitWrap8ReadSequence.start(p_sequencer.ahbMasterSequencer);
   
  join

  /*repeat(1) begin
    ahbMaster8bitWrap8ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave8bitWrap8ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
