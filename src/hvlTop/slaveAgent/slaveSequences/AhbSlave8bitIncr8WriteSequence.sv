
`ifndef AHBSLAVE8BITINCR8WRITESEQUENCE_INCLUDED_
`define AHBSLAVE8BITINCR8WRITESEQUENCE_INCLUDED_  

class AhbSlave8bitIncr8WriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitIncr8WriteSequence)
  extern function new(string name="AhbSlave8bitIncr8WriteSequence");
  extern task body();
endclass : AhbSlave8bitIncr8WriteSequence
 
function AhbSlave8bitIncr8WriteSequence::new(string name="AhbSlave8bitIncr8WriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave8bitIncr8WriteSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {
		      noOfWaitStates == 32'h0000;
   		     }) begin
    `uvm_fatal("AHB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
