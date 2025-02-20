`ifndef AHBSLAVE8BITINCR4READSEQUENCE_INCLUDED_
`define AHBSLAVE8BITINCR4READSEQUENCE_INCLUDED_  

class AhbSlave8bitIncr4ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitIncr4ReadSequence)
  extern function new(string name="AhbSlave8bitIncr4ReadSequence");
  extern task body();
endclass : AhbSlave8bitIncr4ReadSequence
 
function AhbSlave8bitIncr4ReadSequence::new(string name="AhbSlave8bitIncr4ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave8bitIncr4ReadSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {
		      noOfWaitStates == 8'h0000;
   		     }) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
