`ifndef AHBSLAVE32BITINCR8READSEQUENCE_INCLUDED_
`define AHBSLAVE32BITINCR8READSEQUENCE_INCLUDED_  

class AhbSlave32bitIncr8ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitIncr8ReadSequence)
  extern function new(string name="AhbSlave32bitIncr8ReadSequence");
  extern task body();
endclass : AhbSlave32bitIncr8ReadSequence
 
function AhbSlave32bitIncr8ReadSequence::new(string name="AhbSlave32bitIncr8ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave32bitIncr8ReadSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
