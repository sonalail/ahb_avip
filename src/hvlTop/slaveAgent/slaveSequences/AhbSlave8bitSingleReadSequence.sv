`ifndef AHBSLAVE8BITSINGLEREADSEQUENCE_INCLUDED_
`define AHBSLAVE8BITSINGLEREADSEQUENCE_INCLUDED_  

class AhbSlave8bitSingleReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave8bitSingleReadSequence)
  extern function new(string name="AhbSlave8bitSingleReadSequence");
  extern task body();
endclass : AhbSlave8bitSingleReadSequence
 
function AhbSlave8bitSingleReadSequence::new(string name="AhbSlave8bitSingleReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave8bitSingleReadSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with{
                            req.noOfWaitStates == 32'h0000;
                          }) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
