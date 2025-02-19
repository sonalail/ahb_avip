`ifndef AHBSLAVE16BITSINGLEREADSEQUENCE_INCLUDED_
`define AHBSLAVE16BITSINGLEREADSEQUENCE_INCLUDED_  

class AhbSlave16bitSingleReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave16bitSingleReadSequence)
  extern function new(string name="AhbSlave16bitSingleReadSequence");
  extern task body();
endclass : AhbSlave16bitSingleReadSequence
 
function AhbSlave16bitSingleReadSequence::new(string name="AhbSlave16bitSingleReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave16bitSingleReadSequence::body();
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
