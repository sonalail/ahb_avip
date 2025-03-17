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
  int noOfWaitStatesDetected; // 
  rand bit busyControl[]; // array for busy Transfer Control 

  extern function new  (string name = "AhbMasterTransaction");
  extern function void do_copy(uvm_object rhs);
  extern function bit  do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);

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

  constraint busyState{if(hburst == WRAP4 || hburst == INCR4) busyControl.size() == 4;
                         else if(hburst == WRAP8 || hburst == INCR8) busyControl.size() == 8;
                         else if(hburst == WRAP16 || hburst == INCR16) busyControl.size() == 16;
                         else busyControl.size()==1;
                        }

endclass:AhbMasterTransaction

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

  foreach(busyControl[i])begin
    printer.print_field  ($sformatf("busyControl[%0d]",i), busyControl[i], $bits(busyControl[i]), UVM_HEX);
  end

endfunction : do_print

`endif
