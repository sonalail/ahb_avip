`ifndef AHBMASTERTRANSACTION_INCLUDED_
`define AHBMASTERTRANSACTION_INCLUDED_

 class AhbMasterTransaction extends uvm_sequence_item;
  `uvm_object_utils(AhbMasterTransaction)

  rand bit [ADDR_WIDTH-1:0] haddr;
  rand bit [NO_OF_SLAVES-1:0] hselx;
  rand ahbBurstEnum hburst;
  rand bit hmastlock;
  rand ahbProtectionEnum hprot;
  rand ahbHsizeEnum hsize;
  rand bit hnonsec;
  rand bit hexcl;
  rand bit [HMASTER_WIDTH-1:0] hmaster;
  rand ahbTransferEnum htrans;
  rand bit [DATA_WIDTH-1:0] hwdata[$:2**LENGTH];
  rand bit [(DATA_WIDTH/8)-1:0] hwstrb[$:2**LENGTH];
  rand ahbWriteEnum hwrite;
  bit [DATA_WIDTH-1:0] hrdata[$:2**LENGTH];
  bit hreadyout;
  ahbRespEnum hresp;
  rand bit hexokay;
  bit hready;
  int noOfWaitStatesDetected;

  extern function new  (string name = "AhbMasterTransaction");
  extern function void do_copy(uvm_object rhs);
  extern function bit  do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
  
constraint addr_size {
    soft haddr > 0;
  //  if (hburst == SINGLE) soft haddr == 1;
    if (hburst == INCR) soft haddr < (1024 / (2 ** hsize));
    if (hburst == INCR4 || hburst == WRAP4) soft haddr == 4;
    if (hburst == INCR8 || hburst == WRAP8) soft haddr== 8;
    if (hburst == INCR16 || hburst == WRAP16) soft haddr== 16;
}
/*constraint addr_size {
    soft haddr > 0;
  //  if (hburst == SINGLE) soft haddr == 1;
    if (hburst == INCR) soft haddr < (1024 / (2 ** hsize));
    if (hburst == INCR4 || hburst == WRAP4) soft haddr == 4;
    if (hburst == INCR8 || hburst == WRAP8) soft haddr== 8;
    if (hburst == INCR16 || hburst == WRAP16) soft haddr== 16;
}*/
constraint haddr_alignment_c {
  // Ensure address alignment based on transfer size
   if (hsize == HALFWORD) {
    haddr[0] == 1'b0; // Aligned to 2-byte boundary
  } else if (hsize == WORD) {
    haddr[1:0] == 2'b00; // Aligned to 4-byte boundary
  } else if (hsize == DOUBLEWORD) {
    haddr[2:0] == 3'b000; // Aligned to 8-byte boundary
  } else if (hsize == LINE4) {
    haddr[3:0] == 4'b0000; // Aligned to 16-byte boundary
  } else if (hsize == LINE8) {
    haddr[4:0] == 5'b00000; // Aligned to 32-byte boundary
  } else if (hsize == LINE16) {
    haddr[5:0] == 6'b000000; // Aligned to 64-byte boundary
  } else if (hsize == LINE32) {
    haddr[6:0] == 7'b0000000; // Aligned to 128-byte boundary
  }
}


constraint first_trans_type {
    if (hburst == SINGLE) {
        soft htrans inside {IDLE, NONSEQ};
    } else {
        soft htrans == NONSEQ;
    }
}

constraint incr_trans_type {
    if (hburst != SINGLE) {
        if (htrans == IDLE)
            soft htrans == NONSEQ;
        else
            soft htrans == SEQ;
    }
}
/*
constraint hwstrb_logic {
    if (hsize == BYTE)
     soft   hwstrb == 8'h01 << haddr[1:0]; 
    else if (hsize == HALFWORD)
      soft  hwstrb == 8'h03 << (haddr[1] << 1); 
    else if (hsize == WORD)
      soft  hwstrb == 8'h0F; 
    else if (hsize == DOUBLEWORD)
     soft   hwstrb == 8'hFF; 
    else if (hsize >= LINE4)
    soft    hwstrb == {DATA_WIDTH/8{1'b1}}; 
}
*/

constraint hselx_logic {
    if (htrans == IDLE)
     soft hselx == '0;
    else 
        $onehot(hselx);
}

/*
constraint addr_4beat_wrap {
    if (hburst == WRAP4) {
        if (hsize == BYTE)
            soft haddr[1:0] == haddr[1:0] + 1;
            soft haddr[ADDR_WIDTH-1:2] == haddr[ADDR_WIDTH-1:2];
        if (hsize == HALFWORD)
            soft haddr[2:1] == haddr[2:1] + 1;
            soft haddr[ADDR_WIDTH-1:3] == haddr[ADDR_WIDTH-1:3];
        if (hsize == WORD)
            soft haddr[3:2] == haddr[3:2] + 1;
            soft haddr[ADDR_WIDTH-1:4] == haddr[ADDR_WIDTH-1:4];
 }
}


constraint addr_8beat_wrap {
    if (hburst == WRAP8) {
        if (hsize == BYTE)
            soft haddr[2:0] == haddr[2:0] + 1;
            soft haddr[ADDR_WIDTH-1:3] == haddr[ADDR_WIDTH-1:3];
        if (hsize == HALFWORD)
            soft haddr[3:1] == haddr[3:1] + 1;
            soft haddr[ADDR_WIDTH-1:4] == haddr[ADDR_WIDTH-1:4];
        if (hsize == WORD)
            soft haddr[4:2] == haddr[4:2] + 1;
            soft haddr[ADDR_WIDTH-1:5] == haddr[ADDR_WIDTH-1:5];
}    
}
*/
constraint strobleValue{foreach(hwstrb[i]) { if(hsize == BYTE) $countones(hwstrb[i]) == 1;
											 else if(hsize == HALFWORD) $countones(hwstrb[i]) == 2;
											 else if(hsize == WORD) $countones(hwstrb[i]) == 4;
											 else if(hsize == DOUBLEWORD) $countones(hwstrb[i]) == 8;
											}
					  }

constraint burstsize{if(hburst == WRAP4 || hburst == INCR4) hwdata.size() == 4;
                     else if(hburst == WRAP8 || hburst == INCR8) hwdata.size() == 8;
					 else if(hburst == WRAP16 || hburst == INCR16) hwdata.size() == 16;
					 else hwdata.size() == 1;
					}

constraint strobesize{if(hburst == WRAP4 || hburst == INCR4) hwstrb.size() == 4;
                     else if(hburst == WRAP8 || hburst == INCR8) hwstrb.size() == 8;
					 else if(hburst == WRAP16 || hburst == INCR16) hwstrb.size() == 16;
					 else hwstrb.size() == 1;
					}

endclass : AhbMasterTransaction

function AhbMasterTransaction::new(string name = "AhbMasterTransaction");
  super.new(name);
endfunction : new

function void AhbMasterTransaction::do_copy (uvm_object rhs);
 AhbMasterTransaction ahbMasterTransaction;

  if(!$cast(ahbMasterTransaction,rhs)) begin
    `uvm_fatal("do_copy","cast of the rhs object failed")
  end
  super.do_copy(rhs);

