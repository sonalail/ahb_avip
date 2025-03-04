`ifndef AHBSLAVE16BITWRAP4WRITESEQUENCE_INCLUDED_
`define AHBSLAVE16BITWRAP4WRITESEQUENCE_INCLUDED_  

class AhbSlave16bitWrap4WriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave16bitWrap4WriteSequence)
  extern function new(string name="AhbSlave16bitWrap4WriteSequence");
  extern task body();
endclass : AhbSlave16bitWrap4WriteSequence
 
function AhbSlave16bitWrap4WriteSequence::new(string name="AhbSlave16bitWrap4WriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave16bitWrap4WriteSequence::body();
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
