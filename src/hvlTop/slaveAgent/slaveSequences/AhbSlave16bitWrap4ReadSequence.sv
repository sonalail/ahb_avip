`ifndef AHBSLAVE16BITWRAP4READSEQUENCE_INCLUDED_
`define AHBSLAVE16BITWRAP4READSEQUENCE_INCLUDED_  

class AhbSlave16bitWrap4ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave16bitWrap4ReadSequence)
  extern function new(string name="AhbSlave16bitWrap4ReadSequence");
  extern task body();
endclass : AhbSlave16bitWrap4ReadSequence
 
function AhbSlave16bitWrap4ReadSequence::new(string name="AhbSlave16bitWrap4ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave16bitWrap4ReadSequence::body();
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
