`ifndef AHBVIRTUAL16BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL16BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual16bitSingleWriteSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitSingleWriteSequenceWithWaitState)

  AhbMaster16bitSingleWriteSequenceWithWaitState ahbMaster16bitSingleWriteSequenceWithWaitState;

  AhbSlave16bitSingleWriteSequenceWithWaitState ahbSlave16bitSingleWriteSequenceWithWaitState;

  extern function new(string name ="AhbVirtual16bitSingleWriteSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual16bitSingleWriteSequenceWithWaitState

function AhbVirtual16bitSingleWriteSequenceWithWaitState::new(string name ="AhbVirtual16bitSingleWriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual16bitSingleWriteSequenceWithWaitState::body();
  super.body();
  ahbMaster16bitSingleWriteSequenceWithWaitState = AhbMaster16bitSingleWriteSequenceWithWaitState::type_id::create("ahbMaster16bitSingleWriteSequenceWithWaitState");
  ahbSlave16bitSingleWriteSequenceWithWaitState = AhbSlave16bitSingleWriteSequenceWithWaitState::type_id::create("ahbSlave16bitSingleWriteSequenceWithWaitState");

 fork
     ahbMaster16bitSingleWriteSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
     ahbSlave16bitSingleWriteSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
 join

 endtask : body

`endif
