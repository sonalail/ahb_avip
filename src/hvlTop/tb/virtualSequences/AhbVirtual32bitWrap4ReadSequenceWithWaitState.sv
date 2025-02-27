
`ifndef AHBVIRTUAL32BITWRAP4READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITWRAP4READSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitWrap4ReadSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap4ReadSequenceWithWaitState)

  AhbMaster32bitWrap4ReadSequenceWithWaitState ahbMaster32bitWrap4ReadSequenceWithWaitState;

  AhbSlave32bitWrap4ReadSequenceWithWaitState ahbSlave32bitWrap4ReadSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitWrap4ReadSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitWrap4ReadSequenceWithWaitState

function AhbVirtual32bitWrap4ReadSequenceWithWaitState::new(string name ="AhbVirtual32bitWrap4ReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitWrap4ReadSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitWrap4ReadSequenceWithWaitState = AhbMaster32bitWrap4ReadSequenceWithWaitState::type_id::create("ahbMaster32bitWrap4ReadSequenceWithWaitState");
  ahbSlave32bitWrap4ReadSequenceWithWaitState = AhbSlave32bitWrap4ReadSequenceWithWaitState::type_id::create("ahbSlave32bitWrap4ReadSequenceWithWaitState");
 fork
    ahbSlave32bitWrap4ReadSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster32bitWrap4ReadSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
  join
 endtask : body

`endif
