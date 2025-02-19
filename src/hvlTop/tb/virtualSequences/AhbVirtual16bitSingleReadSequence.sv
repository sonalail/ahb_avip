`ifndef AHBVIRTUAL16BITSINGLEREADSEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITSINGLEREADSEQUENCE_INCLUDED_

class AhbVirtual16bitSingleReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitSingleReadSequence)

  AhbMaster16bitSingleReadSequence ahbMaster16bitSingleReadSequence;

  AhbSlave16bitSingleReadSequence ahbSlave16bitSingleReadSequence;

  extern function new(string name ="AhbVirtual16bitSingleReadSequence");
  extern task body();

endclass : AhbVirtual16bitSingleReadSequence

function AhbVirtual16bitSingleReadSequence::new(string name ="AhbVirtual16bitSingleReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitSingleReadSequence::body();
  super.body();
  ahbMaster16bitSingleReadSequence = AhbMaster16bitSingleReadSequence::type_id::create("ahbMaster16bitSingleReadSequence");
  ahbSlave16bitSingleReadSequence  = AhbSlave16bitSingleReadSequence::type_id::create("ahbSlave16bitSingleReadSequence");
 fork
    forever begin
      ahbSlave16bitSingleReadSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster16bitSingleReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

 endtask : body

`endif
