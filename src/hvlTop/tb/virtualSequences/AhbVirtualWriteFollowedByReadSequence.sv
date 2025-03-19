`ifndef AHBVIRTUALWRITEFOLLOWEDBYREADSEQUENCE_INCLUDED_
`define AHBVIRTUALWRITEFOLLOWEDBYREADSEQUENCE_INCLUDED_
 
class AhbVirtualWriteFollowedByReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtualWriteFollowedByReadSequence)
 
  AhbMasterSequence ahbMasterWriteSequence;
  AhbMasterSequence ahbMasterReadSequence;
 
  AhbSlaveSequence ahbSlaveWriteSequence;
  AhbSlaveSequence ahbSlaveReadSequence;
 
  extern function new(string name ="AhbVirtualWriteFollowedByReadSequence");
  extern task body();
 
endclass : AhbVirtualWriteFollowedByReadSequence
 
function AhbVirtualWriteFollowedByReadSequence::new(string name ="AhbVirtualWriteFollowedByReadSequence");
  super.new(name);
endfunction : new
 
task AhbVirtualWriteFollowedByReadSequence::body();
  super.body();
  ahbMasterWriteSequence = AhbMasterSequence::type_id::create("ahbMasterWriteSequence");
  ahbSlaveWriteSequence  = AhbSlaveSequence::type_id::create("ahbSlaveWriteSequence");
  ahbMasterReadSequence = AhbMasterSequence::type_id::create("ahbMasterReadSequence");
  ahbSlaveReadSequence  = AhbSlaveSequence::type_id::create("ahbSlaveReadSequence");

  if(!ahbMasterWriteSequence.randomize() with {hsizeSeq == WORD;
	    					                               hwriteSeq == 1;
                                               htransSeq == NONSEQ;
                                               hburstSeq == 0;
 							                                 foreach(busyControlSeq[i]) 
                                                 busyControlSeq[i] == 0;}
                                             ) begin
    `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualWriteFollowedByReadSequence")
  end

  if(!ahbMasterReadSequence.randomize() with {hsizeSeq == WORD;
	    					                              hwriteSeq == 0;
                                              htransSeq == NONSEQ;
                                              hburstSeq == 0;
 							                                foreach(busyControlSeq[i]) 
                                                busyControlSeq[i] == 0;}
                                            ) begin
    `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualReadFollowedByReadSequence")
  end

  fork
    begin
      forever begin
        ahbSlaveWriteSequence.start(p_sequencer.ahbSlaveSequencer);
        ahbSlaveReadSequence.start(p_sequencer.ahbSlaveSequencer);
      end
    end
  join_none

  fork
    begin
      ahbMasterWriteSequence.start(p_sequencer.ahbMasterSequencer); 
      ahbMasterReadSequence.start(p_sequencer.ahbMasterSequencer); 
    end
  join	

endtask : body
 
`endif  
