`ifndef AHBSLAVE8BITSINGLEWRITEREADSEQUENCE_INCLUDED_
`define AHBSLAVE8BITSINGLEWRITEREADSEQUENCE_INCLUDED_  

class AhbSlave8bitSingleWriteReadSequence extends AhbSlaveBaseSequence;
   `uvm_object_utils(AhbSlave8bitSingleWriteReadSequence)
 
 rand bit choosePacketDataSequence;
 
 constraint chooseDataPacketSequenceConstraint {soft choosePacketDataSequence == 0;}

   extern function new(string name="AhbSlave8bitSingleWriteReadSequence");
   extern task body();
endclass : AhbSlave8bitSingleWriteReadSequence
 
function AhbSlave8bitSingleWriteReadSequence::new(string name="AhbSlave8bitSingleWriteReadSequence");
   super.new(name);
endfunction : new
 
task AhbSlave8bitSingleWriteReadSequence::body();
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
