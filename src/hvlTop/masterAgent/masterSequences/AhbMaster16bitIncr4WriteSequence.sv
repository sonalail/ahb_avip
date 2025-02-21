`ifndef AHBMASTER16BITINCR4WRITESEQUENCE_INCLUDED_
`define AHBMASTER16BITINCR4WRITESEQUENCE_INCLUDED_

class AhbMaster16bitIncr4WriteSequence extends AhbMasterBaseSequence;
  `uvm_object_utils(AhbMaster16bitIncr4WriteSequence)

  AhbMasterTransaction req;

  extern function new(string name ="AhbMaster16bitIncr4WriteSequence");
  extern task body();

endclass :AhbMaster16bitIncr4WriteSequence

 function AhbMaster16bitIncr4WriteSequence::new(string name="AhbMaster16bitIncr4WriteSequence");
  super.new(name);
endfunction : new

task AhbMaster16bitIncr4WriteSequence::body();
  super.body();
  req = AhbMasterTransaction::type_id::create("req");

  start_item(req);
  `uvm_info("AHB", $sformatf("req is of type: %s", req.get_type_name()), UVM_LOW)

  if (!req.randomize() with {
                              req.hwrite == 1;         // Write operation
                              req.htrans == NONSEQ;     // NONSEQ transaction
                              req.hsize  == HALFWORD;    // 16-bit transfer
                              req.hburst == INCR4;    // INCR4 transfer
                            }) begin
    `uvm_fatal("AHB", "Randomization failed for 16-bit Write")
  end
  finish_item(req);
endtask: body
`endif



