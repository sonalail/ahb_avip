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
  
  if(!ahbMasterSequence.randomize() with {
                                                              //hwdataSeq dist {32'hffff_ffff:/4, 32'haaaa_aaaa:/4, [0:$]:/2};
                                                              hwriteSeq ==1;
                                                              //haddrSeq dist {32'hffff_ffff:/2, 32'haaaa_aaaa:/2, [0:$]:/6};
                                                              htransSeq == NONSEQ;
                                                              hsizeSeq == WORD;
                                                              hburstSeq dist {0:/1,1:/1,2:/1,3:/1,4:/1,5:/1,6:/1,7:/1};
} 
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside AhbVirtual32bitSingleWriteSequence")
  end

   repeat(10) begin
    fork
       ahbSlaveSequence.start(p_sequencer.ahbSlaveSequencer);
      ahbMasterSequence.start(p_sequencer.ahbMasterSequencer); 
    join	
  end
endtask : body
 
`endif  
