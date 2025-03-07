`ifndef AHBVIRTUAL32BITSINGLEWRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITSINGLEWRITESEQUENCE_INCLUDED_
 
class AhbVirtual32bitSingleWriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitSingleWriteSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtual32bitSingleWriteSequence");
  extern task body();
 
endclass : AhbVirtual32bitSingleWriteSequence
 
function AhbVirtual32bitSingleWriteSequence::new(string name ="AhbVirtual32bitSingleWriteSequence");
  super.new(name);
endfunction : new
 
task AhbVirtual32bitSingleWriteSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
 repeat(20) begin 
  if(!ahbMasterSequence.randomize() with {
                                                              hsizeSeq dist {BYTE:=1, HALFWORD:=1, WORD:=1};
							      hwriteSeq ==1;
                                                              htransSeq == NONSEQ;
                                                              hburstSeq dist { 2:=1, 3:=1, 4:=1, 5:=2, 6:=2, 7:=2};} 
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtual32bitSingleWriteSequence")
  end
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
