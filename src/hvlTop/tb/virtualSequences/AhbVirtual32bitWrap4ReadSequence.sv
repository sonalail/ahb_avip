`ifndef AHBVIRTUAL32BITWRAP4READSEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITWRAP4READSEQUENCE_INCLUDED_

class AhbVirtual32bitWrap4ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap4ReadSequence)

  AhbMaster32bitWrap4ReadSequence ahbMaster32bitWrap4ReadSequence;

  AhbSlave32bitWrap4ReadSequence ahbSlave32bitWrap4ReadSequence;

  extern function new(string name ="AhbVirtual32bitWrap4ReadSequence");
  extern task body();

endclass : AhbVirtual32bitWrap4ReadSequence

function AhbVirtual32bitWrap4ReadSequence::new(string name ="AhbVirtual32bitWrap4ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitWrap4ReadSequence::body();
  super.body();
  ahbMaster32bitWrap4ReadSequence = AhbMaster32bitWrap4ReadSequence::type_id::create("ahbMaster32bitWrap4ReadSequence");
  ahbSlave32bitWrap4ReadSequence  = AhbSlave32bitWrap4ReadSequence::type_id::create("ahbSlave32bitWrap4ReadSequence");
 fork
    ahbSlave32bitWrap4ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster32bitWrap4ReadSequence.start(p_sequencer.ahbMasterSequencer);
   
  join

  /*repeat(1) begin
    ahbMaster32bitWrap4ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave32bitWrap4ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
