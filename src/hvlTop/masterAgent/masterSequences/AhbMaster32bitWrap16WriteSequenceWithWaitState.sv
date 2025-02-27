`ifndef AHBMASTER32BITWRAP16WRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBMASTER32BITWRAP16WRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbMaster32bitWrap16WriteSequenceWithWaitState extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster32bitWrap16WriteSequenceWithWaitState)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster32bitWrap16WriteSequenceWithWaitState");
  extern task body();
  
endclass :AhbMaster32bitWrap16WriteSequenceWithWaitState
    
 function AhbMaster32bitWrap16WriteSequenceWithWaitState::new(string name="AhbMaster32bitWrap16WriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbMaster32bitWrap16WriteSequenceWithWaitState::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 1;         // Write operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == WORD;    // 32-bit transfer
                              req.hburst == WRAP16;    // WRAP16 transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 32-bit Write")
  end
  finish_item(req);
endtask: body
`endif
