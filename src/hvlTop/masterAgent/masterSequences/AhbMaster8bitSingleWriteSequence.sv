`ifndef AHBMASTER8BITSINGLEWRITESEQUENCE_INCLUDED_
`define AHBMASTER8BITSINGLEWRITESEQUENCE_INCLUDED_

class AhbMaster8bitSingleWriteSequence extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster8bitSingleWriteSequence)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster8bitSingleWriteSequence");
  extern task body();
  
endclass :AhbMaster8bitSingleWriteSequence
    
 function AhbMaster8bitSingleWriteSequence::new(string name="AhbMaster8bitSingleWriteSequence");
  super.new(name);
endfunction : new

task AhbMaster8bitSingleWriteSequence::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 1;         // Write operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == BYTE;    // 8-bit transfer
                              req.hburst == SINGLE;    // SINGLE transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 8-bit Write")
  end
  finish_item(req);
endtask: body
`endif
