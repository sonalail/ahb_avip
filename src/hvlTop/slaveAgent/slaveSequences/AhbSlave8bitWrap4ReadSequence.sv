`ifndef AHBSLAVE8BITWRAP4READSEQUENCE_INCLUDED_
`define AHBSLAVE8BITWRAP4READSEQUENCE_INCLUDED_  

class AhbSlave8bitWrap4ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitWrap4ReadSequence)
  extern function new(string name="AhbSlave8bitWrap4ReadSequence");
  extern task body();
endclass : AhbSlave8bitWrap4ReadSequence
 
function AhbSlave8bitWrap4ReadSequence::new(string name="AhbSlave8bitWrap4ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave8bitWrap4ReadSequence::body();
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
