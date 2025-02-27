`ifndef AHBSLAVE32BITINCR16WRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE32BITINCR16WRITESEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave32bitIncr16WriteSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitIncr16WriteSequenceWithWaitState)
  extern function new(string name="AhbSlave32bitIncr16WriteSequenceWithWaitState");
  extern task body();
endclass : AhbSlave32bitIncr16WriteSequenceWithWaitState
 
function AhbSlave32bitIncr16WriteSequenceWithWaitState::new(string name="AhbSlave32bitIncr16WriteSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave32bitIncr16WriteSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("AHB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