haddr      = ahbMasterTransaction.haddr;
hselx      = ahbMasterTransaction.hselx;
hburst     = ahbMasterTransaction.hburst;
hmastlock  = ahbMasterTransaction.hmastlock;
hprot      = ahbMasterTransaction.hprot;
hsize      = ahbMasterTransaction.hsize;
hnonsec    = ahbMasterTransaction.hnonsec;
hexcl      = ahbMasterTransaction.hexcl;
hmaster    = ahbMasterTransaction.hmaster;
htrans     = ahbMasterTransaction.htrans;
hwdata     = ahbMasterTransaction.hwdata;
hwstrb     = ahbMasterTransaction.hwstrb;
hwrite     = ahbMasterTransaction.hwrite;
hrdata     = ahbMasterTransaction.hrdata;
hreadyout  = ahbMasterTransaction.hreadyout;
hresp      = ahbMasterTransaction.hresp;
hexokay    = ahbMasterTransaction.hexokay;
hready     = ahbMasterTransaction.hready;
noOfWaitStatesDetected = ahbMasterTransaction.noOfWaitStatesDetected;

endfunction : do_copy

function bit AhbMasterTransaction::do_compare (uvm_object rhs, uvm_comparer comparer);
  AhbMasterTransaction ahbMasterTransaction;

 if(!$cast(ahbMasterTransaction,rhs)) begin
  `uvm_fatal("FATAL_AHB_MASTER_TX_DO_COMPARE_FAILED","cast of the rhs object failed")
    return 0;
  end

 return super.do_compare(ahbMasterTransaction, comparer) &&
haddr    == ahbMasterTransaction.haddr    &&
hselx    == ahbMasterTransaction.hselx    &&
hburst   == ahbMasterTransaction.hburst   &&
hmastlock == ahbMasterTransaction.hmastlock &&
hprot    == ahbMasterTransaction.hprot    &&
hsize    == ahbMasterTransaction.hsize    &&
hnonsec  == ahbMasterTransaction.hnonsec  &&
hexcl    == ahbMasterTransaction.hexcl    &&
hmaster  == ahbMasterTransaction.hmaster  &&
htrans   == ahbMasterTransaction.htrans   &&
hwdata   == ahbMasterTransaction.hwdata   &&
hwstrb   == ahbMasterTransaction.hwstrb   &&
hwrite   == ahbMasterTransaction.hwrite   &&
hrdata   == ahbMasterTransaction.hrdata   &&
hreadyout == ahbMasterTransaction.hreadyout &&
hresp    == ahbMasterTransaction.hresp    &&
hexokay  == ahbMasterTransaction.hexokay  &&
hready   == ahbMasterTransaction.hready &&
noOfWaitStatesDetected == ahbMasterTransaction.noOfWaitStatesDetected;

endfunction : do_compare
function void AhbMasterTransaction::do_print(uvm_printer printer);

printer.print_field  ("haddr", haddr, $bits(haddr), UVM_HEX);
printer.print_field  ("hselx", hselx, $bits(hselx), UVM_BIN);
printer.print_string ("hburst", hburst.name());
printer.print_field  ("hmastlock", hmastlock, $bits(hmastlock), UVM_HEX);
printer.print_string ("hprot", hprot.name());
printer.print_string ("hsize", hsize.name());
printer.print_field  ("hnonsec", hnonsec, $bits(hnonsec), UVM_HEX);
printer.print_field  ("hexcl", hexcl, $bits(hexcl), UVM_HEX);
printer.print_field  ("hmaster", hmaster, $bits(hmaster), UVM_DEC);
printer.print_string ("htrans", htrans.name());
printer.print_string ("hwrite", hwrite.name());
printer.print_field  ("hreadyout", hreadyout, $bits(hreadyout), UVM_HEX);
printer.print_string ("hresp", hresp.name());
printer.print_field  ("hexokay", hexokay,$bits(hexokay),UVM_HEX);
printer.print_field  ("hready", hready, $bits(hready), UVM_HEX);
printer.print_field  ("noOfwaitStatesDetected", noOfWaitStatesDetected, $bits(noOfWaitStatesDetected), UVM_HEX);

foreach(hwdata[i])begin
printer.print_field  ($sformatf("hwdata[%0d]",i), hwdata[i], $bits(hwdata[i]), UVM_HEX);
end

foreach(hwstrb[i])begin
printer.print_field  ($sformatf("hwstrb[%0d]",i), hwstrb[i], $bits(hwstrb[i]), UVM_BIN);
end

foreach(hrdata[i])begin
printer.print_field  ($sformatf("hrdata[%0d]",i), hrdata[i], $bits(hrdata[i]), UVM_HEX);
end

endfunction : do_print

`endif



