`ifndef AHBVIRTUALWRITEWITHWAITSTATESEQUENCE_INCLUDED_
`define AHBVIRTUALWRITEWITHWAITSTATESEQUENCE_INCLUDED_
 
class AhbVirtualWriteWithWaitStateSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtualWriteWithWaitStateSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtualWriteWithWaitStateSequence");
  extern task body();
 
endclass : AhbVirtualWriteWithWaitStateSequence
 
function AhbVirtualWriteWithWaitStateSequence::new(string name ="AhbVirtualWriteWithWaitStateSequence");
  super.new(name);
endfunction : new
 
task AhbVirtualWriteWithWaitStateSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
  repeat(40) begin 
    if(!ahbMasterSequence.randomize() with {
                                                                hsizeSeq dist {BYTE:=1, HALFWORD:=1, WORD:=1};
							//      hsizeSeq == WORD;
								hwriteSeq ==1;
                                                                htransSeq == NONSEQ;
 							//	hburstSeq == INCR4;
                                                                hburstSeq dist { 2:=1, 3:=1, 4:=1, 5:=2, 6:=2, 7:=2};
 							      foreach(busyControlSeq[i]) busyControlSeq[i] dist {0:=100, 1:=0};}
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualWriteWithWaitStateSequence")
    end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
