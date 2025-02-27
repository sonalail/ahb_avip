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
      
endinterface : AhbMasterCoverProperty

`endif

