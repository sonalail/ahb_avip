`ifndef AHBVIRTUAL32BITWRAP4WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITWRAP4WRITESEQUENCE_INCLUDED_

class AhbVirtual32bitWrap4WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap4WriteSequence)

  AhbMaster32bitWrap4WriteSequence ahbMaster32bitWrap4WriteSequence;

  AhbSlave32bitWrap4WriteSequence ahbSlave32bitWrap4WriteSequence;

  extern function new(string name ="AhbVirtual32bitWrap4WriteSequence");
  extern task body();

endclass : AhbVirtual32bitWrap4WriteSequence

function AhbVirtual32bitWrap4WriteSequence::new(string name ="AhbVirtual32bitWrap4WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitWrap4WriteSequence::body();
  super.body();
  ahbMaster32bitWrap4WriteSequence = AhbMaster32bitWrap4WriteSequence::type_id::create("ahbMaster32bitWrap4WriteSequence");
  ahbSlave32bitWrap4WriteSequence  = AhbSlave32bitWrap4WriteSequence::type_id::create("ahbSlave32bitWrap4WriteSequence");
 fork
    ahbSlave32bitWrap4WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster32bitWrap4WriteSequence.start(p_sequencer.ahbMasterSequencer);
   
  join

  /*repeat(1) begin
    ahbMaster32bitWrap4WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave32bitWrap4WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
