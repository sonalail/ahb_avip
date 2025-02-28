`ifndef AHBMASTERCOVERPROPERTYINCLUDED_
`define AHBMASTERCOVERPROPERTYINCLUDED_

import AhbGlobalPackage::*;

interface AhbMasterCoverProperty (input hclk,
                            input hresetn,
                            input [ADDR_WIDTH-1:0] haddr,
                            input [NO_OF_SLAVES-1:0] hselx,
                            input [2:0] hburst,
                            input hmastlock,
                            input [HPROT_WIDTH-1:0] hprot,
                            input [2:0] hsize,
                            input hnonsec,
                            input hexcl,
                            input [HMASTER_WIDTH-1:0] hmaster,
                            input [1:0] htrans,
                            input [DATA_WIDTH-1:0] hwdata,
                            input [(DATA_WIDTH/8)-1:0] hwstrb,
                            input hwrite,
                            input [DATA_WIDTH-1:0] hrdata,
                            input hreadyout,
                            input hresp,
                            input hexokay,
                            input hready
                       );

  import uvm_pkg::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("AhbMasterCoverProperty","AhbMasterCoverProperty",UVM_LOW);
  end

  property CheckSingleTransferWrite;
    @(posedge hclk) disable iff (!hresetn)
      ((htrans == 2'b10 && hburst == 3'b000 && hready == 1 && hwrite == 1) |=> !$isunknown(hwdata));
  endproperty
  
  cover property (CheckSingleTransferWrite)
    $info("Transfer is single ");
    
  property CheckTransValidWrite;
    @(posedge hclk) disable iff (!hresetn)
    ( ((htrans == 2'b10 || htrans == 2'b11) && hready == 1) |=> !$isunknown(hwdata));
  endproperty
    
  cover property (CheckTransValidWrite)
    $info("Valid Write Transfer");
  
  property CheckHaddrAlignment;
  @(posedge hclk) disable iff (!hresetn)
   (hready && (htrans != 2'b00) && hburst != 3'b000 && hsize != 3'b000) |-> ((hsize == 3'b001) && (haddr[0] == 1'b0)) || 
                                                                            ((hsize == 3'b010) && (haddr[1:0] == 2'b00));
  endproperty   

  cover property (CheckHaddrAlignment)
    $info("Address Aligned with size");
 
  property CheckNonSeqToIdle;
   @(posedge hclk) disable iff (!hresetn)
    (htrans == 2'b10 && hready == 1 && hburst == 3'b000)  |=> htrans == 2'b00;
  endproperty
  
  cover property (CheckNonSeqToIdle)
    $info("Trans going from non seq to idle in single burst");

  property CheckOccurenceOfBusy;
    @(posedge hclk)
    htrans == 2'b10 |-> ##[1:$] htrans == 2'b01;
  endproperty

 cover property (CheckOccurenceOfBusy)
    $info("Busy state has occuered");
  
 property CheckHreadyLowInBetween;
   @(posedge hclk)
   (htrans == 2'b10 && hready == 1) |=> ##[0:$] hready == 0;
 endproperty
  
 cover property (CheckHreadyLowInBetween)
   $info("Hready low in between transactions");

 property CheckIfHburstIsVaild;
   @(posedge hclk)
    (htrans == 2'b10 && hburst inside {[1:7]} && hready == 1 ) |=> htrans == 2'b11;
 endproperty

 cover property (CheckIfHburstIsVaild)
  $info("Hurst Occuring properly");

 property CheckHwstrb;
   @(posedge hclk)
    (htrans == 2'b10 && hwrite == 1 && hready == 1) |-> !$isunknown(hwstrb);
 endproperty

 cover property (CheckHwstrb)
   $info("Hwstrb is valid");

 
endinterface : AhbMasterCoverProperty

`endif

