`ifndef AHBSLAVESEQUENCE_INCLUDED_
`define AHBSLAVESEQUENCE_INCLUDED_  

class AhbSlaveSequence extends AhbSlaveBaseSequence;
  `uvm_object_utils(AhbSlaveSequence)
   rand bit [DATA_WIDTH-1:0] hrdataSeq[$:2**LENGTH];
   rand bit hreadyoutSeq;
   //ahbRespEnum hrespSeq;
   rand bit hexokaySeq;
   rand bit choosePacketDataSeq;
   rand int noOfWaitStatesSeq;
  
   constraint readDataSeqSize{hrdataSeq.size() == 16;}

   constraint waitSeqState{soft noOfWaitStatesSeq == 0;}

   constraint chooseDataPacketSeq {soft choosePacketDataSeq==0;}

   extern function new(string name="AhbSlaveSequence");
   extern task body();
endclass : AhbSlaveSequence
 
function AhbSlaveSequence::new(string name="AhbSlaveSequence");
  super.new(name);
endfunction : new
 
task AhbSlaveSequence::body();
  req = AhbSlaveTransaction::type_id::create("req");
  start_item(req);
  if(!req.randomize() with { foreach(hrdataSeq[i])
			     hrdata[i]        == hrdataSeq[i];		
			     hreadyout        == hreadyoutSeq;
			     //hresp            == hrespSeq;
			     hexokay          == hexokaySeq;
			     choosePacketData == choosePacketDataSeq;
			     noOfWaitStates   == noOfWaitStatesSeq;
                           }) begin
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body
`endif
