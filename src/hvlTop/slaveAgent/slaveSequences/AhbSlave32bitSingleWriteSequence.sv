`ifndef AHBSLAVE32BITSINGLEWRITESEQUENCE_INCLUDED_
`define AHBSLAVE32BITSINGLEWRITESEQUENCE_INCLUDED_  

class AhbSlave32bitSingleWriteSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlave32bitSingleWriteSequence)
  extern function new(string name="AhbSlave32bitSingleWriteSequence");
  extern task body();
endclass : AhbSlave32bitSingleWriteSequence
 
function AhbSlave32bitSingleWriteSequence::new(string name="AhbSlave32bitSingleWriteSequence");
  super.new(name);
endfunction : new
 
task AhbSlave32bitSingleWriteSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
