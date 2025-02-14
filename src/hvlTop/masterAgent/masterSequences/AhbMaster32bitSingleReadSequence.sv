`ifndef AHBMASTER32BITSINGLEREADSEQUENCE_INCLUDED_
`define AHBMASTER32BITSINGLEREADSEQUENCE_INCLUDED_

class AhbMaster32bitSingleReadSequence extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster32bitSingleReadSequence)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster32bitSingleReadSequence");
  extern task body();
  
endclass :AhbMaster32bitSingleReadSequence
    
 function AhbMaster32bitSingleReadSequence::new(string name="AhbMaster32bitSingleReadSequence");
  super.new(name);
endfunction : new

task AhbMaster32bitSingleReadSequence::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 0;         // Read operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == WORD;    // 32-bit transfer
                              req.hburst == SINGLE;    // SINGLE transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 32-bit Read")
  end
  finish_item(req);
endtask: body
`endif
