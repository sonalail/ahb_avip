`ifndef AHBSLAVEDRIVERBFM_INCLUDED_
`define AHBSLAVEDRIVERBFM_INCLUDED_

import AhbGlobalPackage::*;

interface AhbSlaveDriverBFM (input  bit   hclk,
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
                              output logic [DATA_WIDTH-1:0] hrdata,
			      		      output logic hreadyout,
 			                  output logic hresp,
                              output logic hexokay,
                              output logic hready,                                                           
                             input logic [NO_OF_SLAVES-1:0]hselx
                            );

  import AhbSlavePackage::*;

  `include "uvm_macros.svh"
  import uvm_pkg::*;


  string name = "AHB_SLAVE_DRIVER_BFM";

  AhbSlaveDriverProxy ahbSlaveDriverProxy ;
  
  initial begin
    `uvm_info(name,$sformatf(name),UVM_LOW);
  end

  task waitForResetn();
    hreadyout<=1;//Default to 1
    @(negedge hresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH)  
    @(posedge hresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
  
  endtask: waitForResetn
  
  task slaveDriveToBFM(inout ahbTransferCharStruct dataPacket, input ahbTransferConfigStruct configPacket);
    `uvm_info(name,$sformatf("dataPacket = \n%p",dataPacket), UVM_HIGH);
    `uvm_info(name,$sformatf("configPacket = \n%p",configPacket), UVM_HIGH);
    `uvm_info(name,$sformatf("DRIVE TO BFM TASK"), UVM_HIGH);
    
    if(dataPacket.htrans==SINGLE) //drive_single_transfer
      slaveDriveSingleTransfer(dataPacket);
    else if(dataPacket.htrans==BUSY)
      slaveDriveBusyTransfer(dataPacket);
   else if(dataPacket.htrans!=SINGLE)
     slavedriveBurstTransfer(dataPacket);
    
  endtask: slaveDriveToBFM

  task slaveDriveSingleTransfer(inout ahbTransferCharStruct dataPacket);
    
    waitCycles(dataPacket);
    @(posedge hclk);
    if(hreadyout)
     hready<=1;
    `uvm_info(name,$sformatf("DRIVING THE Single Transfer"),UVM_HIGH)
    dataPacket.haddr       = haddr;
    dataPacket.htrans      = ahbTransferEnum'(htrans);// Non-sequential transfer
    dataPacket.hsize       = ahbHsizeEnum'(hsize); // Use the hsize from dataPacket
    dataPacket.hburst      = ahbBurstEnum'(hburst);// SINGLE burst
    dataPacket.hwrite      = hwrite;  // Use hwrite from dataPacket
    dataPacket.hmastlock   = hmastlock; // Use master lock from dataPacket
    hresp       <= dataPacket.hresp;

    if(hwrite && hresp != 1 ) begin
      dataPacket.hwdata = hwdata;
      dataPacket.hwstrb  = hwstrb;
    end
    else if(!hwrite && hresp != 1 ) begin
      hrdata <= dataPacket.hrdata;
    end
   else if(hresp == 1) begin
     `uvm_error(name, $sformatf("ERROR detected during Burst Transfer at Address: %0h", haddr));
   end
    
  endtask: slaveDriveSingleTransfer

  task slavedriveBurstTransfer(inout ahbTransferCharStruct dataPacket);
    int burst_length;
   
    // Determine burst length based on burst type from dataPacket
    case (dataPacket.hburst)
      3'b010, 3'b011: burst_length = 4;  // INCR4, WRAP4
      3'b100, 3'b101: burst_length = 8;  // INCR8, WRAP8
      3'b110, 3'b111: burst_length = 16; // INCR16, WRAP16
      default: burst_length = 1;
    endcase

    waitCycles(dataPacket);
    // Initialize Address Phase (Non-sequential for the first transfer)
    @(posedge hclk);
    if(hreadyout)begin
      hready<=1;
    end
    
    dataPacket.haddr       = haddr;
    dataPacket.hburst      = ahbBurstEnum'(hburst);  
    dataPacket.hsize       = ahbHsizeEnum'(hsize);  
    dataPacket.hwrite      = hwrite;
    dataPacket.htrans      = ahbTransferEnum'(htrans); 
    dataPacket.hmastlock   = hmastlock; 
    `uvm_info(name, $sformatf("Burst Transfer Initiated: Address=%0h, Burst=%0b, Size=%0b, Write=%0b",
                              dataPacket.haddr, dataPacket.hburst, dataPacket.hsize, dataPacket.hwrite), UVM_HIGH);
    // Loop through burst transfers
    for (int i = 0; i < burst_length; i++) begin
      @(posedge hclk);
      if(hwrite && hresp != 1 ) begin
        dataPacket.hwdata  = hwdata;
        dataPacket.hwstrb  = dataPacket.hwstrb;
        hresp  <= dataPacket.hresp;
      end
      else if(!hwrite && hresp != 1 )begin
       hrdata <=dataPacket.hrdata ;
       hresp  <= dataPacket.hresp;
      end
      else if(hresp == 1) begin
        hresp  <= dataPacket.hresp;
        `uvm_error(name, $sformatf("ERROR detected during Burst Transfer at Address: %0h", haddr));
      end
      `uvm_info(name, "Burst Transfer Completed, Bus in IDLE State", UVM_HIGH);
	  end
  endtask: slavedriveBurstTransfer

  task slaveDriveBusyTransfer(inout ahbTransferCharStruct dataPacket);
    waitCycles(dataPacket);   
    @(posedge hclk);
    if(hreadyout)begin
      hready<=1;
    end
    
    dataPacket.htrans     = ahbTransferEnum'(htrans);  
    dataPacket.haddr      = haddr; 
    dataPacket.hwrite     = hwrite; 
    hresp      <= dataPacket.hresp;//okay(0)
    
    if(hwrite  && hresp != 1 ) begin
      dataPacket.hwdata = hwdata;
      dataPacket.hwstrb  = hwstrb;
    end
    else if(!hwrite  && hresp != 1 ) begin
      hrdata <= dataPacket.hrdata;
    end
   else if(hresp == 1) begin
   `uvm_error(name, $sformatf("ERROR detected during Burst Transfer at Address: %0h", haddr));
   end
    
   `uvm_info(name, $sformatf("Driving BUSY Transfer at Address: %0h", haddr), UVM_LOW);
   
  endtask: slaveDriveBusyTransfer

task waitCycles(inout ahbTransferCharStruct dataPacket);
  @(posedge hclk);
 // while(hselx[0] !==1) begin
   //   `uvm_info(name, "Bus is now selecting salve", UVM_HIGH)
  //    @(posedge hclk);
 //   end

  repeat(dataPacket.noOfWaitStates) begin
      `uvm_info(name,$sformatf(" DRIVING WAIT STATE"),UVM_HIGH);
      @(posedge hclk);
      hready<=0;
  end
   // hready<=1;

  `uvm_info(name, "Bus is now out of wait cycles", UVM_LOW);
endtask:waitCycles

endinterface
`endif
