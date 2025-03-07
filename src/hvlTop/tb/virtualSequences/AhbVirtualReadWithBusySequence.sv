`ifndef AHBVIRTUALREADWITHBUSYSEQUENCE_INCLUDED_
`define AHBVIRTUALREADWITHBUSYSEQUENCE_INCLUDED_
 
class AhbVirtualReadWithBusySequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtualReadWithBusySequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtualReadWithBusySequence");
  extern task body();
 
endclass : AhbVirtualReadWithBusySequence
 
function AhbVirtualReadWithBusySequence::new(string name ="AhbVirtualReadWithBusySequence");
  super.new(name);
endfunction : new
 
task AhbVirtualReadWithBusySequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
 repeat(40) begin 
  if(!ahbMasterSequence.randomize() with {
                                                              hsizeSeq dist {BYTE:=1, HALFWORD:=1, WORD:=1};
							      hwriteSeq == 0;
                                                              htransSeq == NONSEQ;
                                                              hburstSeq dist { 2:=1, 3:=1, 4:=1, 5:=2, 6:=2, 7:=2}; 
                                                              foreach(busyControlSeq[i]) busyControlSeq[i] dist {0 := 75,1 := 25};}
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualReadWithBusySequence")
  end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
