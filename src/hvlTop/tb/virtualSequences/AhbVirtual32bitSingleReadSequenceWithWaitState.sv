`ifndef AHBVIRTUAL32BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitSingleReadSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitSingleReadSequenceWithWaitState)

  AhbMaster32bitSingleReadSequenceWithWaitState ahbMaster32bitSingleReadSequenceWithWaitState;

  AhbSlave32bitSingleReadSequenceWithWaitState ahbSlave32bitSingleReadSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitSingleReadSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitSingleReadSequenceWithWaitState

function AhbVirtual32bitSingleReadSequenceWithWaitState::new(string name ="AhbVirtual32bitSingleReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitSingleReadSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitSingleReadSequenceWithWaitState = AhbMaster32bitSingleReadSequenceWithWaitState::type_id::create("ahbMaster32bitSingleReadSequenceWithWaitState");
  ahbSlave32bitSingleReadSequenceWithWaitState = AhbSlave32bitSingleReadSequenceWithWaitState::type_id::create("ahbSlave32bitSingleReadSequenceWithWaitState");
 fork
     ahbMaster32bitSingleReadSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
     ahbSlave32bitSingleReadSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
 join

 endtask : body

`endif
