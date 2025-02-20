`ifndef AHBSLAVE32BITINCR4READSEQUENCE_INCLUDED_
`define AHBSLAVE32BITINCR4READSEQUENCE_INCLUDED_  

class AhbSlave32bitIncr4ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitIncr4ReadSequence)
  extern function new(string name="AhbSlave32bitIncr4ReadSequence");
  extern task body();
endclass : AhbSlave32bitIncr4ReadSequence
 
function AhbSlave32bitIncr4ReadSequence::new(string name="AhbSlave32bitIncr4ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave32bitIncr4ReadSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
