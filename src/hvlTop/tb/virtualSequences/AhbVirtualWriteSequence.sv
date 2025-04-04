`ifndef AHBVIRTUALWRITESEQUENCE_INCLUDED_
`define AHBVIRTUALWRITESEQUENCE_INCLUDED_
 
class AhbVirtualWriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtualWriteSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtualWriteSequence");
  extern task body();
 
endclass : AhbVirtualWriteSequence
 
function AhbVirtualWriteSequence::new(string name ="AhbVirtualWriteSequence");
  super.new(name);
endfunction : new
 
task AhbVirtualWriteSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
  repeat(40) begin 
    if(!ahbMasterSequence.randomize() with {
                                                              hsizeSeq dist {BYTE:=1, HALFWORD:=1, WORD:=1};
							      hwriteSeq ==1;
                                                              htransSeq == NONSEQ;
                                                              hburstSeq dist { WRAP4:=1, INCR4:=1, WRAP8:=1, INCR8:=2, WRAP16:=2, INCR16:=2};
 							      foreach(busyControlSeq[i]) busyControlSeq[i] dist {0:=100, 1:=0};}
                                                        ) begin
      `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualWriteSequence")
    end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
