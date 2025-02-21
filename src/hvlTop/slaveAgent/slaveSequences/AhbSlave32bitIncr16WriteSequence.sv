`ifndef AHBSLAVE32BITINCR16WRITESEQUENCE_INCLUDED_
`define AHBSLAVE32BITINCR16WRITESEQUENCE_INCLUDED_  

class AhbSlave32bitIncr16WriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitIncr16WriteSequence)
  extern function new(string name="AhbSlave32bitIncr16WriteSequence");
  extern task body();
endclass : AhbSlave32bitIncr16WriteSequence
 
function AhbSlave32bitIncr16WriteSequence::new(string name="AhbSlave32bitIncr16WriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave32bitIncr16WriteSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
