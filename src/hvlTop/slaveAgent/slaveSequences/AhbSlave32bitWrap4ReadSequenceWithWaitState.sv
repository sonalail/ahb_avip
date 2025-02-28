`ifndef AHBSLAVE32BITWRAP4READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBSLAVE32BITWRAP4READSEQUENCEWITHWAITSTATE_INCLUDED_  

class AhbSlave32bitWrap4ReadSequenceWithWaitState extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitWrap4ReadSequenceWithWaitState)
  extern function new(string name="AhbSlave32bitWrap4ReadSequenceWithWaitState");
  extern task body();
endclass : AhbSlave32bitWrap4ReadSequenceWithWaitState
 
function AhbSlave32bitWrap4ReadSequenceWithWaitState::new(string name="AhbSlave32bitWrap4ReadSequenceWithWaitState");
  super.new(name);
endfunction : new
 
task AhbSlave32bitWrap4ReadSequenceWithWaitState::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {req.noOfWaitStates==2;}) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
