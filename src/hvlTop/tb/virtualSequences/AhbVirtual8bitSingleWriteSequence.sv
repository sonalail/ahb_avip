`ifndef AHBVIRTUAL8BITSINGLEWRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITSINGLEWRITESEQUENCE_INCLUDED_

class AhbVirtual8bitSingleWriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitSingleWriteSequence)

  AhbMaster8bitSingleWriteSequence ahbMaster8bitSingleWriteSequence;

  AhbSlave8bitSingleWriteSequence ahbSlave8bitSingleWriteSequence;

  extern function new(string name ="AhbVirtual8bitSingleWriteSequence");
  extern task body();

endclass : AhbVirtual8bitSingleWriteSequence

function AhbVirtual8bitSingleWriteSequence::new(string name ="AhbVirtual8bitSingleWriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitSingleWriteSequence::body();
  super.body();
  ahbMaster8bitSingleWriteSequence = AhbMaster8bitSingleWriteSequence::type_id::create("ahbMaster8bitSingleWriteSequence");
  ahbSlave8bitSingleWriteSequence  = AhbSlave8bitSingleWriteSequence::type_id::create("ahbSlave8bitSingleWriteSequence");
 fork
    forever begin
      ahbSlave8bitSingleWriteSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster8bitSingleWriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave8bitSingleWriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
