`ifndef AHBVIRTUAL8BITWRAP4READSEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITWRAP4READSEQUENCE_INCLUDED_

class AhbVirtual8bitWrap4ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitWrap4ReadSequence)

  AhbMaster8bitWrap4ReadSequence ahbMaster8bitWrap4ReadSequence;

  AhbSlave8bitWrap4ReadSequence ahbSlave8bitWrap4ReadSequence;

  extern function new(string name ="AhbVirtual8bitWrap4ReadSequence");
  extern task body();

endclass : AhbVirtual8bitWrap4ReadSequence

function AhbVirtual8bitWrap4ReadSequence::new(string name ="AhbVirtual8bitWrap4ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitWrap4ReadSequence::body();
  super.body();
  ahbMaster8bitWrap4ReadSequence = AhbMaster8bitWrap4ReadSequence::type_id::create("ahbMaster8bitWrap4ReadSequence");
  ahbSlave8bitWrap4ReadSequence  = AhbSlave8bitWrap4ReadSequence::type_id::create("ahbSlave8bitWrap4ReadSequence");
 fork
    ahbSlave8bitWrap4ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster8bitWrap4ReadSequence.start(p_sequencer.ahbMasterSequencer);
   
  join

  /*repeat(1) begin
    ahbMaster8bitWrap4ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave8bitWrap4ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
