`ifndef AHBVIRTUAL16BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL16BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual16bitSingleReadSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitSingleReadSequenceWithWaitState)

  AhbMaster16bitSingleReadSequenceWithWaitState ahbMaster16bitSingleReadSequenceWithWaitState;

  AhbSlave16bitSingleReadSequenceWithWaitState ahbSlave16bitSingleReadSequenceWithWaitState;

  extern function new(string name ="AhbVirtual16bitSingleReadSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual16bitSingleReadSequenceWithWaitState

function AhbVirtual16bitSingleReadSequenceWithWaitState::new(string name ="AhbVirtual16bitSingleReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual16bitSingleReadSequenceWithWaitState::body();
  super.body();
  ahbMaster16bitSingleReadSequenceWithWaitState = AhbMaster16bitSingleReadSequence::type_id::create("ahbMaster16bitSingleReadSequenceWithWaitState");
  ahbSlave16bitSingleReadSequenceWithWaitState  = AhbSlave16bitSingleReadSequence::type_id::create("ahbSlave16bitSingleReadSequenceWithWaitState");
 fork
    forever begin
      ahbSlave16bitSingleReadSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster16bitSingleReadSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

 endtask : body

`endif
