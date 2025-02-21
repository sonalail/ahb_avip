`ifndef AHBSLAVE32BITINCR16READSEQUENCE_INCLUDED_
`define AHBSLAVE32BITINCR16READSEQUENCE_INCLUDED_  

class AhbSlave32bitIncr16ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitIncr16ReadSequence)
  extern function new(string name="AhbSlave32bitIncr16ReadSequence");
  extern task body();
endclass : AhbSlave32bitIncr16ReadSequence
 
function AhbSlave32bitIncr16ReadSequence::new(string name="AhbSlave32bitIncr16ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave32bitIncr16ReadSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
