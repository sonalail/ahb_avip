`ifndef AHBVIRTUAL16BITINCR8WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITINCR8WRITESEQUENCE_INCLUDED_

class AhbVirtual16bitIncr8WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitIncr8WriteSequence)

  AhbMaster16bitIncr8WriteSequence ahbMaster16bitIncr8WriteSequence;

  AhbSlave16bitIncr8WriteSequence ahbSlave16bitIncr8WriteSequence;

  extern function new(string name ="AhbVirtual16bitIncr8WriteSequence");
  extern task body();

endclass : AhbVirtual16bitIncr8WriteSequence

function AhbVirtual16bitIncr8WriteSequence::new(string name ="AhbVirtual16bitIncr8WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitIncr8WriteSequence::body();
  super.body();
  ahbMaster16bitIncr8WriteSequence = AhbMaster16bitIncr8WriteSequence::type_id::create("ahbMaster16bitIncr8WriteSequence");
  ahbSlave16bitIncr8WriteSequence  = AhbSlave16bitIncr8WriteSequence::type_id::create("ahbSlave16bitIncr8WriteSequence");
 /*fork
    forever begin
      ahbSlave16bitIncr8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster16bitIncr8WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end*/
 fork 
        ahbMaster16bitIncr8WriteSequence.start(p_sequencer.ahbMasterSequencer);
  	ahbSlave16bitIncr8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
 join

   /* repeat(1)begin
  	ahbSlave16bitIncr8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
