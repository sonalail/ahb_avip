`ifndef AHBMASTER32BITSINGLEWRITESEQUENCE_INCLUDED_
`define AHBMASTER32BITSINGLEWRITESEQUENCE_INCLUDED_

class AhbMaster32bitSingleWriteSequence extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster32bitSingleWriteSequence)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster32bitSingleWriteSequence");
  extern task body();
  
endclass :AhbMaster32bitSingleWriteSequence
    
 function AhbMaster32bitSingleWriteSequence::new(string name="AhbMaster32bitSingleWriteSequence");
  super.new(name);
endfunction : new

task AhbMaster32bitSingleWriteSequence::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 1;         // Write operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == WORD;    // 32-bit transfer
                              req.hburst == SINGLE;    // SINGLE transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 32-bit Write")
  end
  finish_item(req);
endtask: body
`endif
