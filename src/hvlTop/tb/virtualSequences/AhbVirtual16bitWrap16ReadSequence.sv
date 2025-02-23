`ifndef AHBVIRTUAL16BITWRAP16READSEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITWRAP16READSEQUENCE_INCLUDED_

class AhbVirtual16bitWrap16ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitWrap16ReadSequence)

  AhbMaster16bitWrap16ReadSequence ahbMaster16bitWrap16ReadSequence;

  AhbSlave16bitWrap16ReadSequence ahbSlave16bitWrap16ReadSequence;

  extern function new(string name ="AhbVirtual16bitWrap16ReadSequence");
  extern task body();

endclass : AhbVirtual16bitWrap16ReadSequence

function AhbVirtual16bitWrap16ReadSequence::new(string name ="AhbVirtual16bitWrap16ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitWrap16ReadSequence::body();
  super.body();
  ahbMaster16bitWrap16ReadSequence = AhbMaster16bitWrap16ReadSequence::type_id::create("ahbMaster16bitWrap16ReadSequence");
  ahbSlave16bitWrap16ReadSequence  = AhbSlave16bitWrap16ReadSequence::type_id::create("ahbSlave16bitWrap16ReadSequence");
 fork
    ahbSlave16bitWrap16ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster16bitWrap16ReadSequence.start(p_sequencer.ahbMasterSequencer);
   
  join

  /*repeat(1) begin
    ahbMaster16bitWrap16ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave16bitWrap16ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
