`ifndef AHBSLAVE32BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE32BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave32bitSingleReadSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitSingleReadSequenceWithWaitState)
  extern function new(string name="AhbSlave32bitSingleReadSequenceWithWaitState");
  extern task body();
endclass : AhbSlave32bitSingleReadSequenceWithWaitState
 
function AhbSlave32bitSingleReadSequenceWithWaitState::new(string name="AhbSlave32bitSingleReadSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave32bitSingleReadSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
