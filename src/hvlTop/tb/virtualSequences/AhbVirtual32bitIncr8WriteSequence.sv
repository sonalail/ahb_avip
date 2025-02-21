`ifndef AHBVIRTUAL32BITINCR8WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITINCR8WRITESEQUENCE_INCLUDED_

class AhbVirtual32bitIncr8WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr8WriteSequence)

  AhbMaster32bitIncr8WriteSequence ahbMaster32bitIncr8WriteSequence;

  AhbSlave32bitIncr8WriteSequence ahbSlave32bitIncr8WriteSequence;

  extern function new(string name ="AhbVirtual32bitIncr8WriteSequence");
  extern task body();

endclass : AhbVirtual32bitIncr8WriteSequence

function AhbVirtual32bitIncr8WriteSequence::new(string name ="AhbVirtual32bitIncr8WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitIncr8WriteSequence::body();
  super.body();
  ahbMaster32bitIncr8WriteSequence = AhbMaster32bitIncr8WriteSequence::type_id::create("ahbMaster32bitIncr8WriteSequence");
  ahbSlave32bitIncr8WriteSequence  = AhbSlave32bitIncr8WriteSequence::type_id::create("ahbSlave32bitIncr8WriteSequence");
 /*fork
    forever begin
      ahbSlave32bitIncr8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster32bitIncr8WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave32bitIncr8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end
  */

   fork
      ahbSlave32bitIncr8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMaster32bitIncr8WriteSequence.start(p_sequencer.ahbMasterSequencer); 
   join	
 
endtask : body

`endif
