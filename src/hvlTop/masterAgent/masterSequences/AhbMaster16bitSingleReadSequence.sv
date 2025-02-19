`ifndef AHBMASTER16BITSINGLEREADSEQUENCE_INCLUDED_
`define AHBMASTER16BITSINGLEREADSEQUENCE_INCLUDED_

class AhbMaster16bitSingleReadSequence extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster16bitSingleReadSequence)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster16bitSingleReadSequence");
  extern task body();
  
endclass :AhbMaster16bitSingleReadSequence
    
 function AhbMaster16bitSingleReadSequence::new(string name="AhbMaster16bitSingleReadSequence");
  super.new(name);
endfunction : new

task AhbMaster16bitSingleReadSequence::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 0;         // Read operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == HALFWORD;    // 16-bit transfer
                              req.hburst == SINGLE;    // SINGLE transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 16-bit Read")
  end
  finish_item(req);
endtask: body
`endif
