`ifndef AHBVIRTUALSINGLEWRITESEQUENCE_INCLUDED_
`define AHBVIRTUALSINGLEWRITESEQUENCE_INCLUDED_
 
class AhbVirtualSingleWriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtualSingleWriteSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtualSingleWriteSequence");
  extern task body();
 
endclass : AhbVirtualSingleWriteSequence
 
function AhbVirtualSingleWriteSequence::new(string name ="AhbVirtualSingleWriteSequence");
  super.new(name);
endfunction : new
 
task AhbVirtualSingleWriteSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
 repeat(40) begin 
  if(!ahbMasterSequence.randomize() with {
                                                              hsizeSeq dist {BYTE:=1, HALFWORD:=1, WORD:=1};
							      hwriteSeq ==1;
                                                              htransSeq == NONSEQ;
                                                              hburstSeq == SINGLE;} 
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualSingleWriteSequence")
  end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
