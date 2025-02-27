`ifndef AHBSLAVE32BITINCR8WRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE32BITINCR8WRITESEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave32bitIncr8WriteSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitIncr8WriteSequenceWithWaitState)
  extern function new(string name="AhbSlave32bitIncr8WriteSequenceWithWaitState");
  extern task body();
endclass : AhbSlave32bitIncr8WriteSequenceWithWaitState
 
function AhbSlave32bitIncr8WriteSequenceWithWaitState::new(string name="AhbSlave32bitIncr8WriteSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave32bitIncr8WriteSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("AHB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
