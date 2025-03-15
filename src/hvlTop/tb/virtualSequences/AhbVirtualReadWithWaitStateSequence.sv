`ifndef AHBVIRTUALREADWITHWAITSTATESEQUENCE_INCLUDED_
`define AHBVIRTUALREADWITHWAITSTATESEQUENCE_INCLUDED_
 
class AhbVirtualReadWithWaitStateSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtualReadWithWaitStateSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtualReadWithWaitStateSequence");
  extern task body();
 
endclass : AhbVirtualReadWithWaitStateSequence
 
function AhbVirtualReadWithWaitStateSequence::new(string name ="AhbVirtualReadWithWaitStateSequence");
  super.new(name);
endfunction : new
 
task AhbVirtualReadWithWaitStateSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
 repeat(3) begin 
  if(!ahbMasterSequence.randomize() with {
							        hsizeSeq == WORD;
								hwriteSeq ==0;
                                                                htransSeq == NONSEQ;
 								hburstSeq == INCR4;
 							      foreach(busyControlSeq[i]) busyControlSeq[i] dist {0:=100, 1:=0};}
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualReadWithWaitStateSequence")
  end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
