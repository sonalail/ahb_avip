`ifndef AHBSLAVE8BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE8BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave8bitSingleWriteSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitSingleWriteSequenceWithWaitState)
  extern function new(string name="AhbSlave8bitSingleWriteSequenceWithWaitState");
  extern task body();
endclass : AhbSlave8bitSingleWriteSequenceWithWaitState
 
function AhbSlave8bitSingleWriteSequenceWithWaitState::new(string name="AhbSlave8bitSingleWriteSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave8bitSingleWriteSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
