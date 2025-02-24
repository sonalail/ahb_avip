`ifndef AHBVIRTUAL32BITWRAP8WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITWRAP8WRITESEQUENCE_INCLUDED_

class AhbVirtual32bitWrap8WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap8WriteSequence)

  AhbMaster32bitWrap8WriteSequence ahbMaster32bitWrap8WriteSequence;

  AhbSlave32bitWrap8WriteSequence ahbSlave32bitWrap8WriteSequence;

  extern function new(string name ="AhbVirtual32bitWrap8WriteSequence");
  extern task body();

endclass : AhbVirtual32bitWrap8WriteSequence

function AhbVirtual32bitWrap8WriteSequence::new(string name ="AhbVirtual32bitWrap8WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitWrap8WriteSequence::body();
  super.body();
  ahbMaster32bitWrap8WriteSequence = AhbMaster32bitWrap8WriteSequence::type_id::create("ahbMaster32bitWrap8WriteSequence");
  ahbSlave32bitWrap8WriteSequence  = AhbSlave32bitWrap8WriteSequence::type_id::create("ahbSlave32bitWrap8WriteSequence");
 fork
    ahbSlave32bitWrap8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster32bitWrap8WriteSequence.start(p_sequencer.ahbMasterSequencer);
   
  join

  /*repeat(1) begin
    ahbMaster32bitWrap8WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave32bitWrap8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
