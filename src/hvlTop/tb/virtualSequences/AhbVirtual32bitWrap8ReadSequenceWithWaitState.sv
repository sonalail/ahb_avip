
`ifndef AHBVIRTUAL32BITWRAP8READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITWRAP8READSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitWrap8ReadSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap8ReadSequenceWithWaitState)

  AhbMaster32bitWrap8ReadSequenceWithWaitState ahbMaster32bitWrap8ReadSequenceWithWaitState;

  AhbSlave32bitWrap8ReadSequenceWithWaitState ahbSlave32bitWrap8ReadSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitWrap8ReadSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitWrap8ReadSequenceWithWaitState

function AhbVirtual32bitWrap8ReadSequenceWithWaitState::new(string name ="AhbVirtual32bitWrap8ReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitWrap8ReadSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitWrap8ReadSequenceWithWaitState = AhbMaster32bitWrap8ReadSequenceWithWaitState::type_id::create("ahbMaster32bitWrap8ReadSequenceWithWaitState");
  ahbSlave32bitWrap8ReadSequenceWithWaitState = AhbSlave32bitWrap8ReadSequenceWithWaitState::type_id::create("ahbSlave32bitWrap8ReadSequenceWithWaitState");
 fork
    ahbSlave32bitWrap8ReadSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster32bitWrap8ReadSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
  join
 endtask : body

`endif
