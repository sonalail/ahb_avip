`ifndef AHBVIRTUAL16BITWRAP4READSEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITWRAP4READSEQUENCE_INCLUDED_

class AhbVirtual16bitWrap4ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitWrap4ReadSequence)

  AhbMaster16bitWrap4ReadSequence ahbMaster16bitWrap4ReadSequence;

  AhbSlave16bitWrap4ReadSequence ahbSlave16bitWrap4ReadSequence;

  extern function new(string name ="AhbVirtual16bitWrap4ReadSequence");
  extern task body();

endclass : AhbVirtual16bitWrap4ReadSequence

function AhbVirtual16bitWrap4ReadSequence::new(string name ="AhbVirtual16bitWrap4ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitWrap4ReadSequence::body();
  super.body();
  ahbMaster16bitWrap4ReadSequence = AhbMaster16bitWrap4ReadSequence::type_id::create("ahbMaster16bitWrap4ReadSequence");
  ahbSlave16bitWrap4ReadSequence  = AhbSlave16bitWrap4ReadSequence::type_id::create("ahbSlave16bitWrap4ReadSequence");
 fork
    ahbSlave16bitWrap4ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster16bitWrap4ReadSequence.start(p_sequencer.ahbMasterSequencer);
   
  join

  /*repeat(1) begin
    ahbMaster16bitWrap4ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

    repeat(1)begin
  	ahbSlave16bitWrap4ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
