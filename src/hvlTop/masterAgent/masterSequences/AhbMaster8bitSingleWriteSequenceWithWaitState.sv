`ifndef AHBMASTER8BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBMASTER8BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbMaster8bitSingleWriteSequenceWithWaitState extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster8bitSingleWriteSequenceWithWaitState)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster8bitSingleWriteSequenceWithWaitState");
  extern task body();
  
endclass :AhbMaster8bitSingleWriteSequenceWithWaitState
    
 function AhbMaster8bitSingleWriteSequenceWithWaitState::new(string name="AhbMaster8bitSingleWriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbMaster8bitSingleWriteSequenceWithWaitState::body();
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
