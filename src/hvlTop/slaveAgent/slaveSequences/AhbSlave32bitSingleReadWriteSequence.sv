`ifndef AHBSLAVE32BITSINGLEREADWRITESEQUENCE_INCLUDED_
`define AHBSLAVE32BITSINGLEREADWRITESEQUENCE_INCLUDED_  

class AhbSlave32bitSingleReadWriteSequence extends AhbSlaveBaseSequence;
 `uvm_object_utils(AhbSlave32bitSingleReadWriteSequence)
 rand bit choosePacketDataSequence;
         
         constraint chooseDataPacketSequenceConstraint {soft choosePacketDataSequence == 0;}

   extern function new(string name="AhbSlave32bitSingleReadWriteSequence");
        extern task body();
endclass : AhbSlave32bitSingleReadWriteSequence
 
function AhbSlave32bitSingleReadWriteSequence::new(string name="AhbSlave32bitSingleReadWriteSequence");
   super.new(name);
endfunction : new
 
task AhbSlave32bitSingleReadWriteSequence::body();
   req = AhbSlaveTransaction::type_id::create("req");
   start_item(req);
   if(!req.randomize() with { req.choosePacketData == choosePacketDataSequence;
          }) begin
      `uvm_fatal("AHB","AHB Read randomization failed")
   end
   req.print();
   finish_item(req);
endtask : body
`endif
