`ifndef AHBVIRTUAL32BITSINGLEWRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITSINGLEWRITESEQUENCE_INCLUDED_

class AhbVirtual32bitSingleWriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitSingleWriteSequence)

  AhbMaster32bitSingleWriteSequence ahbMaster32bitSingleWriteSequence;

  AhbSlave32bitSingleWriteSequence ahbSlave32bitSingleWriteSequence;

  extern function new(string name ="AhbVirtual32bitSingleWriteSequence");
  extern task body();

endclass : AhbVirtual32bitSingleWriteSequence

function AhbVirtual32bitSingleWriteSequence::new(string name ="AhbVirtual32bitSingleWriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitSingleWriteSequence::body();
  super.body();
  ahbMaster32bitSingleWriteSequence = AhbMaster32bitSingleWriteSequence::type_id::create("ahbMaster32bitSingleWriteSequence");
  ahbSlave32bitSingleWriteSequence  = AhbSlave32bitSingleWriteSequence::type_id::create("ahbSlave32bitSingleWriteSequence");
 fork
    forever begin
      ahbSlave32bitSingleWriteSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster32bitSingleWriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave32bitSingleWriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
