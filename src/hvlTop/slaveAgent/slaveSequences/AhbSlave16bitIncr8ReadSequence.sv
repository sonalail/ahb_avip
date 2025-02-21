`ifndef AHBSLAVE16BITINCR8READSEQUENCE_INCLUDED_
`define AHBSLAVE16BITINCR8READSEQUENCE_INCLUDED_  

class AhbSlave16bitIncr8ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave16bitIncr8ReadSequence)
  extern function new(string name="AhbSlave16bitIncr8ReadSequence");
  extern task body();
endclass : AhbSlave16bitIncr8ReadSequence
 
function AhbSlave16bitIncr8ReadSequence::new(string name="AhbSlave32bitIncr8ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave16bitIncr8ReadSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("AHB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
