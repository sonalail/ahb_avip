`ifndef AHBVIRTUAL8BITINCR8WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITINCR8WRITESEQUENCE_INCLUDED_

class AhbVirtual8bitIncr8WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitIncr8WriteSequence)

  AhbMaster8bitIncr8WriteSequence ahbMaster8bitIncr8WriteSequence;

  AhbSlave8bitIncr8WriteSequence ahbSlave8bitIncr8WriteSequence;

  extern function new(string name ="AhbVirtual8bitIncr8WriteSequence");
  extern task body();

endclass : AhbVirtual8bitIncr8WriteSequence

function AhbVirtual8bitIncr8WriteSequence::new(string name ="AhbVirtual8bitIncr8WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitIncr8WriteSequence::body();
  super.body();
  ahbMaster8bitIncr8WriteSequence = AhbMaster8bitIncr8WriteSequence::type_id::create("ahbMaster8bitIncr8WriteSequence");
  ahbSlave8bitIncr8WriteSequence  = AhbSlave8bitIncr8WriteSequence::type_id::create("ahbSlave8bitIncr8WriteSequence");
 fork
    forever begin
      ahbSlave8bitIncr8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster8bitIncr8WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave8bitIncr8WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
