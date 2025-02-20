`ifndef AHBMASTER32BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBMASTER32BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbMaster32bitSingleReadSequenceWithWaitState extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster32bitSingleReadSequenceWithWaitState)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster32bitSingleReadSequenceWithWaitState");
  extern task body();
  
endclass :AhbMaster32bitSingleReadSequenceWithWaitState
    
 function AhbMaster32bitSingleReadSequenceWithWaitState::new(string name="AhbMaster32bitSingleReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbMaster32bitSingleReadSequenceWithWaitState::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 0;         // Read operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == WORD;    // 32-bit transfer
                              req.hburst == SINGLE;    // SINGLE transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 32-bit Read")
  end
  finish_item(req);
endtask: body
`endif
