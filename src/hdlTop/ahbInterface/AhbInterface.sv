`ifndef AHBINTERFACE_INCLUDED_
`define AHBINTERFACE_INCLUDED_

import AhbGlobalPackage::*;

interface AhbInterface(input hclk, input hresetn);
  
  logic  [ADDR_WIDTH-1:0] haddr;

  logic [NO_OF_SLAVES-1:0] hselx;
  
  logic [2:0] hburst;

  logic hmastlock;

  logic [HPROT_WIDTH-1:0] hprot;
 
  logic [2:0] hsize;

  logic hnonsec;

  logic hexcl;

  logic [HMASTER_WIDTH-1:0] hmaster;

  logic [1:0] htrans;


  logic [DATA_WIDTH-1:0] hwdata;

  logic [(DATA_WIDTH/8)-1:0] hwstrb;

  logic hwrite;

  logic [DATA_WIDTH-1:0] hrdata;

  logic hreadyout;

  logic hresp;

  logic hexokay;

  logic hready;

  bind AhbInterface AhbCoverProperty ahb_cover(.hclk(ahbInterface.hclk),
    .hresetn(ahbInterface.hresetn),
    .haddr(ahbInterface.haddr),
    .hselx(ahbInterface.hselx),
    .hburst(ahbInterface.hburst),
    .hmastlock(ahbInterface.hmastlock),
    .hprot(ahbInterface.hprot),
    .hsize(ahbInterface.hsize),
    .hnonsec(ahbInterface.hnonsec),
    .hexcl(ahbInterface.hexcl),
    .hmaster(ahbInterface.hmaster),
    .htrans(ahbInterface.htrans),
    .hwdata(ahbInterface.hwdata),
    .hwstrb(ahbInterface.hwstrb),
    .hwrite(ahbInterface.hwrite),
    .hrdata(ahbInterface.hrdata),
    .hreadyout(ahbInterface.hreadyout),
    .hresp(ahbInterface.hresp),
    .hexokay(ahbInterface.hexokay),
    .hready(ahbInterface.hready)
                                              );

endinterface : AhbInterface

`endif

