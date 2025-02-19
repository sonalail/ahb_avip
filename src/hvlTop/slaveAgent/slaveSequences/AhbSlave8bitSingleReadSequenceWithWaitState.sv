`ifndef AHBSLAVE8BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE8BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave8bitSingleReadSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitSingleReadSequenceWithWaitState)
  extern function new(string name="AhbSlave8bitSingleReadSequenceWithWaitState");
  extern task body();
endclass : AhbSlave8bitSingleReadSequenceWithWaitState
 
function AhbSlave8bitSingleReadSequenceWithWaitState::new(string name="AhbSlave8bitSingleReadSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave8bitSingleReadSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
