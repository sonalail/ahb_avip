`ifndef AHBVIRTUAL32BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitSingleWriteSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitSingleWriteSequenceWithWaitState)

  AhbMaster32bitSingleWriteSequenceWithWaitState ahbMaster32bitSingleWriteSequenceWithWaitState;

  AhbSlave32bitSingleWriteSequenceWithWaitState ahbSlave32bitSingleWriteSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitSingleWriteSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitSingleWriteSequenceWithWaitState

function AhbVirtual32bitSingleWriteSequenceWithWaitState::new(string name ="AhbVirtual32bitSingleWriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitSingleWriteSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitSingleWriteSequenceWithWaitState = AhbMaster32bitSingleWriteSequenceWithWaitState::type_id::create("ahbMaster32bitSingleWriteSequenceWithWaitState");
  ahbSlave32bitSingleWriteSequenceWithWaitState = AhbSlave32bitSingleWriteSequenceWithWaitState::type_id::create("ahbSlave32bitSingleWriteSequenceWithWaitState");
 fork
    ahbMaster32bitSingleWriteSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
    ahbSlave32bitSingleWriteSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
 join


 endtask : body

`endif
