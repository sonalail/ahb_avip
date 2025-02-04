
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
    haddr       <= 0 ; 
    hsize       <=3'b010 ;  
    hburst      <= SINGLE; 
    htrans      <= IDLE;  
    hwrite      <= 0; 
    hwdata      <= 0; 
    hmastlock <= 0;
    @(negedge hresetn);
   `uvm_info(name ,$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH)
    @(posedge hresetn);
    `uvm_info(name ,$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
  endtask: waitForResetn

  task driveToBFM(inout ahbTransferCharStruct dataPacket, input ahbTransferConfigStruct configPacket);
    `uvm_info(name,$sformatf("dataPacket = \n%p",dataPacket), UVM_HIGH);
    `uvm_info(name,$sformatf("configPacket = \n%p",configPacket), UVM_HIGH);
    `uvm_info(name,$sformatf("DRIVE TO BFM TASK"), UVM_HIGH);
     if (dataPacket.hburst == SINGLE) driveSingleTransfer(dataPacket);
     else if (dataPacket.hburst != SINGLE) driveBurstTransfer(dataPacket);
    else if (dataPacket.htrans == BUSY) driveBusyTransfer(dataPacket);
  endtask: driveToBFM

  task driveSingleTransfer(inout ahbTransferCharStruct dataPacket);
    waitForResetn();
    @(posedge hclk);
    `uvm_info(name,$sformatf("DRIVING THE Single Transfer"),UVM_HIGH)
     	haddr       <= dataPacket.haddr;
	hburst      <= dataPacket.hburst;
	hmastlock   <= dataPacket.hmastlock;
	hprot       <= dataPacket.hprot;
	hsize       <= dataPacket.hsize;
	hnonsec     <= dataPacket.hnonsec;
	hexcl       <= dataPacket.hexcl;
	hmaster     <= dataPacket.hmaster;
	htrans      <= dataPacket.htrans; // Non-sequential transfer
	hwdata      <= dataPacket.hwrite ? dataPacket.hwdata : '0;
	hwstrb      <= dataPacket.hwstrb;
	hwrite      <= dataPacket.hwrite;
	hselx       <= dataPacket.hselx;

    countWaitStates(dataPacket);
    wait(dataPacket.hready);  
    if (hresp == 1) begin  
      `uvm_error(name, $sformatf("Error Response Detected on Single Transfer at Address: %0h", haddr));
    end else if (!hwrite) begin  
      `uvm_info(name, $sformatf("Read Data: %0h from Address: %0h", hrdata, haddr), UVM_HIGH);
    end else begin 
      `uvm_info(name, $sformatf("Write Data: %0h to Address: %0h", dataPacket.hwdata, haddr), UVM_HIGH);
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
        haddr       <= dataPacket.haddr;
	hburst      <= dataPacket.hburst;
	hmastlock   <= dataPacket.hmastlock;
	hprot       <= dataPacket.hprot;
	hsize       <= dataPacket.hsize;
	hnonsec     <= dataPacket.hnonsec;
	hexcl       <= dataPacket.hexcl;
	hmaster     <= dataPacket.hmaster;
	htrans      <= dataPacket.htrans; // Non-sequential transfer
	hwdata      <= dataPacket.hwrite ? dataPacket.hwdata : '0;
	hwstrb      <= dataPacket.hwstrb;
	hwrite      <= dataPacket.hwrite;
	hselx       <= dataPacket.hselx;

	
`uvm_info(name, $sformatf("Burst Transfer Initiated: Address=%0h, Burst=%0b, Size=%0b, Write=%0b",
                              dataPacket.haddr, dataPacket.hburst, dataPacket.hsize, dataPacket.hwrite), UVM_HIGH);
    
    for (int i = 0; i < burst_length; i++) begin
      @(posedge hclk);
      countWaitStates(dataPacket);
      wait(hready);
      if (hresp == 1) begin
        `uvm_error(name, $sformatf("ERROR detected during Burst Transfer at Address: %0h", haddr));
        break;
      end
      if (i > 0) begin
        htrans <= dataPacket.htrans; // Sequential transfer
      end
     
      if (dataPacket.hwrite) begin
        hwdata <= dataPacket.hwdata[i]; 
        `uvm_info(name, $sformatf("Burst Write: Data[%0d] = %0h to Address: %0h", i, dataPacket.hwdata[i], current_address), UVM_HIGH);
      end else begin
        dataPacket.hrdata[i] = hrdata; 
        `uvm_info(name, $sformatf("Burst Read: Data[%0d] = %0h from Address: %0h", i, hrdata, current_address), UVM_HIGH);
      end
      if (dataPacket.hburst == 3'b011 || dataPacket.hburst == 3'b100 || dataPacket.hburst == 3'b110) begin
        current_address = (current_address & ~(burst_length - 1)) | ((current_address + (1 << dataPacket.hsize)) % burst_length);
      end else begin
        current_address += (1 << dataPacket.hsize); 
      end
      haddr <= current_address;
    end
    
    @(posedge hclk);
driveIdle();    
`uvm_info(name, "Burst Transfer Completed, Bus in IDLE State", UVM_HIGH);
  endtask

  task driveBusyTransfer(inout ahbTransferCharStruct dataPacket);
    @(posedge hclk);
    htrans     <= dataPacket.htrans == 2'b11 ? 2'b11 : 2'b10;  // Set to BUSY (2'b11) from dataPacket, otherwise use SEQ (2'b10)
    haddr      <= dataPacket.haddr;  // Use address from dataPacket
    hwrite     <= dataPacket.hwrite; // Use write control from dataPacket
    hwdata     <= dataPacket.hwdata; // Use write data from dataPacket (if applicable)
    
    `uvm_info(name, $sformatf("Driving BUSY Transfer at Address: %0h", haddr), UVM_LOW);
    
    @(posedge hclk);
    htrans <= dataPacket.htrans == 2'b11 ? 2'b10 : dataPacket.htrans;  
    `uvm_info(name, $sformatf("Continuing Sequential Transfer after BUSY at Address: %0h", haddr), UVM_LOW);
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
    dataPacket.noOfWaitStates = 0;
    while (dataPacket.hready !== 1) begin
        dataPacket.noOfWaitStates++;
    end
    `uvm_info(name, $sformatf("Wait states counted: %0d", dataPacket.noOfWaitStates), UVM_LOW);
endtask

endinterface
`endif

