`ifndef AHBVIRTUAL32BITWRAP8WRITESEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITWRAP8WRITESEQUENCE_INCLUDED_
 
class AhbVirtual32bitWrap8WriteSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap8WriteSequence)
 
  AhbMasterSequence ahbMasterSequence;
 
  AhbSlaveSequence ahbSlaveSequence;
 
  extern function new(string name ="AhbVirtual32bitWrap8WriteSequence");
  extern task body();
 
endclass : AhbVirtual32bitWrap8WriteSequence
 
function AhbVirtual32bitWrap8WriteSequence::new(string name ="AhbVirtual32bitWrap8WriteSequence");
  super.new(name);
endfunction : new
 
task AhbVirtual32bitWrap8WriteSequence::body();
  super.body();
  ahbMasterSequence = AhbMasterSequence::type_id::create("ahbMasterSequence");
  ahbSlaveSequence  = AhbSlaveSequence::type_id::create("ahbSlaveSequence");
   if(!ahbMasterSequence.randomize() with {
                                                              //hwdataSeq dist {32'hffff_ffff:/8, 32'haaaa_aaaa:/8, [0:$]:/2};
                                                              hwriteSeq ==1;
                                                              //haddrSeq dist {32'hffff_ffff:/2, 32'haaaa_aaaa:/2, [0:$]:/6};
                                                              htransSeq == NONSEQ;
                                                              hsizeSeq == WORD;
                                                              hburstSeq == WRAP8;
} 
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtual32bitWrap8WriteSequence")
  end
   repeat(1) begin
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
