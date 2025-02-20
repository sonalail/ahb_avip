`ifndef AHBSLAVE8BITINCR4WRITESEQUENCE_INCLUDED_
`define AHBSLAVE8BITINCR4WRITESEQUENCE_INCLUDED_  

class AhbSlave8bitIncr4WriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitIncr4WriteSequence)
  extern function new(string name="AhbSlave8bitIncr4WriteSequence");
  extern task body();
endclass : AhbSlave8bitIncr4WriteSequence
 
function AhbSlave8bitIncr4WriteSequence::new(string name="AhbSlave8bitIncr4WriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave8bitIncr4WriteSequence::body();
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
