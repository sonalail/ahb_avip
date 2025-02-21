`ifndef AHBSLAVE16BITINCR16WRITESEQUENCE_INCLUDED_
`define AHBSLAVE16BITINCR16WRITESEQUENCE_INCLUDED_  

class AhbSlave16bitIncr16WriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave16bitIncr16WriteSequence)
  extern function new(string name="AhbSlave16bitIncr16WriteSequence");
  extern task body();
endclass : AhbSlave16bitIncr16WriteSequence
 
function AhbSlave16bitIncr16WriteSequence::new(string name="AhbSlave16bitIncr16WriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave16bitIncr16WriteSequence::body();
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
