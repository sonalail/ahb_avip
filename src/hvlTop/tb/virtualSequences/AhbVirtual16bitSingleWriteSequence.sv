`ifndef AHBVIRTUAL16BITSINGLEWRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITSINGLEWRITESEQUENCE_INCLUDED_

class AhbVirtual16bitSingleWriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitSingleWriteSequence)

  AhbMaster16bitSingleWriteSequence ahbMaster16bitSingleWriteSequence;

  AhbSlave16bitSingleWriteSequence ahbSlave16bitSingleWriteSequence;

  extern function new(string name ="AhbVirtual16bitSingleWriteSequence");
  extern task body();

endclass : AhbVirtual16bitSingleWriteSequence

function AhbVirtual16bitSingleWriteSequence::new(string name ="AhbVirtual16bitSingleWriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitSingleWriteSequence::body();
  super.body();
  ahbMaster16bitSingleWriteSequence = AhbMaster16bitSingleWriteSequence::type_id::create("ahbMaster16bitSingleWriteSequence");
  ahbSlave16bitSingleWriteSequence  = AhbSlave16bitSingleWriteSequence::type_id::create("ahbSlave16bitSingleWriteSequence");
 fork
   // forever begin
      ahbSlave16bitSingleWriteSequence.start(p_sequencer.ahbSlaveSequencer);
   // end
  join_none

  repeat(1) begin
    ahbMaster16bitSingleWriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave16bitSingleWriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
