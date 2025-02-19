`ifndef AHBMASTER16BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBMASTER16BITSINGLEWRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbMaster16bitSingleWriteSequenceWithWaitState extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster16bitSingleWriteSequenceWithWaitState)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster16bitSingleWriteSequenceWithWaitState");
  extern task body();
  
endclass :AhbMaster16bitSingleWriteSequenceWithWaitState
    
 function AhbMaster16bitSingleWriteSequenceWithWaitState::new(string name="AhbMaster16bitSingleWriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbMaster16bitSingleWriteSequenceWithWaitState::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 1;         // Write operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == WORD;    // 16-bit transfer
                              req.hburst == SINGLE;    // SINGLE transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 16-bit Write")
  end
  finish_item(req);
endtask: body
`endif
