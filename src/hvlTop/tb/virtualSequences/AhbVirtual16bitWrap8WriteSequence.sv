`ifndef AHBVIRTUAL16BITWRAP8WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITWRAP8WRITESEQUENCE_INCLUDED_

class AhbVirtual16bitWrap8WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitWrap8WriteSequence)

  AhbMaster16bitWrap8WriteSequence ahbMaster16bitWrap8WriteSequence;

  AhbSlave16bitWrap8WriteSequence ahbSlave16bitWrap8WriteSequence;

  extern function new(string name ="AhbVirtual16bitWrap8WriteSequence");
  extern task body();

endclass : AhbVirtual16bitWrap8WriteSequence

function AhbVirtual16bitWrap8WriteSequence::new(string name ="AhbVirtual16bitWrap8WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitWrap8WriteSequence::body();
  super.body();
  ahbMaster16bitWrap8WriteSequence = AhbMaster16bitWrap8WriteSequence::type_id::create("ahbMaster16bitWrap8WriteSequence");
  ahbSlave16bitWrap8WriteSequence  = AhbSlave16bitWrap8WriteSequence::type_id::create("ahbSlave16bitWrap8WriteSequence");
  fork
    ahbSlave16bitWrap8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster16bitWrap8WriteSequence.start(p_sequencer.ahbMasterSequencer);
  join

  /*repeat(1) begin
    ahbMaster16bitWrap8WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave16bitWrap8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
