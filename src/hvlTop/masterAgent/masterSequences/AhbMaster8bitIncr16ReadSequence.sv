`ifndef AHBMASTER8BITINCR16READSEQUENCE_INCLUDED_
`define AHBMASTER8BITINCR16READSEQUENCE_INCLUDED_

class AhbMaster8bitIncr16ReadSequence extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster8bitIncr16ReadSequence)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster8bitIncr16ReadSequence");
  extern task body();
  
endclass :AhbMaster8bitIncr16ReadSequence
    
 function AhbMaster8bitIncr16ReadSequence::new(string name="AhbMaster8bitIncr16ReadSequence");
  super.new(name);
endfunction : new

task AhbMaster8bitIncr16ReadSequence::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 0;         // Read operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == BYTE;    // 8-bit transfer
                              req.hburst == INCR16;    // INCR16 transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 8-bit Read")
  end
  finish_item(req);
endtask: body
`endif
