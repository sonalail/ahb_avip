`ifndef AHBSLAVE32BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE32BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave32bitSingleWriteSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitSingleWriteSequenceWithWaitState)
  extern function new(string name="AhbSlave32bitSingleWriteSequenceWithWaitState");
  extern task body();
endclass : AhbSlave32bitSingleWriteSequenceWithWaitState
 
function AhbSlave32bitSingleWriteSequenceWithWaitState::new(string name="AhbSlave32bitSingleWriteSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave32bitSingleWriteSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
