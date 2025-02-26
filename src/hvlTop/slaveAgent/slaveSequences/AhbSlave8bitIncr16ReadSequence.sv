`ifndef AHBSLAVE8BITINCR16READSEQUENCE_INCLUDED_
`define AHBSLAVE8BITINCR16READSEQUENCE_INCLUDED_  

class AhbSlave8bitIncr16ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitIncr16ReadSequence)
  extern function new(string name="AhbSlave8bitIncr16ReadSequence");
  extern task body();
endclass : AhbSlave8bitIncr16ReadSequence
 
function AhbSlave8bitIncr16ReadSequence::new(string name="AhbSlave8bitIncr16ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave8bitIncr16ReadSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("AHB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
