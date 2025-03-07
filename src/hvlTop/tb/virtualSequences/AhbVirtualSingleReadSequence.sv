`ifndef AHBVIRTUALSINGLEREADSEQUENCE_INCLUDED_
`define AHBVIRTUALSINGLEREADSEQUENCE_INCLUDED_
 
class AhbVirtualSingleReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtualSingleReadSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtualSingleReadSequence");
  extern task body();
 
endclass : AhbVirtualSingleReadSequence
 
function AhbVirtualSingleReadSequence::new(string name ="AhbVirtualSingleReadSequence");
  super.new(name);
endfunction : new
 
task AhbVirtualSingleReadSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
 repeat(40) begin 
  if(!ahbMasterSequence.randomize() with {
                                                              hsizeSeq dist {BYTE:=1, HALFWORD:=1, WORD:=1};
							      hwriteSeq ==0;
                                                              htransSeq == NONSEQ;
                                                              hburstSeq == SINGLE;} 
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualSingleReadSequence")
  end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
