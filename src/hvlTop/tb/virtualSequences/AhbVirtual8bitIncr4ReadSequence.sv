`ifndef AHBVIRTUAL8BITINCR4READSEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITINCR4READSEQUENCE_INCLUDED_

class AhbVirtual8bitIncr4ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual8bitIncr4ReadSequence)

  AhbMaster8bitIncr4ReadSequence ahbMaster8bitIncr4ReadSequence;

  AhbSlave8bitIncr4ReadSequence ahbSlave8bitIncr4ReadSequence;

  extern function new(string name ="AhbVirtual8bitIncr4ReadSequence");
  extern task body();

endclass : AhbVirtual8bitIncr4ReadSequence

function AhbVirtual8bitIncr4ReadSequence::new(string name ="AhbVirtual8bitIncr4ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual8bitIncr4ReadSequence::body();
  super.body();
  ahbMaster8bitIncr4ReadSequence = AhbMaster8bitIncr4ReadSequence::type_id::create("ahbMaster8bitIncr4ReadSequence");
  ahbSlave8bitIncr4ReadSequence  = AhbSlave8bitIncr4ReadSequence::type_id::create("ahbSlave8bitIncr4ReadSequence");
 fork
    forever begin
      ahbSlave8bitIncr4ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster8bitIncr4ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave8bitIncr4ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
