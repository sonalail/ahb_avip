`ifndef AHBMASTER16BITWRAP8READSEQUENCE_INCLUDED_
`define AHBMASTER16BITWRAP8READSEQUENCE_INCLUDED_

class AhbMaster16bitWrap8ReadSequence extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster16bitWrap8ReadSequence)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster16bitWrap8ReadSequence");
  extern task body();
  
endclass :AhbMaster16bitWrap8ReadSequence
    
 function AhbMaster16bitWrap8ReadSequence::new(string name="AhbMaster16bitWrap8ReadSequence");
  super.new(name);
endfunction : new

task AhbMaster16bitWrap8ReadSequence::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 0;         // Read operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == HALFWORD;    // 16-bit transfer
                              req.hburst == WRAP8;    // WRAP8 transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 16-bit Read")
  end
  finish_item(req);
endtask: body
`endif
