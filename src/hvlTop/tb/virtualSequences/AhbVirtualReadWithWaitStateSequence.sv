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
  repeat(40) begin 
    if(!ahbMasterSequence.randomize() with {
					                        hsizeSeq dist {BYTE:=1, HALFWORD:=1, WORD:=1};
							//      hsizeSeq == WORD;
								hwriteSeq ==0;
                                                                htransSeq == NONSEQ;
 							//	hburstSeq == INCR4;
                                                              hburstSeq dist { WRAP4:=1, INCR4:=1, WRAP8:=1, INCR8:=2, WRAP16:=2, INCR16:=2};
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
