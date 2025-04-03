`ifndef AHBMASTERASSERTION_INCLUDED_
`define AHBMASTERASSERTION_INCLUDED_

import AhbGlobalPackage::*;

interface AhbMasterAssertion (
  input                      hclk,
  input                      hresetn,
  input     [ADDR_WIDTH-1:0] haddr,
  input     [DATA_WIDTH-1:0] hwdata,
  input                [2:0] hsize,
  input                [2:0] hburst,
  input                [1:0] htrans,
  input                      hwrite,
  input                      hready,
  input                      hresp,
  input                      hexcl,
  input    [HPROT_WIDTH-1:0] hprot,
  input [HMASTER_WIDTH -1:0] hmaster,
  input                      hmastlock,
  input                      hselx,
  input                [3:0] hwstrb
);

  import uvm_pkg::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("MASTER_ASSERTIONS","MASTER_ASSERTIONS",UVM_LOW);
  end

/*  bit sel;
  logic [31:0]data;
 

   always @(posedge hclk) begin
       repeat(1) @(posedge hclk);
          for(int i=0;i<=3;i++) begin 
            sel <= hwstrb >> i;
            data[8*i +: 8] <= sel ? hwdata[8*i +:8] : 'hxx;
         end
   end
  
  property checkHwdataValid;
    @(posedge hclk) disable iff (!hresetn)
    (hwrite && hready && (htrans != IDLE) && hselx == 1) ##1 $stable(hready)|-> strong( (!$isunknown(data)));
  endproperty

  assert property (checkHwdataValid)
       $info("HWDATA is Valid When HWRITE IS HIGH");
  else $error("HWDATA contains X when HWRITE is asserted!");
*/

  property checkHwdataValid;
    @(posedge hclk) disable iff (!hresetn)
    (hwrite && hready && (htrans != IDLE) && hselx == 1 && hwstrb == 4'b1111) ##1 $stable(hready)|-> (!$isunknown(hwdata));
  endproperty

  assert property (checkHwdataValid)
       $info("HWDATA is Valid When HWRITE IS HIGH");
  else $error("HWDATA contains X when HWRITE is asserted!");

  property checkHtransValidity;
    @(posedge hclk) disable iff (!hresetn)
    ((htrans == NONSEQ || htrans == SEQ) && hselx == 1) |-> ##[1:WAIT_FOR_HREADY] hready;
  endproperty

  assert property (checkHtransValidity)
       $info("HTRANS is Valid ");
  else $error("HTRANS has an invalid value or transition!");

  property checkHaddrAlignment;
    @(posedge hclk) disable iff (!hresetn)
    (hready && (htrans != IDLE) && hburst != SINGLE && hsize != BYTE) |-> ((hsize == HALFWORD) && (haddr[0] == 1'b0)) || ((hsize == WORD) && (haddr[1:0] == 2'b00));
  endproperty

  assert property (checkHaddrAlignment)
    $info("HADDR is aligned based on HSIZE");
  else $error("HADDR is not aligned based on HSIZE!");

  property checkHmastlockCheck;
    @(posedge hclk) disable iff (!hresetn)
    (hready && htrans != IDLE && hmastlock) |-> (hmastlock == 1);
  endproperty

  assert property (checkHmastlockCheck)
    $info("HMASTLOCK is asserted during a locked transfer");
  else $error("HMASTLOCK is not asserted during a locked transfer!");

  property checkBurstIncr;
    @(posedge hclk) disable iff (!hresetn)
    ((hburst inside {INCR4,INCR8,INCR16}) && (htrans == SEQ || htrans==NONSEQ))
     ##1 (htrans ==SEQ) && $stable(hburst) && !$stable(haddr) |-> (haddr == $past(haddr) + (1 << hsize));
  endproperty

  assert property (checkBurstIncr)
    $info("INCR burst type passed: Address incremented correctly");
  else $error("INCR burst type failed: Address not incremented correctly!");

  property checkBurstWrap;
    @(posedge hclk) disable iff (!hresetn)
    (hburst == {WRAP4, WRAP8, WRAP16}  && (htrans == SEQ) || htrans == NONSEQ)
       ##1 (htrans ==SEQ) && $stable(hburst) |-> (((haddr & ((1 << hsize) - 1)) == 0) ||
                                              (haddr == $past(haddr) + (1 << hsize)));
  endproperty

  assert property (checkBurstWrap)
    $info("WRAP burst type passed: Address wrapping is done correctly");
  else $error("WRAP burst type failed: Address wrapping incorrect!");

  property checkTransBusyToSeq;
    @(posedge hclk) disable iff(!hresetn)
    (htrans == BUSY && hready == 1 )|=> (haddr == $past(haddr)) && (htrans == SEQ || htrans == BUSY);
  endproperty
 
  assert property(checkTransBusyToSeq)
    $info("Transition from BUSY to SEQ passed and address is hold ");
  else $error("Transition from BUSY to SEQ failed: and address is not hold");

  property checkTransIdleToNonSeq;
    @(posedge hclk) disable iff(!hresetn) ((htrans == IDLE) ##1 hselx) |-> ( htrans == NONSEQ); 
  endproperty

  assert property(checkTransIdleToNonSeq)
    $info("Transition from IDLE to NON-SEQ passed");
  else $error("Transition from IDLE to NON-SEQ failed: Conditions not met!");

  property checkAddrStability;
    @(posedge hclk) disable iff (!hresetn)
    ((htrans == NONSEQ || htrans == SEQ) && hselx) |-> !$isunknown(haddr);
  endproperty

  assert property (checkAddrStability)
    $info("Address stability during waited transfer verified.");
  else $error("Address changed before HREADY HIGH!");

  property checkHsizeMatchesData;
    @(posedge hclk) disable iff (!hresetn)
    (hready && (htrans != IDLE)) |-> ((1 << hsize) <= 32);
  endproperty

  assert property (checkHsizeMatchesData)
    $info("HSIZE matches the data width supported by the slave!");
  else $error("HSIZE does not match the data width supported by the slave!");

  property checkBurstTypeValid;
    @(posedge hclk) disable iff (!hresetn)
    (hready && (htrans != IDLE)) |-> (hburst inside {[SINGLE:INCR16]});
  endproperty

  assert property (checkBurstTypeValid)
    $info("Valid burst type!");
  else $error("Invalid burst type detected!");
 
  property checkStrobe;
    @(posedge hclk) disable iff (!hresetn)
    (htrans != IDLE) |->((hsize == SINGLE -> $countones(hwstrb)== 1 )) || ((hsize ==INCR -> $countones(hwstrb)==2)) || ((hsize==WRAP4 -> $countones(hwstrb)==4));
  endproperty
 
  assert property (checkStrobe)
    $info("Hwstrb valid ");
  else $error("Hwstrb is not valid for hsize");

endinterface : AhbMasterAssertion

`endif


