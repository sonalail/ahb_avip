`ifndef AHBSLAVE32BITSINGLEREADSEQUENCE_INCLUDED_
`define AHBSLAVE32BITSINGLEREADSEQUENCE_INCLUDED_  

class AhbSlave32bitSingleReadSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitSingleReadSequence)
  extern function new(string name="AhbSlave32bitSingleReadSequence");
  extern task body();
endclass : AhbSlave32bitSingleReadSequence
 
function AhbSlave32bitSingleReadSequence::new(string name="AhbSlave32bitSingleReadSequence");
  super.new(name);
endfunction : new
 
task AhbSlave32bitSingleReadSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
