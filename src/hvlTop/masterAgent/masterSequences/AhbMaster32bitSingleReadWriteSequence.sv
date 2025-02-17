`ifndef AHBMASTER32BITSINGLEREADWRITESEQUENCE_INCLUDED_
`define AHBMASTER32BITSINGLEREADWRITESEQUENCE_INCLUDED_

class AhbMaster32bitSingleReadWriteSequence extends AhbMasterBaseSequence;
   `uvm_object_utils(AhbMaster32bitSingleReadWriteSequence)
          
   rand bit[ADDR_WIDTH-1:0]addrSequence;
   
   AhbMasterTransaction req;

   extern function new(string name ="AhbMaster32bitSingleReadWriteSequence");
   extern task body();
  
endclass :AhbMaster32bitSingleReadWriteSequence
    
function AhbMaster32bitSingleReadWriteSequence::new(string name="AhbMaster32bitSingleReadWriteSequence");
   super.new(name);
endfunction : new

task AhbMaster32bitSingleReadWriteSequence::body();
   super.body();
   req = AhbMasterTransaction::type_id::create("req");

   start_item(req);
    `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

   if (!req.randomize() with { 
          req.haddr  == addrSequence;
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
