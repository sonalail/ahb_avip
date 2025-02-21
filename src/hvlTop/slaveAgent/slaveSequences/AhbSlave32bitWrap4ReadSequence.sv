`ifndef AHBSLAVE32BITWRAP4READSEQUENCE_INCLUDED_
`define AHBSLAVE32BITWRAP4READSEQUENCE_INCLUDED_  

class AhbSlave32bitWrap4ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitWrap4ReadSequence)
  extern function new(string name="AhbSlave32bitWrap4ReadSequence");
  extern task body();
endclass : AhbSlave32bitWrap4ReadSequence
 
function AhbSlave32bitWrap4ReadSequence::new(string name="AhbSlave32bitWrap4ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave32bitWrap4ReadSequence::body();
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
