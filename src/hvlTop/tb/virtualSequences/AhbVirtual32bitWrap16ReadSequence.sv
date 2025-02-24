`ifndef AHBVIRTUAL32BITWRAP16READSEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITWRAP16READSEQUENCE_INCLUDED_

class AhbVirtual32bitWrap16ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap16ReadSequence)

  AhbMaster32bitWrap16ReadSequence ahbMaster32bitWrap16ReadSequence;

  AhbSlave32bitWrap16ReadSequence ahbSlave32bitWrap16ReadSequence;

  extern function new(string name ="AhbVirtual32bitWrap16ReadSequence");
  extern task body();

endclass : AhbVirtual32bitWrap16ReadSequence

function AhbVirtual32bitWrap16ReadSequence::new(string name ="AhbVirtual32bitWrap16ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitWrap16ReadSequence::body();
  super.body();
  ahbMaster32bitWrap16ReadSequence = AhbMaster32bitWrap16ReadSequence::type_id::create("ahbMaster32bitWrap16ReadSequence");
  ahbSlave32bitWrap16ReadSequence  = AhbSlave32bitWrap16ReadSequence::type_id::create("ahbSlave32bitWrap16ReadSequence");
 fork
    ahbSlave32bitWrap16ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster32bitWrap16ReadSequence.start(p_sequencer.ahbMasterSequencer);
   
  join

  /*repeat(1) begin
    ahbMaster32bitWrap16ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave32bitWrap16ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
