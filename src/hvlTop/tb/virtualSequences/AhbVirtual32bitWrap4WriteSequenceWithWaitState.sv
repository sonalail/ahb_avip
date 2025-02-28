
`ifndef AHBVIRTUAL32BITWRAP4WRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITWRAP4WRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitWrap4WriteSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap4WriteSequenceWithWaitState)

  AhbMaster32bitWrap4WriteSequenceWithWaitState ahbMaster32bitWrap4WriteSequenceWithWaitState;

  AhbSlave32bitWrap4WriteSequenceWithWaitState ahbSlave32bitWrap4WriteSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitWrap4WriteSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitWrap4WriteSequenceWithWaitState

function AhbVirtual32bitWrap4WriteSequenceWithWaitState::new(string name ="AhbVirtual32bitWrap4WriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitWrap4WriteSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitWrap4WriteSequenceWithWaitState = AhbMaster32bitWrap4WriteSequenceWithWaitState::type_id::create("ahbMaster32bitWrap4WriteSequenceWithWaitState");
  ahbSlave32bitWrap4WriteSequenceWithWaitState = AhbSlave32bitWrap4WriteSequenceWithWaitState::type_id::create("ahbSlave32bitWrap4WriteSequenceWithWaitState");
 fork
      ahbSlave32bitWrap4WriteSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
     ahbMaster32bitWrap4WriteSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
 join
 endtask : body

`endif
