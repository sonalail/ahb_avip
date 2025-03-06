`ifndef AHBVIRTUAL32BITINCR4WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITINCR4WRITESEQUENCE_INCLUDED_
 
class AhbVirtual32bitIncr4WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr4WriteSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtual32bitIncr4WriteSequence");
  extern task body();
 
endclass : AhbVirtual32bitIncr4WriteSequence
 
function AhbVirtual32bitIncr4WriteSequence::new(string name ="AhbVirtual32bitIncr4WriteSequence");
  super.new(name);
endfunction : new
 
task AhbVirtual32bitIncr4WriteSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
   if(!ahbMasterSequence.randomize() with {
                                                              //hwdataSeq dist {32'hffff_ffff:/4, 32'haaaa_aaaa:/4, [0:$]:/2};
                                                              hwriteSeq ==1;
                                                              //haddrSeq dist {32'hffff_ffff:/2, 32'haaaa_aaaa:/2, [0:$]:/6};
                                                              htransSeq == NONSEQ;
                                                              hsizeSeq == WORD;
                                                              hburstSeq == INCR4;
} 
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtual32bitIncr4WriteSequence")
  end
   repeat(1) begin
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
