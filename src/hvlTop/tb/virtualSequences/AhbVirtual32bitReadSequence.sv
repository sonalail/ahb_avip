`ifndef AHBVIRTUAL32BITREADSEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITREADSEQUENCE_INCLUDED_

class AhbVirtual32bitReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitReadSequence)

  AhbMasterSequence ahbMaster32bitReadSequence;

  AhbSlaveSequence ahbSlave32bitReadSequence;

  extern function new(string name ="AhbVirtual32bitReadSequence");
  extern task body();

endclass : AhbVirtual32bitReadSequence

function AhbVirtual32bitReadSequence::new(string name ="AhbVirtual32bitReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitReadSequence::body();
  super.body();
  ahbMaster32bitReadSequence = AhbMasterSequence::type_id::create("ahbMaster32bitReadSequence");
  ahbSlave32bitReadSequence  = AhbSlaveSequence::type_id::create("ahbSlave32bitReadSequence");

  if(!ahbMaster32bitReadSequence.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end

   if(!ahbSlave32bitReadSequence.randomize() with {hrdataSeq dist {32'hffff_ffff:/3, 32'haaaa_aaaa:/3, 32'h0000_0000:/1, [0:$]:/3};
                            }) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end

  fork
    ahbSlave32bitSingleReadSequence.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster32bitSingleReadSequence.start(p_sequencer.ahbMasterSequencer);
  join

 endtask : body

`endif
