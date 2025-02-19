`ifndef AHBVIRTUAL8BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL8BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual8bitSingleReadSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitSingleReadSequenceWithWaitState)

  AhbMaster8bitSingleReadSequenceWithWaitState ahbMaster8bitSingleReadSequenceWithWaitState;

  AhbSlave8bitSingleReadSequenceWithWaitState ahbSlave8bitSingleReadSequenceWithWaitState;

  extern function new(string name ="AhbVirtual8bitSingleReadSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual8bitSingleReadSequenceWithWaitState

function AhbVirtual8bitSingleReadSequenceWithWaitState::new(string name ="AhbVirtual8bitSingleReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual8bitSingleReadSequenceWithWaitState::body();
  super.body();
  ahbMaster8bitSingleReadSequenceWithWaitState = AhbMaster8bitSingleReadSequenceWithWaitState::type_id::create("ahbMaster8bitSingleReadSequenceWithWaitState");
  ahbSlave8bitSingleReadSequenceWithWaitState = AhbSlave8bitSingleReadSequenceWithWaitState::type_id::create("ahbSlave8bitSingleReadSequenceWithWaitState");
 fork
    forever begin
      ahbSlave8bitSingleReadSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster8bitSingleReadSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

 endtask : body

`endif
