`ifndef AHBMASTER32BITWRAP4WRITESEQUENCE_INCLUDED_
`define AHBMASTER32BITWRAP4WRITESEQUENCE_INCLUDED_

class AhbMaster32bitWrap4WriteSequence extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster32bitWrap4WriteSequence)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster32bitWrap4WriteSequence");
  extern task body();
  
endclass :AhbMaster32bitWrap4WriteSequence
    
 function AhbMaster32bitWrap4WriteSequence::new(string name="AhbMaster32bitWrap4WriteSequence");
  super.new(name);
endfunction : new

task AhbMaster32bitWrap4WriteSequence::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 1;         // Write operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == WORD;    // 32-bit transfer
                              req.hburst == WRAP4;    // WRAP4 transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 32-bit Write")
  end
  finish_item(req);
endtask: body
`endif
