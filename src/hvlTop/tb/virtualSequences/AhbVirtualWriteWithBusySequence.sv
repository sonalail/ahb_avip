`ifndef AHBVIRTUALWRITEWITHBUSYSEQUENCE_INCLUDED_
`define AHBVIRTUALWRITEWITHBUSYSEQUENCE_INCLUDED_
 
class AhbVirtualWriteWithBusySequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtualWriteWithBusySequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtualWriteWithBusySequence");
  extern task body();
 
endclass : AhbVirtualWriteWithBusySequence
 
function AhbVirtualWriteWithBusySequence::new(string name ="AhbVirtualWriteWithBusySequence");
  super.new(name);
endfunction : new
 
task AhbVirtualWriteWithBusySequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
  repeat(40) begin 
    if(!ahbMasterSequence.randomize() with {
                                                              hsizeSeq == WORD;
							      hwriteSeq ==1;
                                                              htransSeq == NONSEQ;
                                                              hburstSeq dist { WRAP4:=1, INCR4:=1, WRAP8:=1, INCR8:=2, WRAP16:=2, INCR16:=2};
                                                              foreach(busyControlSeq[i]) busyControlSeq[i] dist {0:=50, 1:=50};}
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualWriteWithBusySequence")
    end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
