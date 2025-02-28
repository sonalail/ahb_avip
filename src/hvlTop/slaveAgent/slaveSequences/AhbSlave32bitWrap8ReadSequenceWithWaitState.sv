`ifndef AHBSLAVE32BITWRAP8READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE32BITWRAP8READSEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave32bitWrap8ReadSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitWrap8ReadSequenceWithWaitState)
  extern function new(string name="AhbSlave32bitWrap8ReadSequenceWithWaitState");
  extern task body();
endclass : AhbSlave32bitWrap8ReadSequenceWithWaitState
 
function AhbSlave32bitWrap8ReadSequenceWithWaitState::new(string name="AhbSlave32bitWrap8ReadSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave32bitWrap8ReadSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
