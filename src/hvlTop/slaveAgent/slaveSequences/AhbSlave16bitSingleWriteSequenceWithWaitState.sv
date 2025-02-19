`ifndef AHBSLAVE16BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE16BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave16bitSingleWriteSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave16bitSingleWriteSequenceWithWaitState)
  extern function new(string name="AhbSlave16bitSingleWriteSequenceWithWaitState");
  extern task body();
endclass : AhbSlave16bitSingleWriteSequenceWithWaitState
 
function AhbSlave16bitSingleWriteSequenceWithWaitState::new(string name="AhbSlave16bitSingleWriteSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave16bitSingleWriteSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
