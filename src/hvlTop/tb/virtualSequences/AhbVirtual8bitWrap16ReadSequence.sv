
`ifndef AHBVIRTUAL8BITWRAP16READSEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITWRAP16READSEQUENCE_INCLUDED_

class AhbVirtual8bitWrap16ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitWrap16ReadSequence)

  AhbMaster8bitWrap16ReadSequence ahbMaster8bitWrap16ReadSequence;

  AhbSlave8bitWrap16ReadSequence ahbSlave8bitWrap16ReadSequence;

  extern function new(string name ="AhbVirtual8bitWrap16ReadSequence");
  extern task body();

endclass : AhbVirtual8bitWrap16ReadSequence

function AhbVirtual8bitWrap16ReadSequence::new(string name ="AhbVirtual8bitWrap16ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitWrap16ReadSequence::body();
  super.body();
  ahbMaster8bitWrap16ReadSequence = AhbMaster8bitWrap16ReadSequence::type_id::create("ahbMaster8bitWrap16ReadSequence");
  ahbSlave8bitWrap16ReadSequence  = AhbSlave8bitWrap16ReadSequence::type_id::create("ahbSlave8bitWrap16ReadSequence");
 fork
    ahbSlave8bitWrap16ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster8bitWrap16ReadSequence.start(p_sequencer.ahbMasterSequencer);
   
  join

  /*repeat(1) begin
    ahbMaster8bitWrap16ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave8bitWrap16ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
