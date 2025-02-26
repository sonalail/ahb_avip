
`ifndef AHBMASTER8BITINCR8WRITESEQUENCE_INCLUDED_
`define AHBMASTER8BITINCR8WRITESEQUENCE_INCLUDED_

class AhbMaster8bitIncr8WriteSequence extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster8bitIncr8WriteSequence)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster8bitIncr8WriteSequence");
  extern task body();
  
endclass :AhbMaster8bitIncr8WriteSequence
    
 function AhbMaster8bitIncr8WriteSequence::new(string name="AhbMaster8bitIncr8WriteSequence");
  super.new(name);
endfunction : new

task AhbMaster8bitIncr8WriteSequence::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 1;         // Write operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == BYTE;    // 8-bit transfer
                              req.hburst == INCR8;    // INCR8 transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 8-bit Write")
  end
  finish_item(req);
endtask: body
`endif
