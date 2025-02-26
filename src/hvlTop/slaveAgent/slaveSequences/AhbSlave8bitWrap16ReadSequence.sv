
`ifndef AHBSLAVE8BITWRAP16READSEQUENCE_INCLUDED_
`define AHBSLAVE8BITWRAP16READSEQUENCE_INCLUDED_  

class AhbSlave8bitWrap16ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitWrap16ReadSequence)
  extern function new(string name="AhbSlave8bitWrap16ReadSequence");
  extern task body();
endclass : AhbSlave8bitWrap16ReadSequence
 
function AhbSlave8bitWrap16ReadSequence::new(string name="AhbSlave8bitWrap16ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave8bitWrap16ReadSequence::body();
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
