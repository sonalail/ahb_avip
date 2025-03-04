`ifndef AHBMASTER32BITINCR4WRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBMASTER32BITINCR4WRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbMaster32bitIncr4WriteSequenceWithWaitState extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster32bitIncr4WriteSequenceWithWaitState)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster32bitIncr4WriteSequenceWithWaitState");
  extern task body();
  
endclass :AhbMaster32bitIncr4WriteSequenceWithWaitState
    
 function AhbMaster32bitIncr4WriteSequenceWithWaitState::new(string name="AhbMaster32bitIncr4WriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbMaster32bitIncr4WriteSequenceWithWaitState::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 1;         // Write operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == WORD;    // 32-bit transfer
                              req.hburst == INCR4;    // INCR4 transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 32-bit Write")
  end
  finish_item(req);
endtask: body
`endif
