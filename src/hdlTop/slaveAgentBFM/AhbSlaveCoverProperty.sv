`ifndef AHBSLAVECOVERPROPERTYINCLUDED_
`define AHBSLAVECOVERPROPERTYINCLUDED_

import AhbGlobalPackage::*;

interface AhbSlaveCoverProperty (input hclk,
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
    `uvm_info("AhbSlaveCoverProperty","AhbSlaveCoverProperty",UVM_LOW);
  end

  property CheckSingleTransferRead;
    @(posedge hclk) disable iff (!hresetn)
    ((htrans == 2'b10 && hburst == 3'b000 && hreadyout == 1 && hwrite == 1) |=> !$isunknown(hrdata));
  endproperty
  
  cover property (CheckSingleTransferRead)
    $info("Transfer is single ");
    
  property CheckTransValidWrite;
    @(posedge hclk) disable iff (!hresetn)
    (((htrans == 2'b10 || htrans == 2'b11) && hreadyout == 1) |=> !$isunknown(hrdata));
  endproperty
    
    cover property (CheckTransValidWrite)
      $info("Valid Read Transfer");
      
endinterface : AhbSlaveCoverProperty

`endif

