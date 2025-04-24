`ifndef AHBMASTERDRIVERBFM_INCLUDED_
`define AHBMASTERDRIVERBFM_INCLUDED_

import AhbGlobalPackage::*;
interface AhbMasterDriverBFM (input  bit   hclk,
                              input  bit   hresetn,
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
                              input  logic [DATA_WIDTH-1:0] hrdata,
                              input  logic hready,
                              input  logic hreadyout,
                              input  logic hresp,
                              input  logic hexokay,
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
    htrans <= IDLE;  
    @(posedge hresetn);
    `uvm_info(name ,$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
  endtask: waitForResetn

  task driveToBFM(inout ahbTransferCharStruct dataPacket, input ahbTransferConfigStruct configPacket);
    `uvm_info(name,$sformatf("DRIVE TO BFM TASK"), UVM_LOW);
    if(dataPacket.hburst == SINGLE) begin
      driveSingleTransfer(dataPacket,configPacket);
    end
    else if(dataPacket.hburst != SINGLE) begin
      driveBurstTransfer(dataPacket,configPacket);
    end
  endtask: driveToBFM

  task driveSingleTransfer(inout ahbTransferCharStruct dataPacket,input ahbTransferConfigStruct configPacket);
    `uvm_info("INSIDESINGLETRANSFER","BFM",UVM_LOW);

    `uvm_info(name,$sformatf("DRIVING THE Single Transfer"),UVM_LOW)
    haddr     <= dataPacket.haddr;
    hburst    <= dataPacket.hburst;
    hmastlock <= dataPacket.hmastlock;
    hprot     <= dataPacket.hprot;
    hsize     <= dataPacket.hsize;
    hnonsec   <= dataPacket.hnonsec;
    hexcl     <= dataPacket.hexcl;
    hmaster   <= dataPacket.hmaster;
    htrans    <= dataPacket.htrans; 
//    hwstrb    <= dataPacket.hwstrb[0];
    hwrite    <= dataPacket.hwrite;
    hselx     <= 1'b1;

  //  WaitStates(configPacket); 

    @(posedge hclk);
    hwdata <= dataPacket.hwrite ? maskingStrobe(dataPacket.hwdata[0], dataPacket.haddr, dataPacket.hsize) : '0;

    WaitStates(configPacket); 
    if(hresp == 1) begin  
      `uvm_info(name, $sformatf("error Response Detected on Single Transfer at Address: %0h", haddr),UVM_LOW);
    end else if (!dataPacket.hwrite) begin  
      `uvm_info(name, $sformatf("Read Data: %0h from Address: %0h", hrdata[0], haddr), UVM_LOW);
    end else begin 
      `uvm_info(name, $sformatf("Write Data: %0h to Address: %0h", hwdata, haddr), UVM_LOW);
      `uvm_info(name, $sformatf("Write Data: %0h to Address: %0h", hwdata[0], haddr), UVM_LOW);
    end
    driveIdle();
  endtask

  task driveBurstTransfer(inout ahbTransferCharStruct dataPacket,input ahbTransferConfigStruct configPacket);
    int burst_length;
    automatic logic [ADDR_WIDTH-1:0] current_address = dataPacket.haddr;
    case (dataPacket.hburst)
      WRAP4, INCR4 : burst_length = 4;  // INCR4, WRAP4
      WRAP8, INCR8 : burst_length = 8;  // INCR8, WRAP8
      WRAP16, INCR16 : burst_length = 16; // INCR16, WRAP16
      default: burst_length = 1;
    endcase

    for(int i = 0;i < burst_length; i++) begin
      haddr     <= current_address;
      hburst    <= dataPacket.hburst;
      hmastlock <= dataPacket.hmastlock;
      hprot     <= dataPacket.hprot;
      hsize     <= dataPacket.hsize;
      hnonsec   <= dataPacket.hnonsec;
      hexcl     <= dataPacket.hexcl;
      hmaster   <= dataPacket.hmaster;
      htrans    <= dataPacket.htrans; 
     // hwstrb    <= dataPacket.hwstrb[i];
      hwrite    <= dataPacket.hwrite;
      hselx     <= 1;
      
      if (hresp == ERROR) begin
        `uvm_info(name, $sformatf("ERROR detected during Burst Transfer at Address: %0h", haddr),UVM_LOW);
      end

      if (dataPacket.hburst == WRAP4 || dataPacket.hburst == WRAP8 || dataPacket.hburst == WRAP16) begin
        current_address = (current_address & ~(burst_length * (1 << dataPacket.hsize) - 1)) | ((current_address + (1 << dataPacket.hsize)) & (burst_length * (1 << dataPacket.hsize) - 1));
      end 
      else begin
        current_address += (1 << dataPacket.hsize); 
      end
      if(i > 0)begin
        if(dataPacket.busyControl[i]>0) begin
          driveBusyTransfer(dataPacket, current_address) ;
        end
        else begin
          htrans <= SEQ; // Sequential transfer
        end
      end
     // if(i==0) 
       // WaitStates(configPacket);

      @(posedge hclk);
      hwdata <= dataPacket.hwrite ? maskingStrobe(dataPacket.hwdata[i],  haddr, dataPacket.hsize) : '0;

        WaitStates(configPacket);
    end

    driveIdle();    
    `uvm_info(name, "Burst Transfer Completed, Bus in IDLE State", UVM_LOW);
  endtask

function automatic logic [DATA_WIDTH-1:0] maskingStrobe(logic [DATA_WIDTH-1:0] data,logic [$clog2(DATA_WIDTH/8)-1:0] haddr, logic [2:0] hsize);
    
    logic [DATA_WIDTH-1:0] masked_data;
    bit  [(DATA_WIDTH/8)-1:0] strobe; 
    
   automatic int num_bytes = (1 << hsize); 
   automatic  int base_index = haddr & ~(num_bytes - 1);
    
    case (hsize)
        BYTE: begin
          for (int i = 0; i < num_bytes; i++) begin
            strobe[base_index + i] = 1'b1;
          end
        end
        HALFWORD: begin
          for (int i = 0; i < num_bytes; i++) begin
            strobe[base_index + i] = 1'b1;
          end
        end
        WORD: begin      
          for (int i = 0; i < num_bytes; i++) begin
            strobe[base_index + i] = 1'b1;
          end
        end
        default: begin
            strobe = '0;
        end
    endcase
    
    
     for (int j = 0; j < (DATA_WIDTH/8); j++) begin     
          masked_data[j*8 +: 8] = strobe[j] ? data[j*8 +: 8] : 8'hxx;
     end
     return masked_data;
   endfunction

 task driveBusyTransfer(inout ahbTransferCharStruct dataPacket, inout logic [ADDR_WIDTH-1:0] current_address);
    htrans <= BUSY;   // Busy transfer
    `uvm_info(name, $sformatf("Driving BUSY Transfer at Address: %0h", haddr), UVM_LOW);
    repeat(dataPacket.noOfBusyStates) begin
       @(posedge hclk);
    end 
       htrans <= SEQ ; 
  endtask

  task driveIdle();
    @(posedge hclk);
    htrans <= IDLE;
    hselx <= 0; 
    haddr  <= 0;
    hwrite <= 0;
    hwdata <= 0;
    hburst <=  SINGLE;
    hmastlock <= 0;
    `uvm_info(name, "Bus is now IDLE", UVM_LOW);
  endtask

task WaitStates(input ahbTransferConfigStruct configPacket);
  @(negedge hclk);                
  while (!hreadyout)
    @(negedge hclk);            
endtask
 
endinterface
`endif
