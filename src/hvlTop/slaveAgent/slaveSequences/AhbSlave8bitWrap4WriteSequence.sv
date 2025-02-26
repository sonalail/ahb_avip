`ifndef AHBSLAVE8BITWRAP4WRITESEQUENCE_INCLUDED_
`define AHBSLAVE8BITWRAP4WRITESEQUENCE_INCLUDED_  

class AhbSlave8bitWrap4WriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitWrap4WriteSequence)
  extern function new(string name="AhbSlave8bitWrap4WriteSequence");
  extern task body();
endclass : AhbSlave8bitWrap4WriteSequence
 
function AhbSlave8bitWrap4WriteSequence::new(string name="AhbSlave8bitWrap4WriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave8bitWrap4WriteSequence::body();
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
