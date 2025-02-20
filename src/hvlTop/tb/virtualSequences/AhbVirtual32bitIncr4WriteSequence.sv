`ifndef AHBVIRTUAL32BITINCR4WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITINCR4WRITESEQUENCE_INCLUDED_

class AhbVirtual32bitIncr4WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr4WriteSequence)

  AhbMaster32bitIncr4WriteSequence ahbMaster32bitIncr4WriteSequence;

  AhbSlave32bitIncr4WriteSequence ahbSlave32bitIncr4WriteSequence;

  extern function new(string name ="AhbVirtual32bitIncr4WriteSequence");
  extern task body();

endclass : AhbVirtual32bitIncr4WriteSequence

function AhbVirtual32bitIncr4WriteSequence::new(string name ="AhbVirtual32bitIncr4WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitIncr4WriteSequence::body();
  super.body();
  ahbMaster32bitIncr4WriteSequence = AhbMaster32bitIncr4WriteSequence::type_id::create("ahbMaster32bitIncr4WriteSequence");
  ahbSlave32bitIncr4WriteSequence  = AhbSlave32bitIncr4WriteSequence::type_id::create("ahbSlave32bitIncr4WriteSequence");
 fork
    forever begin
      ahbSlave32bitIncr4WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster32bitIncr4WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave32bitIncr4WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
