`ifndef AHBSLAVE8BITSINGLEWRITESEQUENCE_INCLUDED_
`define AHBSLAVE8BITSINGLEWRITESEQUENCE_INCLUDED_  

class AhbSlave8bitSingleWriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitSingleWriteSequence)
  extern function new(string name="AhbSlave8bitSingleWriteSequence");
  extern task body();
endclass : AhbSlave8bitSingleWriteSequence
 
function AhbSlave8bitSingleWriteSequence::new(string name="AhbSlave8bitSingleWriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave8bitSingleWriteSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with {
                           req.noOfWaitStates == 32'h0000;
                           }) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
