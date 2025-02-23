`ifndef AHBSLAVE16BITWRAP8WRITESEQUENCE_INCLUDED_
`define AHBSLAVE16BITWRAP8WRITESEQUENCE_INCLUDED_  

class AhbSlave16bitWrap8WriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave16bitWrap8WriteSequence)
  extern function new(string name="AhbSlave16bitWrap8WriteSequence");
  extern task body();
endclass : AhbSlave16bitWrap8WriteSequence
 
function AhbSlave16bitWrap8WriteSequence::new(string name="AhbSlave16bitWrap8WriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave16bitWrap8WriteSequence::body();
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
