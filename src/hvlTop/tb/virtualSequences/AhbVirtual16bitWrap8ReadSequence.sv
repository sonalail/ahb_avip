`ifndef AHBVIRTUAL16BITWRAP8READSEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITWRAP8READSEQUENCE_INCLUDED_

class AhbVirtual16bitWrap8ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitWrap8ReadSequence)

  AhbMaster16bitWrap8ReadSequence ahbMaster16bitWrap8ReadSequence;

  AhbSlave16bitWrap8ReadSequence ahbSlave16bitWrap8ReadSequence;

  extern function new(string name ="AhbVirtual16bitWrap8ReadSequence");
  extern task body();

endclass : AhbVirtual16bitWrap8ReadSequence

function AhbVirtual16bitWrap8ReadSequence::new(string name ="AhbVirtual16bitWrap8ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitWrap8ReadSequence::body();
  super.body();
  ahbMaster16bitWrap8ReadSequence = AhbMaster16bitWrap8ReadSequence::type_id::create("ahbMaster16bitWrap8ReadSequence");
  ahbSlave16bitWrap8ReadSequence  = AhbSlave16bitWrap8ReadSequence::type_id::create("ahbSlave16bitWrap8ReadSequence");
 fork
    ahbSlave16bitWrap8ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster16bitWrap8ReadSequence.start(p_sequencer.ahbMasterSequencer);
   
  join

  /*repeat(1) begin
    ahbMaster16bitWrap8ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave16bitWrap8ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
