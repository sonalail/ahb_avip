`ifndef AHBMASTER32BITINCR4READSEQUENCE_INCLUDED_
`define AHBMASTER32BITINCR4READSEQUENCE_INCLUDED_

class AhbMaster32bitIncr4ReadSequence extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster32bitIncr4ReadSequence)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster32bitIncr4ReadSequence");
  extern task body();
  
endclass :AhbMaster32bitIncr4ReadSequence
    
 function AhbMaster32bitIncr4ReadSequence::new(string name="AhbMaster32bitIncr4ReadSequence");
  super.new(name);
endfunction : new

task AhbMaster32bitIncr4ReadSequence::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 0;         // Read operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == WORD;    // 32-bit transfer
                              req.hburst == INCR4;    // INCR4 transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 32-bit Read")
  end
  finish_item(req);
endtask: body
`endif
