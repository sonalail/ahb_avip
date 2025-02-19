`ifndef AHBMASTER8BITSINGLEWRITEREADSEQUENCE_INCLUDED_
`define AHBMASTER8BITSINGLEWRITEREADSEQUENCE_INCLUDED_

class AhbMaster8bitSingleWriteReadSequence extends AhbMasterBaseSequence;
   `uvm_object_utils(AhbMaster8bitSingleWriteReadSequence)
  rand bit [ADDR_WIDTH-1:0]addrSequence;
   AhbMasterTransaction req;

   extern function new(string name ="AhbMaster8bitSingleWriteReadSequence");
   extern task body();
  
endclass :AhbMaster8bitSingleWriteReadSequence
    
function AhbMaster8bitSingleWriteReadSequence::new(string name="AhbMaster8bitSingleWriteReadSequence");
   super.new(name);
endfunction : new

task AhbMaster8bitSingleWriteReadSequence::body();
   super.body();
   req = AhbMasterTransaction::type_id::create("req");

   start_item(req);
    `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

    if (!req.randomize() with {
          req.haddr == addrSequence; 
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
