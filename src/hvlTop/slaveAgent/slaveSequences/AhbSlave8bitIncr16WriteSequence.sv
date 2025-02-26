
`ifndef AHBSLAVE8BITINCR16WRITESEQUENCE_INCLUDED_
`define AHBSLAVE8BITINCR16WRITESEQUENCE_INCLUDED_  

class AhbSlave8bitIncr16WriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitIncr16WriteSequence)
  extern function new(string name="AhbSlave8bitIncr16WriteSequence");
  extern task body();
endclass : AhbSlave8bitIncr16WriteSequence
 
function AhbSlave8bitIncr16WriteSequence::new(string name="AhbSlave8bitIncr16WriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave8bitIncr16WriteSequence::body();
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
