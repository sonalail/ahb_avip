`ifndef AHBVIRTUAL32BITSINGLEWRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITSINGLEWRITESEQUENCE_INCLUDED_
 
class AhbVirtual32bitSingleWriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitSingleWriteSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtual32bitSingleWriteSequence");
  extern task body();
 
endclass : AhbVirtual32bitSingleWriteSequence
 
function AhbVirtual32bitSingleWriteSequence::new(string name ="AhbVirtual32bitSingleWriteSequence");
  super.new(name);
endfunction : new
 
task AhbVirtual32bitSingleWriteSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
 repeat(20) begin 
  if(!ahbMasterSequence.randomize() with {
                                                              hwriteSeq ==1;
                                                              htransSeq == NONSEQ;
                                                              foreach(busyControlSeq[i]) busyControlSeq[i] dist {0 := 50,1 := 50};
							      hsizeSeq == WORD;
                                                              hburstSeq inside {[2:7]};} 
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtual32bitSingleWriteSequence")
  end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
