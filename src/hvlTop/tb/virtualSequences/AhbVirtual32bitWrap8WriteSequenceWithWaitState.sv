
`ifndef AHBVIRTUAL32BITWRAP8WRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITWRAP8WRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitWrap8WriteSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap8WriteSequenceWithWaitState)

  AhbMaster32bitWrap8WriteSequenceWithWaitState ahbMaster32bitWrap8WriteSequenceWithWaitState;

  AhbSlave32bitWrap8WriteSequenceWithWaitState ahbSlave32bitWrap8WriteSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitWrap8WriteSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitWrap8WriteSequenceWithWaitState

function AhbVirtual32bitWrap8WriteSequenceWithWaitState::new(string name ="AhbVirtual32bitWrap8WriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitWrap8WriteSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitWrap8WriteSequenceWithWaitState = AhbMaster32bitWrap8WriteSequenceWithWaitState::type_id::create("ahbMaster32bitWrap8WriteSequenceWithWaitState");
  ahbSlave32bitWrap8WriteSequenceWithWaitState = AhbSlave32bitWrap8WriteSequenceWithWaitState::type_id::create("ahbSlave32bitWrap8WriteSequenceWithWaitState");
 fork
      ahbSlave32bitWrap8WriteSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
     ahbMaster32bitWrap8WriteSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
 join
 endtask : body

`endif
