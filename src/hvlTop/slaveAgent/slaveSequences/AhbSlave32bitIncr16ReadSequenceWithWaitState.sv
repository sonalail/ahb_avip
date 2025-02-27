`ifndef AHBSLAVE32BITINCR16READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE32BITINCR16READSEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave32bitIncr16ReadSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitIncr16ReadSequenceWithWaitState)
  extern function new(string name="AhbSlave32bitIncr16ReadSequenceWithWaitState");
  extern task body();
endclass : AhbSlave32bitIncr16ReadSequenceWithWaitState
 
function AhbSlave32bitIncr16ReadSequenceWithWaitState::new(string name="AhbSlave32bitIncr16ReadSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave32bitIncr16ReadSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
