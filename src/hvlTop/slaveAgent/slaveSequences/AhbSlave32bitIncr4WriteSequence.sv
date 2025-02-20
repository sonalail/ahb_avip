`ifndef AHBSLAVE32BITINCR4WRITESEQUENCE_INCLUDED_
`define AHBSLAVE32BITINCR4WRITESEQUENCE_INCLUDED_  

class AhbSlave32bitIncr4WriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitIncr4WriteSequence)
  extern function new(string name="AhbSlave32bitIncr4WriteSequence");
  extern task body();
endclass : AhbSlave32bitIncr4WriteSequence
 
function AhbSlave32bitIncr4WriteSequence::new(string name="AhbSlave32bitIncr4WriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave32bitIncr4WriteSequence::body();
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
