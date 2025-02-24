

`ifndef AHBSLAVETRANSACTION_INCLUDED_
`define AHBSLAVETRANSACTION_INCLUDED_

class AhbSlaveTransaction extends uvm_sequence_item;
  `uvm_object_utils(AhbSlaveTransaction)

	bit [ADDR_WIDTH-1:0] haddr;
	bit [NO_OF_SLAVES-1:0] hselx;
    ahbBurstEnum hburst;
    bit hmastlock;
    ahbProtectionEnum hprot;
    ahbHsizeEnum hsize;
    bit hnonsec;
    bit hexcl;
    bit [HMASTER_WIDTH-1:0] hmaster;
    ahbTransferEnum htrans;
    bit [DATA_WIDTH-1:0] hwdata[$:2**LENGTH];
    bit [(DATA_WIDTH/8)-1:0] hwstrb[$:2**LENGTH];
    ahbWriteEnum hwrite;
    rand bit [DATA_WIDTH-1:0] hrdata[$:2**LENGTH];
    rand bit hreadyout;
    ahbRespEnum hresp;
    rand bit hexokay;
    bit hready;
    rand bit choosePacketData;
	rand int noOfWaitStates;
    bit busyControl[];

  extern function new(string name = "AhbSlaveTransaction");
  extern function void do_copy(uvm_object rhs);
  extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);


constraint chooseDataPacketC1 {soft choosePacketData==0;}//0 indicating Random address to be taken.1 indicating Particular address need to be specified. 

constraint readDataSize{hrdata.size() == 16;}

/*constraint burstsize{if(hburst == WRAP4 || hburst == INCR4) hrdata.size() == 4;
                      else if(hburst == WRAP8 || hburst == INCR8) hrdata.size() == 8;
                      else if(hburst == WRAP16 || hburst == INCR16) hrdata.size() == 16;
                      else hrdata.size() == 1;
                     }*/

constraint waitState{soft noOfWaitStates == 0;}

endclass : AhbSlaveTransaction

function AhbSlaveTransaction::new(string name = "AhbSlaveTransaction");
  super.new(name);
endfunction : new

function void AhbSlaveTransaction::do_copy(uvm_object rhs);
  AhbSlaveTransaction ahbSlaveTransaction;

  if (!$cast(ahbSlaveTransaction, rhs)) begin
    `uvm_fatal("do_copy", "cast of the rhs object failed")
  end
  super.do_copy(rhs);

haddr     = ahbSlaveTransaction.haddr;
hselx     = ahbSlaveTransaction.hselx;
hburst    = ahbSlaveTransaction.hburst;
hmastlock = ahbSlaveTransaction.hmastlock;
hprot     = ahbSlaveTransaction.hprot;
hsize     = ahbSlaveTransaction.hsize;
hnonsec   = ahbSlaveTransaction.hnonsec;
hexcl     = ahbSlaveTransaction.hexcl;
hmaster   = ahbSlaveTransaction.hmaster;
htrans    = ahbSlaveTransaction.htrans;
hwdata   = ahbSlaveTransaction.hwdata;
hwstrb    = ahbSlaveTransaction.hwstrb;
hwrite    = ahbSlaveTransaction.hwrite;
hrdata    = ahbSlaveTransaction.hrdata;
hreadyout = ahbSlaveTransaction.hreadyout;
hresp     = ahbSlaveTransaction.hresp;
hexokay   = ahbSlaveTransaction.hexokay;
hready    = ahbSlaveTransaction.hready;

endfunction : do_copy

function bit AhbSlaveTransaction::do_compare(uvm_object rhs, uvm_comparer comparer);
  AhbSlaveTransaction ahbSlaveTransaction;

  if (!$cast(ahbSlaveTransaction, rhs)) begin
    `uvm_fatal("FATAL_AHB_SLAVE_TX_DO_COMPARE_FAILED", "cast of the rhs object failed")
    return 0;
  end

return super.do_compare(ahbSlaveTransaction, comparer) &&
haddr     == ahbSlaveTransaction.haddr     &&
hselx     == ahbSlaveTransaction.hselx     &&
hburst    == ahbSlaveTransaction.hburst    &&
hmastlock == ahbSlaveTransaction.hmastlock &&
hprot     == ahbSlaveTransaction.hprot     &&
hsize     == ahbSlaveTransaction.hsize     &&
hnonsec   == ahbSlaveTransaction.hnonsec   &&
hexcl     == ahbSlaveTransaction.hexcl     &&
hmaster   == ahbSlaveTransaction.hmaster   &&
htrans    == ahbSlaveTransaction.htrans    &&
hwdata   == ahbSlaveTransaction.hwdata     &&
hwstrb    == ahbSlaveTransaction.hwstrb    &&
hwrite    == ahbSlaveTransaction.hwrite    &&
hrdata    == ahbSlaveTransaction.hrdata    &&
hreadyout == ahbSlaveTransaction.hreadyout &&
hresp     == ahbSlaveTransaction.hresp     &&
hexokay   == ahbSlaveTransaction.hexokay   &&
hready    == ahbSlaveTransaction.hready;
endfunction : do_compare

function void AhbSlaveTransaction::do_print(uvm_printer printer);
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
printer.print_string  ("hwrite", hwrite.name());
printer.print_field  ("hreadyout", hreadyout, $bits(hreadyout), UVM_HEX);
printer.print_string ("hresp", hresp.name());
printer.print_field  ("hexokay",  hexokay, $bits(hexokay), UVM_HEX);
printer.print_field  ("hready", hready, $bits(hready), UVM_HEX);
printer.print_field ("choosePacketData",choosePacketData,$bits(choosePacketData),UVM_DEC);

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


