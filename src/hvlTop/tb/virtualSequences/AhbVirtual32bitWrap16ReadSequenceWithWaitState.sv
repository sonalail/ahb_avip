
`ifndef AHBVIRTUAL32BITWRAP16READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITWRAP16READSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitWrap16ReadSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap16ReadSequenceWithWaitState)

  AhbMaster32bitWrap16ReadSequenceWithWaitState ahbMaster32bitWrap16ReadSequenceWithWaitState;

  AhbSlave32bitWrap16ReadSequenceWithWaitState ahbSlave32bitWrap16ReadSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitWrap16ReadSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitWrap16ReadSequenceWithWaitState

function AhbVirtual32bitWrap16ReadSequenceWithWaitState::new(string name ="AhbVirtual32bitWrap16ReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitWrap16ReadSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitWrap16ReadSequenceWithWaitState = AhbMaster32bitWrap16ReadSequenceWithWaitState::type_id::create("ahbMaster32bitWrap16ReadSequenceWithWaitState");
  ahbSlave32bitWrap16ReadSequenceWithWaitState = AhbSlave32bitWrap16ReadSequenceWithWaitState::type_id::create("ahbSlave32bitWrap16ReadSequenceWithWaitState");
 fork
    ahbSlave32bitWrap16ReadSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster32bitWrap16ReadSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
  join
 endtask : body

`endif
