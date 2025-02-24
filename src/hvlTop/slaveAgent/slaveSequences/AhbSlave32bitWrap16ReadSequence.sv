`ifndef AHBSLAVE32BITWRAP16READSEQUENCE_INCLUDED_
`define AHBSLAVE32BITWRAP16READSEQUENCE_INCLUDED_  

class AhbSlave32bitWrap16ReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitWrap16ReadSequence)
  extern function new(string name="AhbSlave32bitWrap16ReadSequence");
  extern task body();
endclass : AhbSlave32bitWrap16ReadSequence
 
function AhbSlave32bitWrap16ReadSequence::new(string name="AhbSlave32bitWrap16ReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave32bitWrap16ReadSequence::body();
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
