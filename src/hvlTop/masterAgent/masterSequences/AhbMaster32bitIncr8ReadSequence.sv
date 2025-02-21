`ifndef AHBMASTER32BITINCR8READSEQUENCE_INCLUDED_
`define AHBMASTER32BITINCR8READSEQUENCE_INCLUDED_

class AhbMaster32bitIncr8ReadSequence extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster32bitIncr8ReadSequence)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster32bitIncr8ReadSequence");
  extern task body();
  
endclass :AhbMaster32bitIncr8ReadSequence
    
 function AhbMaster32bitIncr8ReadSequence::new(string name="AhbMaster32bitIncr8ReadSequence");
  super.new(name);
endfunction : new

task AhbMaster32bitIncr8ReadSequence::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 0;         // Read operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == WORD;    // 32-bit transfer
                              req.hburst == INCR8;    // INCR8 transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 32-bit Read")
  end
  finish_item(req);
endtask: body
`endif
