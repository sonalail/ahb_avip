`ifndef AHBSLAVE32BITINCR8WRITESEQUENCE_INCLUDED_
`define AHBSLAVE32BITINCR8WRITESEQUENCE_INCLUDED_  

class AhbSlave32bitIncr8WriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitIncr8WriteSequence)
  extern function new(string name="AhbSlave32bitIncr8WriteSequence");
  extern task body();
endclass : AhbSlave32bitIncr8WriteSequence
 
function AhbSlave32bitIncr8WriteSequence::new(string name="AhbSlave32bitIncr8WriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave32bitIncr8WriteSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
