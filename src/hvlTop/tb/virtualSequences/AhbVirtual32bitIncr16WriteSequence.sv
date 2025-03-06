`ifndef AHBVIRTUAL32BITINCR16WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITINCR16WRITESEQUENCE_INCLUDED_
 
class AhbVirtual32bitIncr16WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr16WriteSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtual32bitIncr16WriteSequence");
  extern task body();
 
endclass : AhbVirtual32bitIncr16WriteSequence
 
function AhbVirtual32bitIncr16WriteSequence::new(string name ="AhbVirtual32bitIncr16WriteSequence");
  super.new(name);
endfunction : new
 
task AhbVirtual32bitIncr16WriteSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
   if(!ahbMasterSequence.randomize() with {
                                                              //hwdataSeq dist {32'hffff_ffff:/16, 32'haaaa_aaaa:/16, [0:$]:/2};
                                                              hwriteSeq ==1;
                                                              //haddrSeq dist {32'hffff_ffff:/2, 32'haaaa_aaaa:/2, [0:$]:/6};
                                                              htransSeq == NONSEQ;
                                                              hsizeSeq == WORD;
                                                              hburstSeq == INCR16;
} 
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtual32bitIncr16WriteSequence")
  end
   repeat(1) begin
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
