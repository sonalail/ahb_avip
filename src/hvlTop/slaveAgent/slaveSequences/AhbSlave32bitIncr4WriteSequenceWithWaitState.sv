`ifndef AHBSLAVE32BITINCR4WRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE32BITINCR4WRITESEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave32bitIncr4WriteSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitIncr4WriteSequenceWithWaitState)
  extern function new(string name="AhbSlave32bitIncr4WriteSequenceWithWaitState");
  extern task body();
endclass : AhbSlave32bitIncr4WriteSequenceWithWaitState
 
function AhbSlave32bitIncr4WriteSequenceWithWaitState::new(string name="AhbSlave32bitIncr4WriteSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave32bitIncr4WriteSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("AHB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
