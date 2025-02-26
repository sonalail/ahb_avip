
`ifndef AHBVIRTUAL8BITINCR8READSEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITINCR8READSEQUENCE_INCLUDED_

class AhbVirtual8bitIncr8ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitIncr8ReadSequence)

  AhbMaster8bitIncr8ReadSequence ahbMaster8bitIncr8ReadSequence;

  AhbSlave8bitIncr8ReadSequence ahbSlave8bitIncr8ReadSequence;

  extern function new(string name ="AhbVirtual8bitIncr8ReadSequence");
  extern task body();

endclass : AhbVirtual8bitIncr8ReadSequence

function AhbVirtual8bitIncr8ReadSequence::new(string name ="AhbVirtual8bitIncr8ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitIncr8ReadSequence::body();
  super.body();
  ahbMaster8bitIncr8ReadSequence = AhbMaster8bitIncr8ReadSequence::type_id::create("ahbMaster8bitIncr8ReadSequence");
  ahbSlave8bitIncr8ReadSequence  = AhbSlave8bitIncr8ReadSequence::type_id::create("ahbSlave8bitIncr8ReadSequence");
 fork
    forever begin
      ahbSlave8bitIncr8ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster8bitIncr8ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave8bitIncr8ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
