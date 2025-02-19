`ifndef AHBSLAVE16BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE16BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave16bitSingleReadSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave16bitSingleReadSequenceWithWaitState)
  extern function new(string name="AhbSlave16bitSingleReadSequenceWithWaitState");
  extern task body();
endclass : AhbSlave16bitSingleReadSequenceWithWaitState
 
function AhbSlave16bitSingleReadSequenceWithWaitState::new(string name="AhbSlave16bitSingleReadSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave16bitSingleReadSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
