`ifndef AHBMASTER16BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBMASTER16BITSINGLEREADSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbMaster16bitSingleReadSequenceWithWaitState extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster16bitSingleReadSequenceWithWaitState)
 
  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster16bitSingleReadSequenceWithWaitState");
  extern task body();
  
endclass :AhbMaster16bitSingleReadSequenceWithWaitState
    
 function AhbMaster16bitSingleReadSequenceWithWaitState::new(string name="AhbMaster16bitSingleReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbMaster16bitSingleReadSequenceWithWaitState::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with { 
                              req.hwrite == 0;         // Read operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == HALFWORD;    // 16-bit transfer
                              req.hburst == SINGLE;    // SINGLE transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 16-bit Read")
  end
  finish_item(req);
endtask: body
`endif
