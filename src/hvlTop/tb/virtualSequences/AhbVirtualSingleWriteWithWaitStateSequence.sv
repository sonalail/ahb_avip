`ifndef AHBVIRTUALSINGLEWRITEWITHWAITSTATESEQUENCE_INCLUDED_
`define AHBVIRTUALSINGLEWRITEWITHWAITSTATESEQUENCE_INCLUDED_
 
class AhbVirtualSingleWriteWithWaitStateSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtualSingleWriteWithWaitStateSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtualSingleWriteWithWaitStateSequence");
  extern task body();
 
endclass : AhbVirtualSingleWriteWithWaitStateSequence
 
function AhbVirtualSingleWriteWithWaitStateSequence::new(string name ="AhbVirtualSingleWriteWithWaitStateSequence");
  super.new(name);
endfunction : new
 
task AhbVirtualSingleWriteWithWaitStateSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
 repeat(40) begin 
  if(!ahbMasterSequence.randomize() with {
                                                              hsizeSeq dist {BYTE:=1, HALFWORD:=1, WORD:=1};
							      hwriteSeq ==1;
                                                              htransSeq == NONSEQ;
                                                              hburstSeq == SINGLE;
						              foreach(busyControlSeq[i]) busyControlSeq[i] dist {0:=100, 1:=0};
}
 
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualSingleWriteWithWaitStateSequence")
  end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
