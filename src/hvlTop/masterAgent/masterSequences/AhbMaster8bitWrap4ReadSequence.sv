`ifndef AHBMASTER8BITWRAP4READSEQUENCE_INCLUDED_
`define AHBMASTER8BITWRAP4READSEQUENCE_INCLUDED_

class AhbMaster8bitWrap4ReadSequence extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster8bitWrap4ReadSequence)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster8bitWrap4ReadSequence");
  extern task body();
  
endclass :AhbMaster8bitWrap4ReadSequence
    
 function AhbMaster8bitWrap4ReadSequence::new(string name="AhbMaster8bitWrap4ReadSequence");
  super.new(name);
endfunction : new

task AhbMaster8bitWrap4ReadSequence::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 0;         // Read operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == BYTE;    // 8-bit transfer
                              req.hburst == WRAP4;    // WRAP4 transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 8-bit Read")
  end
  finish_item(req);
endtask: body
`endif
