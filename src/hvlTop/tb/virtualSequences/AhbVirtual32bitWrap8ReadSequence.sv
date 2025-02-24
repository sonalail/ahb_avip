`ifndef AHBVIRTUAL32BITWRAP8READSEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITWRAP8READSEQUENCE_INCLUDED_

class AhbVirtual32bitWrap8ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap8ReadSequence)

  AhbMaster32bitWrap8ReadSequence ahbMaster32bitWrap8ReadSequence;

  AhbSlave32bitWrap8ReadSequence ahbSlave32bitWrap8ReadSequence;

  extern function new(string name ="AhbVirtual32bitWrap8ReadSequence");
  extern task body();

endclass : AhbVirtual32bitWrap8ReadSequence

function AhbVirtual32bitWrap8ReadSequence::new(string name ="AhbVirtual32bitWrap8ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitWrap8ReadSequence::body();
  super.body();
  ahbMaster32bitWrap8ReadSequence = AhbMaster32bitWrap8ReadSequence::type_id::create("ahbMaster32bitWrap8ReadSequence");
  ahbSlave32bitWrap8ReadSequence  = AhbSlave32bitWrap8ReadSequence::type_id::create("ahbSlave32bitWrap8ReadSequence");
 fork
    ahbSlave32bitWrap8ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster32bitWrap8ReadSequence.start(p_sequencer.ahbMasterSequencer);
   
  join

  /*repeat(1) begin
    ahbMaster32bitWrap8ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave32bitWrap8ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
