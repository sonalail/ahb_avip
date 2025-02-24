`ifndef AHBSLAVE32BITWRAP16WRITESEQUENCE_INCLUDED_
`define AHBSLAVE32BITWRAP16WRITESEQUENCE_INCLUDED_  

class AhbSlave32bitWrap16WriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitWrap16WriteSequence)
  extern function new(string name="AhbSlave32bitWrap16WriteSequence");
  extern task body();
endclass : AhbSlave32bitWrap16WriteSequence
 
function AhbSlave32bitWrap16WriteSequence::new(string name="AhbSlave32bitWrap16WriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave32bitWrap16WriteSequence::body();
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
