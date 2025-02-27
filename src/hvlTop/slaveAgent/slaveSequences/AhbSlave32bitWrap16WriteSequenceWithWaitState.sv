`ifndef AHBSLAVE32BITWRAP16WRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE32BITWRAP16WRITESEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave32bitWrap16WriteSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitWrap16WriteSequenceWithWaitState)
  extern function new(string name="AhbSlave32bitWrap16WriteSequenceWithWaitState");
  extern task body();
endclass : AhbSlave32bitWrap16WriteSequenceWithWaitState
 
function AhbSlave32bitWrap16WriteSequenceWithWaitState::new(string name="AhbSlave32bitWrap16WriteSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave32bitWrap16WriteSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("AHB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
