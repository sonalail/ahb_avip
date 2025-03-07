`ifndef AHBVIRTUALREADSEQUENCE_INCLUDED_
`define AHBVIRTUALREADSEQUENCE_INCLUDED_
 
class AhbVirtualReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtualReadSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtualReadSequence");
  extern task body();
 
endclass : AhbVirtualReadSequence
 
function AhbVirtualReadSequence::new(string name ="AhbVirtualReadSequence");
  super.new(name);
endfunction : new
 
task AhbVirtualReadSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
 repeat(20) begin 
  if(!ahbMasterSequence.randomize() with {
                                                              hsizeSeq dist {BYTE:=1, HALFWORD:=1, WORD:=1};
							      hwriteSeq ==0;
                                                              htransSeq == NONSEQ;
                                                              hburstSeq dist { 2:=1, 3:=1, 4:=1, 5:=2, 6:=2, 7:=2};} 
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtualReadSequence")
  end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
