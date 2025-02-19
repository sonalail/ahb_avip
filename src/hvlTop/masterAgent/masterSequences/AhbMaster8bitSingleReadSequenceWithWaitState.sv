`ifndef AHBMASTER8BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBMASTER8BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbMaster8bitSingleReadSequenceWithWaitState extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster8bitSingleReadSequenceWithWaitState)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster8bitSingleReadSequenceWithWaitState");
  extern task body();
  
endclass :AhbMaster8bitSingleReadSequenceWithWaitState
    
 function AhbMaster8bitSingleReadSequenceWithWaitState::new(string name="AhbMaster8bitSingleReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbMaster8bitSingleReadSequenceWithWaitState::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 0;         // Read operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == BYTE;    // 8-bit transfer
                              req.hburst == SINGLE;    // SINGLE transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 8-bit Read")
  end
  finish_item(req);
endtask: body
`endif
