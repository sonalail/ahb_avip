`ifndef AHBVIRTUAL16BITWRAP4WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITWRAP4WRITESEQUENCE_INCLUDED_

class AhbVirtual16bitWrap4WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitWrap4WriteSequence)

  AhbMaster16bitWrap4WriteSequence ahbMaster16bitWrap4WriteSequence;

  AhbSlave16bitWrap4WriteSequence ahbSlave16bitWrap4WriteSequence;

  extern function new(string name ="AhbVirtual16bitWrap4WriteSequence");
  extern task body();

endclass : AhbVirtual16bitWrap4WriteSequence

function AhbVirtual16bitWrap4WriteSequence::new(string name ="AhbVirtual16bitWrap4WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitWrap4WriteSequence::body();
  super.body();
  ahbMaster16bitWrap4WriteSequence = AhbMaster16bitWrap4WriteSequence::type_id::create("ahbMaster16bitWrap4WriteSequence");
  ahbSlave16bitWrap4WriteSequence  = AhbSlave16bitWrap4WriteSequence::type_id::create("ahbSlave16bitWrap4WriteSequence");
  fork
    ahbSlave16bitWrap4WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster16bitWrap4WriteSequence.start(p_sequencer.ahbMasterSequencer);
  join

  /*repeat(1) begin
    ahbMaster16bitWrap4WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave16bitWrap4WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
