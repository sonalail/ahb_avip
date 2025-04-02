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
  repeat(3) begin 
    if(!ahbMasterSequence.randomize() with {
                                               hsizeSeq == WORD;
				    	       hwriteSeq ==1;
                                               htransSeq == NONSEQ;
                                               noOfBusyStatesSeq == 2;
                                               hburstSeq == SINGLE;/*dist { 2:=1, 3:=1, 4:=1, 5:=2, 6:=2, 7:=2};*/ 
                                               foreach(busyControlSeq[i]) busyControlSeq[i] dist {0:=50, 1:=50};
                                             }    ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualWriteWithBusyToBusySequence")
    end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
