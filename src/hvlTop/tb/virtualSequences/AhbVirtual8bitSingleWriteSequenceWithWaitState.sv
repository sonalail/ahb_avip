`ifndef AHBVIRTUAL8BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL8BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual8bitSingleWriteSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitSingleWriteSequenceWithWaitState)

  AhbMaster8bitSingleWriteSequenceWithWaitState ahbMaster8bitSingleWriteSequenceWithWaitState;

  AhbSlave8bitSingleWriteSequenceWithWaitState ahbSlave8bitSingleWriteSequenceWithWaitState;

  extern function new(string name ="AhbVirtual8bitSingleWriteSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual8bitSingleWriteSequenceWithWaitState

function AhbVirtual8bitSingleWriteSequenceWithWaitState::new(string name ="AhbVirtual8bitSingleWriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual8bitSingleWriteSequenceWithWaitState::body();
  super.body();
  ahbMaster8bitSingleWriteSequenceWithWaitState = AhbMaster8bitSingleWriteSequenceWithWaitState::type_id::create("ahbMaster8bitSingleWriteSequenceWithWaitState");
  ahbSlave8bitSingleWriteSequenceWithWaitState = AhbSlave8bitSingleWriteSequenceWithWaitState::type_id::create("ahbSlave8bitSingleWriteSequenceWithWaitState");
 fork
      ahbMaster8bitSingleWriteSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
      ahbSlave8bitSingleWriteSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
 join


 endtask : body

`endif
