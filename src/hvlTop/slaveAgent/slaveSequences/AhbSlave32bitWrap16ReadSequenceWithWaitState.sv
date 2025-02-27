
`ifndef AHBSLAVE32BITWRAP16READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE32BITWRAP16READSEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave32bitWrap16ReadSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitWrap16ReadSequenceWithWaitState)
  extern function new(string name="AhbSlave32bitWrap16ReadSequenceWithWaitState");
  extern task body();
endclass : AhbSlave32bitWrap16ReadSequenceWithWaitState
 
function AhbSlave32bitWrap16ReadSequenceWithWaitState::new(string name="AhbSlave32bitWrap16ReadSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave32bitWrap16ReadSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
