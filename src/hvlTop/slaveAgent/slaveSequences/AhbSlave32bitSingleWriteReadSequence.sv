`ifndef AHBSLAVE32BITSINGLEWRITEREADSEQUENCE_INCLUDED_
`define AHBSLAVE32BITSINGLEWRITEREADSEQUENCE_INCLUDED_  

class AhbSlave32bitSingleWriteReadSequence extends AhbSlaveBaseSequence;
   `uvm_object_utils(AhbSlave32bitSingleWriteReadSequence)
 
 rand bit choosePacketDataSequence;
 
 constraint chooseDataPacketSequenceConstraint {soft choosePacketDataSequence == 0;}

   extern function new(string name="AhbSlave32bitSingleWriteReadSequence");
   extern task body();
endclass : AhbSlave32bitSingleWriteReadSequence
 
function AhbSlave32bitSingleWriteReadSequence::new(string name="AhbSlave32bitSingleWriteReadSequence");
   super.new(name);
endfunction : new
 
task AhbSlave32bitSingleWriteReadSequence::body();
   req = AhbSlaveTransaction::type_id::create("req");
   start_item(req);
   if(!req.randomize() with {
      req.choosePacketData == choosePacketDataSequence;
    }) begin
      `uvm_fatal("AHB","AHB Read randomization failed")
   end
   req.print();
   finish_item(req);
endtask : body
`endif
