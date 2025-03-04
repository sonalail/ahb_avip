`ifndef AHBMASTERDRIVERBFM_INCLUDED_
`define AHBMASTERDRIVERBFM_INCLUDED_
import AhbGlobalPackage::*;
interface AhbMasterDriverBFM (input  bit  hclk,
                              input  bit  hresetn,
                              output logic [ADDR_WIDTH-1:0] haddr,
                              output logic [2:0] hburst,
                              output logic hmastlock,
                              output logic [HPROT_WIDTH-1:0] hprot,
                              output logic [2:0] hsize,
                              output logic hnonsec,
                              output logic hexcl,
                              output logic [HMASTER_WIDTH-1:0] hmaster,
                              output logic [1:0] htrans,     
                              output logic hwrite,
                              output logic [DATA_WIDTH-1:0] hwdata,
                              output logic [(DATA_WIDTH/8)-1:0] hwstrb,
                              input logic [DATA_WIDTH-1:0] hrdata,
                              input logic hready,
                              input logic hreadyout,
                              input logic hresp,
                              input logic hexokay,
                              output logic [NO_OF_SLAVES-1:0] hselx
                              );
  import AhbMasterPackage::*;
  `include "uvm_macros.svh"
  import uvm_pkg::*; 
  string name = "AHB_MASTER_DRIVER_BFM";
 
  AhbMasterDriverProxy ahbMasterDriverProxy;
 
  initial begin
    `uvm_info(name, $sformatf(name), UVM_LOW)
  end
 
  task waitForResetn();
    @(negedge hresetn);
   `uvm_info(name ,$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH)
    htrans      <= IDLE;  
    @(posedge hresetn);
    `uvm_info(name ,$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
  endtask: waitForResetn
 
  task driveToBFM(inout ahbTransferCharStruct dataPacket, input ahbTransferConfigStruct configPacket);
//    `uvm_info(name,$sformatf("dataPacket = \n%p",dataPacket), UVM_LOW);
//    `uvm_info(name,$sformatf("configPacket = \n%p",configPacket), UVM_LOW);
    `uvm_info(name,$sformatf("DRIVE TO BFM TASK"), UVM_LOW);
     if (dataPacket.hburst == SINGLE)
	 begin
	 	driveSingleTransfer(dataPacket);
	end
     else if (dataPacket.hburst != SINGLE) begin
	 	driveBurstTransfer(dataPacket);
		end
  endtask: driveToBFM
 
  task driveSingleTransfer(inout ahbTransferCharStruct dataPacket);
	`uvm_info("INSIDESINGLETRANSFER","BFM",UVM_LOW);
  //countWaitStates(dataPacket);
   @(posedge hclk); 
    `uvm_info(name,$sformatf("DRIVING THE Single Transfer"),UVM_LOW)
    haddr       <= dataPacket.haddr;
	hburst      <= dataPacket.hburst;
	hmastlock   <= dataPacket.hmastlock;
	hprot       <= dataPacket.hprot;
	hsize       <= dataPacket.hsize;
	hnonsec     <= dataPacket.hnonsec;
	hexcl       <= dataPacket.hexcl;
	hmaster     <= dataPacket.hmaster;
	htrans      <= dataPacket.htrans; 
	hwstrb      <= dataPacket.hwstrb[0];
	hwrite      <= dataPacket.hwrite;
	hselx       <= 1'b1;
 
   //`uvm_info(name,$sformatf("DRIVING IS DONE"),UVM_LOW)
   //countWaitStates(dataPacket);
    wait(hready);  
 
   @(posedge hclk);
        hwdata <= dataPacket.hwrite ? maskingStrobe(dataPacket.hwdata[0], dataPacket.hwstrb[0]) : '0;
 
    if (hresp == 1) begin  
      `uvm_info(name, $sformatf("Error Response Detected on Single Transfer at Address: %0h", haddr),UVM_LOW);
    end else if (!dataPacket.hwrite) begin  
      `uvm_info(name, $sformatf("Read Data: %0h from Address: %0h", hrdata[0], haddr), UVM_LOW);
    end else begin `uvm_info(name, $sformatf("Write Data: %0h to Address: %0h", hwdata, haddr), UVM_LOW);
      `uvm_info(name, $sformatf("Write Data: %0h to Address: %0h", hwdata[0], haddr), UVM_LOW);
    end
    driveIdle();
  endtask
 
  task driveBurstTransfer(inout ahbTransferCharStruct dataPacket);
    int burst_length;
    automatic logic [ADDR_WIDTH-1:0] current_address = dataPacket.haddr;
     case (dataPacket.hburst)
      3'b010, 3'b011 : burst_length = 4;  // INCR4, WRAP4
      3'b100, 3'b101 : burst_length = 8;  // INCR8, WRAP8
      3'b110, 3'b111 : burst_length = 16; // INCR16, WRAP16
      default: burst_length = 1;
    endcase
    @(posedge hclk);
    for(int i = 0;i < burst_length; i++)
	begin
 
    haddr       <= current_address;
	hburst      <= dataPacket.hburst;
	hmastlock   <= dataPacket.hmastlock;
	hprot       <= dataPacket.hprot;
	hsize       <= dataPacket.hsize;
	hnonsec     <= dataPacket.hnonsec;
	hexcl       <= dataPacket.hexcl;
	hmaster     <= dataPacket.hmaster;
	htrans      <= dataPacket.htrans; 
	hwstrb      <= dataPacket.hwstrb[i];
	hwrite      <= dataPacket.hwrite;
	hselx       <= 1;
 
	
	/*`uvm_info(name, $sformatf("Burst Transfer Initiated: Address=%0h, Burst=%0b, Size=%0b, Write=%0b",dataPacket.haddr, dataPacket.hburst, dataPacket.hsize, dataPacket.hwrite), UVM_LOW);*/
    
	wait(hready);
      if (hresp == 1) begin
        `uvm_info(name, $sformatf("ERROR detected during Burst Transfer at Address: %0h", haddr),UVM_LOW);
      end
      if (dataPacket.hburst == 3'b010 || dataPacket.hburst == 3'b100 || dataPacket.hburst == 3'b110) begin
 
	  //`uvm_info("LOKI","LOKI1", UVM_LOW);
        current_address = (current_address & ~(burst_length * (1 << dataPacket.hsize) - 1)) | ((current_address + (1 << dataPacket.hsize)) & (burst_length * (1 << dataPacket.hsize) - 1));
      end 
      else begin
	  //`uvm_info("THOR","THOR1", UVM_LOW);
        current_address += (1 << dataPacket.hsize); 
      end
     if(i > 0)begin
         if(dataPacket.busyControl[i]>0) begin
           driveBusyTransfer(dataPacket, current_address) ;
           //@(posedge hclk);
         end
         else begin
     //@(posedge hclk);
           htrans <= 2'b11; // Sequential transfer
         end
    end

     @(posedge hclk);
      hwdata <= dataPacket.hwrite ? maskingStrobe(dataPacket.hwdata[i], dataPacket.hwstrb[i]) : '0;
      //hwdata      <= dataPacket.hwrite ? dataPacket.hwdata[i] : '0;

    end

driveIdle();    
		`uvm_info(name, "Burst Transfer Completed, Bus in IDLE State", UVM_LOW);
  endtask

function logic [DATA_WIDTH-1:0] maskingStrobe(logic [DATA_WIDTH-1:0] data, logic [(DATA_WIDTH/8)-1:0] strobe);
    logic [DATA_WIDTH-1:0] masked_data;
    for (int j = 0; j < (DATA_WIDTH/8); j++) begin
        masked_data[j*8 +: 8] = strobe[j] ? data[j*8 +: 8] : 8'h00;
    end
    return masked_data;
endfunction
 
  task driveBusyTransfer(inout ahbTransferCharStruct dataPacket, inout logic [ADDR_WIDTH-1:0] current_address);
    //@(posedge hclk);
 
    htrans     <= 2'b01;             // Busy transfer
    //haddr      <= current_address;  // Use address from dataPacket
    //hwrite     <= dataPacket.hwrite; // Use write control from dataPacket
    //hwdata     <= dataPacket.hwdata; // Use write data from dataPacket (if applicable)
    `uvm_info(name, $sformatf("Driving BUSY Transfer at Address: %0h", haddr), UVM_LOW);
    @(posedge hclk);
    htrans <= 2'b11 ;  
    //`uvm_info(name, $sformatf("Continuing Sequential Transfer after BUSY at Address: %0h", haddr), UVM_LOW);
  //end
  endtask
 
  
  task driveIdle();
    @(posedge hclk);
    htrans <= IDLE; 
    haddr  <= 0;
    hwrite <= 0;
    hwdata <= 0;
    hburst <=  SINGLE;
    hmastlock <= 0;
    `uvm_info(name, "Bus is now IDLE", UVM_LOW);
  endtask
 
task countWaitStates(inout ahbTransferCharStruct dataPacket);
//  @(posedge hclk); 
  //dataPacket.noOfWaitStates = 0;
    while (hready == 0) begin
        dataPacket.noOfWaitStates++;
		@(posedge hclk);
    end
    `uvm_info(name, $sformatf("Wait states counted: %0d", dataPacket.noOfWaitStates), UVM_LOW);
endtask
 
endinterface
`endif
