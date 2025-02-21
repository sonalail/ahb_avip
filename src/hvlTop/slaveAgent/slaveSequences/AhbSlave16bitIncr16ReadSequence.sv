`ifndef AHBSLAVE16BITINCR16READSEQUENCE_INCLUDED_
`define AHBSLAVE16BITINCR16READSEQUENCE_INCLUDED_  

class AhbSlave16bitIncr16ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave16bitIncr16ReadSequence)
  extern function new(string name="AhbSlave16bitIncr16ReadSequence");
  extern task body();
endclass : AhbSlave16bitIncr16ReadSequence
 
function AhbSlave16bitIncr16ReadSequence::new(string name="AhbSlave16bitIncr16ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave16bitIncr16ReadSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("AHB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
