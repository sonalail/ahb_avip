`ifndef AHBSLAVE32BITINCR4READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE32BITINCR4READSEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave32bitIncr4ReadSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitIncr4ReadSequenceWithWaitState)
  extern function new(string name="AhbSlave32bitIncr4ReadSequenceWithWaitState");
  extern task body();
endclass : AhbSlave32bitIncr4ReadSequenceWithWaitState
 
function AhbSlave32bitIncr4ReadSequenceWithWaitState::new(string name="AhbSlave32bitIncr4ReadSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave32bitIncr4ReadSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
