
`ifndef AHBSLAVE8BITWRAP16WRITESEQUENCE_INCLUDED_
`define AHBSLAVE8BITWRAP16WRITESEQUENCE_INCLUDED_  

class AhbSlave8bitWrap16WriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitWrap16WriteSequence)
  extern function new(string name="AhbSlave8bitWrap16WriteSequence");
  extern task body();
endclass : AhbSlave8bitWrap16WriteSequence
 
function AhbSlave8bitWrap16WriteSequence::new(string name="AhbSlave8bitWrap16WriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave8bitWrap16WriteSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {
		      noOfWaitStates == 32'h0000;
   		     }) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
