`ifndef AHBVIRTUAL32BITSINGLEREADSEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITSINGLEREADSEQUENCE_INCLUDED_

class AhbVirtual32bitSingleReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitSingleReadSequence)

  AhbMaster32bitSingleReadSequence ahbMaster32bitSingleReadSequence;

  AhbSlave32bitSingleReadSequence ahbSlave32bitSingleReadSequence;

  extern function new(string name ="AhbVirtual32bitSingleReadSequence");
  extern task body();

endclass : AhbVirtual32bitSingleReadSequence

function AhbVirtual32bitSingleReadSequence::new(string name ="AhbVirtual32bitSingleReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitSingleReadSequence::body();
  super.body();
  ahbMaster32bitSingleReadSequence = AhbMaster32bitSingleReadSequence::type_id::create("ahbMaster32bitSingleReadSequence");
  ahbSlave32bitSingleReadSequence  = AhbSlave32bitSingleReadSequence::type_id::create("ahbSlave32bitSingleReadSequence");
 fork
    forever begin
      ahbSlave32bitSingleReadSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster32bitSingleReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

 endtask : body

`endif
