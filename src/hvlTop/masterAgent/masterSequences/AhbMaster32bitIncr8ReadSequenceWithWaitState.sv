`ifndef AHBMASTER32BITINCR8READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBMASTER32BITINCR8READSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbMaster32bitIncr8ReadSequenceWithWaitState extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster32bitIncr8ReadSequenceWithWaitState)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster32bitIncr8ReadSequenceWithWaitState");
  extern task body();
  
endclass :AhbMaster32bitIncr8ReadSequenceWithWaitState
    
 function AhbMaster32bitIncr8ReadSequenceWithWaitState::new(string name="AhbMaster32bitIncr8ReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbMaster32bitIncr8ReadSequenceWithWaitState::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 0;         // Read operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == WORD;    // 32-bit transfer
                              req.hburst == INCR8;    // INCR8 transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 32-bit Read")
  end
  finish_item(req);
endtask: body
`endif
