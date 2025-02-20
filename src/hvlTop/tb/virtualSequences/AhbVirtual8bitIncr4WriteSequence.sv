`ifndef AHBVIRTUAL8BITINCR4WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITINCR4WRITESEQUENCE_INCLUDED_

class AhbVirtual8bitIncr4WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitIncr4WriteSequence)

  AhbMaster8bitIncr4WriteSequence ahbMaster8bitIncr4WriteSequence;

  AhbSlave8bitIncr4WriteSequence ahbSlave8bitIncr4WriteSequence;

  extern function new(string name ="AhbVirtual8bitIncr4WriteSequence");
  extern task body();

endclass : AhbVirtual8bitIncr4WriteSequence

function AhbVirtual8bitIncr4WriteSequence::new(string name ="AhbVirtual8bitIncr4WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitIncr4WriteSequence::body();
  super.body();
  ahbMaster8bitIncr4WriteSequence = AhbMaster8bitIncr4WriteSequence::type_id::create("ahbMaster8bitIncr4WriteSequence");
  ahbSlave8bitIncr4WriteSequence  = AhbSlave8bitIncr4WriteSequence::type_id::create("ahbSlave8bitIncr4WriteSequence");
 fork
    forever begin
      ahbSlave8bitIncr4WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster8bitIncr4WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave8bitIncr4WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
