
`ifndef AHBSLAVE8BITINCR8READSEQUENCE_INCLUDED_
`define AHBSLAVE8BITINCR8READSEQUENCE_INCLUDED_  

class AhbSlave8bitIncr8ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitIncr8ReadSequence)
  extern function new(string name="AhbSlave8bitIncr8ReadSequence");
  extern task body();
endclass : AhbSlave8bitIncr8ReadSequence
 
function AhbSlave8bitIncr8ReadSequence::new(string name="AhbSlave8bitIncr8ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave8bitIncr8ReadSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("AHB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
