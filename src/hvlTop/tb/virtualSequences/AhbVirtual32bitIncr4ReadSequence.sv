`ifndef AHBVIRTUAL32BITINCR4READSEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITINCR4READSEQUENCE_INCLUDED_

class AhbVirtual32bitIncr4ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr4ReadSequence)

  AhbMaster32bitIncr4ReadSequence ahbMaster32bitIncr4ReadSequence;

  AhbSlave32bitIncr4ReadSequence ahbSlave32bitIncr4ReadSequence;

  extern function new(string name ="AhbVirtual32bitIncr4ReadSequence");
  extern task body();

endclass : AhbVirtual32bitIncr4ReadSequence

function AhbVirtual32bitIncr4ReadSequence::new(string name ="AhbVirtual32bitIncr4ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitIncr4ReadSequence::body();
  super.body();
  ahbMaster32bitIncr4ReadSequence = AhbMaster32bitIncr4ReadSequence::type_id::create("ahbMaster32bitIncr4ReadSequence");
  ahbSlave32bitIncr4ReadSequence  = AhbSlave32bitIncr4ReadSequence::type_id::create("ahbSlave32bitIncr4ReadSequence");
 fork
    forever begin
      ahbSlave32bitIncr4ReadSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster32bitIncr4ReadSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

 endtask : body

`endif
