`ifndef AHBSLAVEASSERTION_INCLUDED_
`define AHBSLAVEASSERTION_INCLUDED_

import AhbGlobalPackage::*;

interface AhbSlaveAssertion (
  input                  hclk,
  input                  hresetn,
  input                  hreadyout,
  input [DATA_WIDTH-1:0] hrdata,
  input                  hresp,
  input [ADDR_WIDTH-1:0] haddr,
  input            [1:0] htrans,
  input                  hwrite,
  input            [2:0] hsize,
  input            [2:0] hburst,
  input                  hselx,
  input           [DATA_WIDTH-1:0] hwdata,
  input            [3:0] hprot,
  input                  hexokay,
  input            [3:0] hwstrb
);


  property checkHreadyoutValid;
    @(posedge hclk) disable iff (!hresetn)
    (htrans != 2'b00)  &&  hreadyout ##1 $stable(hreadyout) |-> !$isunknown(hwdata);
  endproperty

  assert property (checkHreadyoutValid)
       $info("HREADYOUT is high during valid transactions!");
  else $error("HREADYOUT is not high during valid transactions!");

  property checkHrespErrorOnInvalid;
    @(posedge hclk) disable iff (!hresetn)
    (hreadyout==0) |-> ##[1:$](hresp == 1'b1);
  endproperty

  assert property (checkHrespErrorOnInvalid)
       $info("HRESP is ERROR for valid transfers!");
  else $error("HRESP is not ERROR for invalid transfers!");


  property checkHrespOkayForValid;
    @(posedge hclk) disable iff (!hresetn)
    (hreadyout && (htrans != 2'b00)) |=> (hresp == 1'b0);
  endproperty

  assert property (checkHrespOkayForValid)
       $info("HRESP is OKAY for valid transactions!");
  else $error("HRESP is not OKAY for valid transactions!");

  property checkSlaveHrdataValid;
    @(posedge hclk) disable iff (!hresetn)
    (!hwrite && hreadyout && (htrans != 2'b00) && hselx) ##1 $stable(hreadyout) |-> (!$isunknown(hrdata));

  endproperty

  assert property (checkSlaveHrdataValid)
       $info("HRDATA is valid during read transfer!");
  else $error("HRDATA is invalid during read transfer!");

endinterface : AhbSlaveAssertion

`endif

