`ifndef AHBVIRTUALWRITEWITHBUSYTOBUSYSEQUENCE_INCLUDED_
`define AHBVIRTUALWRITEWITHBUSYTOBUSYSEQUENCE_INCLUDED_
 
class AhbVirtualWriteWithBusyToBusySequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtualWriteWithBusyToBusySequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtualWriteWithBusyToBusySequence");
  extern task body();
 
endclass : AhbVirtualWriteWithBusyToBusySequence
 
function AhbVirtualWriteWithBusyToBusySequence::new(string name ="AhbVirtualWriteWithBusyToBusySequence");
  super.new(name);
endfunction : new
 
task AhbVirtualWriteWithBusyToBusySequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
  repeat(1) begin 
    if(!ahbMasterSequence.randomize() with {
                                                              hsizeSeq == WORD;
							      hwriteSeq ==1;
                                                              htransSeq == NONSEQ;
                                                              hburstSeq == INCR8;/*dist { 2:=1, 3:=1, 4:=1, 5:=2, 6:=2, 7:=2};*/ 
                                                              foreach(busyControlSeq[i]) busyControlSeq[i] dist {0:=50, 1:=50};
 //        foreach(busyControlSeq[i]) if(i==2 || i==3)  busyControlSeq[i] == 1;else busyControlSeq[i] == 0;}
 foreach(busyControlSeq[i]) if(i < busyControlSeq.size()) if(busyControlSeq[i]) busyControlSeq[i + 1] != 1;}
      
                                                 ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualWriteWithBusyToBusySequence")
    end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
