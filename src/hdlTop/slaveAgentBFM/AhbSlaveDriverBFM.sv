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
	@(negedge hresetn);
   	 	`uvm_info(name,$sformatf("SYSTEM RESET DETECTED"),UVM_LOW)  
   	//	 hready=0;
        @(posedge hresetn);
    		`uvm_info(name,$sformatf("SYSTEM RESET DEACTIVATED"),UVM_LOW)
  endtask: waitForResetn

  task slaveDriveToBFM(inout ahbTransferCharStruct dataPacket, input ahbTransferConfigStruct configPacket);
//	  `uvm_info(name,$sformatf("dataPacket = \n%p",dataPacket), UVM_LOW);
//	  `uvm_info(name,$sformatf("configPacket = \n%p",configPacket), UVM_LOW);
	  `uvm_info(name,$sformatf("DRIVE TO BFM TASK"), UVM_LOW);
	
	/*do begin
		@(posedge hclk);
	end while(hselx === 1'b0);*/

	wait(hselx)

    	`uvm_info(name,$sformatf("AFTERHSELASSERTED HTRANSFER = %0d",htrans), UVM_LOW);
    if(hburst===SINGLE) 
	begin
      slaveDriveSingleTransfer(dataPacket);
	end
    else if(htrans===BUSY) begin
      slaveDriveBusyTransfer(dataPacket);
	  end
   else if(hburst!==SINGLE) begin
     slavedriveBurstTransfer(dataPacket);
	 end
  endtask: slaveDriveToBFM
 
  task slaveDriveSingleTransfer(inout ahbTransferCharStruct dataPacket);
    `uvm_info(name,$sformatf("DRIVING THE Single Transfer"),UVM_LOW)
	waitCycles(dataPacket);
    hready 		   <= 1;
    dataPacket.haddr       <= haddr;
    dataPacket.htrans      <= ahbTransferEnum'(htrans);
    dataPacket.hsize       <= ahbHsizeEnum'(hsize); 
    dataPacket.hburst      <= ahbBurstEnum'(hburst);
    dataPacket.hwrite      <= ahbWriteEnum'(hwrite);  
    dataPacket.hmastlock   <= hmastlock; 
    dataPacket.hselx       <= hselx;
 
    @(posedge hclk);
    if(hwrite) begin
      dataPacket.hwdata[0] <= hwdata;
      dataPacket.hwstrb[0] <= hwstrb;
	  hresp <= 0;
    end

    else if(!hwrite) begin
//	@(posedge hclk);
      hrdata <= dataPacket.hrdata[0];
	  hresp  <= 0;
    end

  endtask: slaveDriveSingleTransfer
 
  task slavedriveBurstTransfer(inout ahbTransferCharStruct dataPacket);
    int burst_length;
	`uvm_info(name,$sformatf("STARTEDBURSTTRANSFERTASK"),UVM_LOW)
    case (hburst)
      3'b010, 3'b011: burst_length = 4;  
      3'b100, 3'b101: burst_length = 8;  
      3'b110, 3'b111: burst_length = 16; 
      default: burst_length = 1;
    endcase
 
   // waitCycles(dataPacket);
    //@(posedge hclk);
	for(int i = 0;i < burst_length;i++)
	begin
//@(posedge hclk);
    hready<=1;
    dataPacket.haddr       <= haddr;
    dataPacket.hburst      <= ahbBurstEnum'(hburst);  
    dataPacket.hsize       <= ahbHsizeEnum'(hsize);  
    dataPacket.hwrite      <= ahbWriteEnum'(hwrite);
    dataPacket.htrans      <= ahbTransferEnum'(htrans); 
    dataPacket.hmastlock   <= hmastlock; 
    dataPacket.hselx       <= hselx;
	`uvm_info(name, $sformatf("Burst Transfer Initiated: Address=%0h, Burst=%0b, Size=%0b, Write=%0b",
				  dataPacket.haddr, dataPacket.hburst, dataPacket.hsize, dataPacket.hwrite), UVM_LOW);
   // for (int i = 0; i < burst_length - 1; i++) begin
      
      if(hwrite) begin
	@(posedge hclk);
        dataPacket.hwdata[i]  <= hwdata;
        dataPacket.hwstrb[i]  <= hwstrb;
        hresp  <= 0;
      end
      else if(!hwrite)begin
	@(posedge hclk);
	`uvm_info(name, $sformatf("DEBUG Address=%0h, Burst=%0b, Size=%0b, Write=%0b,hrdata[%0d] = %0d",
				  dataPacket.haddr, dataPacket.hburst, dataPacket.hsize, dataPacket.hwrite,i,dataPacket.hrdata[i]), UVM_LOW);
       hrdata <=dataPacket.hrdata[i];
       //$display("*************** hrdata=%0d *****************
       hresp  <= 0;
      end
      /*else if(dataPacket.hresp == 1) begin
        hresp  <= dataPacket.hresp;
        `uvm_error(name, $sformatf("ERROR detected during Burst Transfer at Address: %0h", haddr));
      end
	    `uvm_info(name, "Burst Transfer Completed, Bus in IDLE State", UVM_LOW);
		*/
    end
	//end
  endtask: slavedriveBurstTransfer
 
  task slaveDriveBusyTransfer(inout ahbTransferCharStruct dataPacket);
    waitCycles(dataPacket);   
    @(posedge hclk);
    if(dataPacket.hreadyout)begin
      dataPacket.hready<=1;
    end
    dataPacket.htrans     = ahbTransferEnum'(htrans);  
    dataPacket.haddr      = haddr; 
    dataPacket.hwrite     = ahbWriteEnum'(hwrite); 
    hresp      <= dataPacket.hresp;
    if(hwrite  && dataPacket.hresp != 1 ) begin
      dataPacket.hwdata = hwdata;
      dataPacket.hwstrb  = hwstrb;
    end
    else if(!hwrite  && dataPacket.hresp != 1 ) begin
      hrdata <= dataPacket.hrdata;
    end
   else if(dataPacket.hresp == 1) begin
   `uvm_error(name, $sformatf("ERROR detected during Burst Transfer at Address: %0h", haddr));
   end
   `uvm_info(name, $sformatf("Driving BUSY Transfer at Address: %0h", haddr), UVM_LOW);
  endtask: slaveDriveBusyTransfer
 
task waitCycles(inout ahbTransferCharStruct dataPacket);
 // @(posedge hclk);
// while(hselx[0] !==1) begin
   //   `uvm_info(name, "Bus is now selecting salve", UVM_HIGH)
  //    @(posedge hclk);
//   end
 
  repeat(dataPacket.noOfWaitStates) begin
	  `uvm_info(name,$sformatf(" DRIVING WAIT STATE"),UVM_LOW);
      hready<=0;
    @(posedge hclk); 
  end
   // hready<=1;
 
  `uvm_info(name, "Bus is now out of wait cycles", UVM_LOW);
endtask:waitCycles
 
endinterface
`endif
