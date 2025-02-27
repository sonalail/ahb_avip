`ifndef AHBSLAVE32BITINCR8READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE32BITINCR8READSEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave32bitIncr8ReadSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitIncr8ReadSequenceWithWaitState)
  extern function new(string name="AhbSlave32bitIncr8ReadSequenceWithWaitState");
  extern task body();
endclass : AhbSlave32bitIncr8ReadSequenceWithWaitState
 
function AhbSlave32bitIncr8ReadSequenceWithWaitState::new(string name="AhbSlave32bitIncr8ReadSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave32bitIncr8ReadSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
