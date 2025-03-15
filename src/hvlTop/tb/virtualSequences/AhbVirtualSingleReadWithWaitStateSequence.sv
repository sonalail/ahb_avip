`ifndef AHBVIRTUALSINGLEREADWITHWAITSTATESEQUENCE_INCLUDED_
`define AHBVIRTUALSINGLEREADWITHWAITSTATESEQUENCE_INCLUDED_
 
class AhbVirtualSingleReadWithWaitStateSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtualSingleReadWithWaitStateSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtualSingleReadWithWaitStateSequence");
  extern task body();
 
endclass : AhbVirtualSingleReadWithWaitStateSequence
 
function AhbVirtualSingleReadWithWaitStateSequence::new(string name ="AhbVirtualSingleReadWithWaitStateSequence");
  super.new(name);
endfunction : new
 
task AhbVirtualSingleReadWithWaitStateSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
 repeat(40) begin 
  if(!ahbMasterSequence.randomize() with {
                                                              hsizeSeq dist {BYTE:=1, HALFWORD:=1, WORD:=1};
							      hwriteSeq ==0;
                                                              htransSeq == NONSEQ;
                                                              hburstSeq == SINGLE;
						              foreach(busyControlSeq[i]) busyControlSeq[i] dist {0:=100, 1:=0};
}
 
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualSingleReadWithWaitStateSequence")
  end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
