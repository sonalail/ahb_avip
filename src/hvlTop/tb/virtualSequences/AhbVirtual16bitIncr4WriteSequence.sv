`ifndef AHBVIRTUAL16BITINCR4WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITINCR4WRITESEQUENCE_INCLUDED_

class AhbVirtual16bitIncr4WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitIncr4WriteSequence)

  AhbMaster16bitIncr4WriteSequence ahbMaster16bitIncr4WriteSequence;

  AhbSlave16bitIncr4WriteSequence ahbSlave16bitIncr4WriteSequence;

  extern function new(string name ="AhbVirtual16bitIncr4WriteSequence");
  extern task body();

endclass : AhbVirtual16bitIncr4WriteSequence

function AhbVirtual16bitIncr4WriteSequence::new(string name ="AhbVirtual16bitIncr4WriteSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitIncr4WriteSequence::body();
  super.body();
  ahbMaster16bitIncr4WriteSequence = AhbMaster16bitIncr4WriteSequence::type_id::create("ahbMaster16bitIncr4WriteSequence");
  ahbSlave16bitIncr4WriteSequence  = AhbSlave16bitIncr4WriteSequence::type_id::create("ahbSlave16bitIncr4WriteSequence");
 fork
    forever begin
      ahbSlave16bitIncr4WriteSequence.start(p_sequencer.ahbSlaveSequencer);
    end
  join_none

  repeat(1) begin
    ahbMaster16bitIncr4WriteSequence.start(p_sequencer.ahbMasterSequencer);
	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
  end

   /* repeat(1)begin
  	ahbSlave16bitIncr4WriteSequence.start(p_sequencer.ahbSlaveSequencer);
  	`uvm_info("virtual sequence","out of virtual sequence",UVM_LOW)
	end*/
	
 endtask : body

`endif
