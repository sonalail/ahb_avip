
`ifndef AHBVIRTUAL8BITINCR16READSEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITINCR16READSEQUENCE_INCLUDED_

class AhbVirtual8bitIncr16ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitIncr16ReadSequence)

  AhbMaster8bitIncr16ReadSequence ahbMaster8bitIncr16ReadSequence;

  AhbSlave8bitIncr16ReadSequence ahbSlave8bitIncr16ReadSequence;

  extern function new(string name ="AhbVirtual8bitIncr16ReadSequence");
  extern task body();

endclass : AhbVirtual8bitIncr16ReadSequence

function AhbVirtual8bitIncr16ReadSequence::new(string name ="AhbVirtual8bitIncr16ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitIncr16ReadSequence::body();
  super.body();
  ahbMaster8bitIncr16ReadSequence = AhbMaster8bitIncr16ReadSequence::type_id::create("ahbMaster8bitIncr16ReadSequence");
  ahbSlave8bitIncr16ReadSequence  = AhbSlave8bitIncr16ReadSequence::type_id::create("ahbSlave8bitIncr16ReadSequence");
 fork
    forever begin
      ahbSlave8bitIncr16ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster8bitIncr16ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave8bitIncr16ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
