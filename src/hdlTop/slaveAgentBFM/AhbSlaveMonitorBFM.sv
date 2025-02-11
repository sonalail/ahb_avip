 `ifndef AHBSLAVEMONITORBFM_INCLUDED_
`define AHBSLAVEMONITORBFM_INCLUDED_

import AhbGlobalPackage::*;

interface AhbSlaveMonitorBFM (input  bit   hclk,
                              input  bit  hresetn,
			      input logic [2:0] hburst,
 			      input logic hmastlock,
                              input logic [ADDR_WIDTH-1:0] haddr,                                                        
                              input logic [HPROT_WIDTH-1:0] hprot,
                              input logic [2:0] hsize,
                              input logic hnonsec,
                              input logic hexcl,
                              input logic [HMASTER_WIDTH-1:0] hmaster,
                              input logic [1:0] htrans, 
			      input logic [DATA_WIDTH-1:0] hwdata,
                              input logic [(DATA_WIDTH/8)-1:0]hwstrb,    
                              input logic hwrite,                              
                              input logic [DATA_WIDTH-1:0] hrdata,
			      input logic hreadyout,
                              input logic hresp,
                              input logic hexokay,
                              input logic hready,                             
                              input logic [NO_OF_SLAVES-1:0]hselx
                               );


  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import AhbSlavePackage::*;

  string name = "AHB_SLAVE_MONITOR_BFM";
  
  AhbSlaveMonitorProxy ahbSlaveMonitorProxy;

  initial begin
    `uvm_info(name,$sformatf(name),UVM_LOW);
  end

  task waitForResetn();
   @(negedge hresetn);
    `uvm_info(name, $sformatf("SYSTEM_RESET_DETECTED"), UVM_HIGH)
    
    @(posedge hresetn);
    `uvm_info(name, $sformatf("SYSTEM_RESET_DEACTIVATED"), UVM_HIGH)
  endtask : waitForResetn

 task slaveSampleData (output ahbTransferCharStruct ahbDataPacket, input ahbTransferConfigStruct ahbConfigPacket);
    @(posedge hclk);
	$display("i am here");
    while( hready !=1 && hresp==1 && htrans == IDLE) begin
	    `uvm_info(name, $sformatf("Inside while loop HREADY"), UVM_HIGH)
      @(posedge hclk);
    end   
    ahbDataPacket.hselx  = hselx;
    ahbDataPacket.haddr  = haddr;
    ahbDataPacket.hburst = ahbBurstEnum'(hburst);
    ahbDataPacket.hwrite = hwrite;
    ahbDataPacket.hsize = ahbHsizeEnum'(hsize);
    ahbDataPacket.htrans = ahbTransferEnum'(htrans);
    ahbDataPacket.hnonsec = hnonsec;
    ahbDataPacket.hprot = ahbProtectionEnum'(hprot);	
    ahbDataPacket.hresp = ahbRespEnum'(hresp);
    ahbDataPacket.hready = hready;  
    if(hwrite) begin
      ahbDataPacket.hwdata = hwdata;
      ahbDataPacket.hwstrb  = hwstrb;
    end
    else
      ahbDataPacket.hrdata = hrdata;
  endtask : slaveSampleData

endinterface : AhbSlaveMonitorBFM

`endif

