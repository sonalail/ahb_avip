
`ifndef AHBSLAVE16BITWRAP16READSEQUENCE_INCLUDED_
`define AHBSLAVE16BITWRAP16READSEQUENCE_INCLUDED_  

class AhbSlave16bitWrap16ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave16bitWrap16ReadSequence)
  extern function new(string name="AhbSlave16bitWrap16ReadSequence");
  extern task body();
endclass : AhbSlave16bitWrap16ReadSequence
 
function AhbSlave16bitWrap16ReadSequence::new(string name="AhbSlave16bitWrap16ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave16bitWrap16ReadSequence::body();
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
