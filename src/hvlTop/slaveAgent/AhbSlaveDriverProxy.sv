`ifndef AHBSLAVEDRIVERPROXY_INCLUDED_
`define AHBSLAVEDRIVERPROXY_INCLUDED_

class AhbSlaveDriverProxy extends uvm_driver#(AhbSlaveTransaction);
  `uvm_component_utils(AhbSlaveDriverProxy)

  AhbSlaveTransaction ahbSlaveTransaction;

  virtual AhbSlaveDriverBFM ahbSlaveDriverBFM;

  AhbSlaveAgentConfig ahbSlaveAgentConfig;


  extern function new(string name = "AhbSlaveDriverProxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  //extern virtual task checkForHresp(inout ahbTransferCharStruct structPacket );
  //extern virtual task taskWrite(inout ahbTransferCharStruct structPacket);
  //extern virtual task taskRead(inout ahbTransferCharStruct structPacket);

endclass : AhbSlaveDriverProxy

function AhbSlaveDriverProxy::new(string name = "AhbSlaveDriverProxy", uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void AhbSlaveDriverProxy::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db #(virtual AhbSlaveDriverBFM)::get(this,"","AhbSlaveDriverBFM", ahbSlaveDriverBFM)) 
    begin
    `uvm_fatal("FATAL SDP CANNOT GET SLAVE DRIVER BFM","cannot get() ahbSlaveDriverBFM");
  end
  
endfunction : build_phase

function void AhbSlaveDriverProxy::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

function void AhbSlaveDriverProxy::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  ahbSlaveDriverBFM.ahbSlaveDriverProxy = this;
endfunction : end_of_elaboration_phase

task AhbSlaveDriverProxy::run_phase(uvm_phase phase);
`uvm_info(get_type_name(), $sformatf(" BEFORERESET \n "), UVM_NONE);

  ahbSlaveDriverBFM.waitForResetn();
  `uvm_info(get_type_name(), $sformatf(" run phase inside slave driver proxy \n "), UVM_NONE);
  
  forever begin
    ahbTransferCharStruct structPacket;
    ahbTransferConfigStruct structConfig;
    
  //  checkForHresp(structPacket);
  //  `uvm_info("DEBUG_NA", $sformatf("AFTER HRESP_CHECK_5 -struct:: %p", structPacket), UVM_MEDIUM); 
//    `uvm_info(get_type_name(), "Waiting for a transaction...", UVM_LOW)
    seq_item_port.get_next_item(req);
  //  `uvm_info(get_type_name(), "Transaction received!", UVM_LOW)

    //`uvm_info(get_type_name(), $sformatf("REQ-SLAVE_TX \n %s",req.sprint),UVM_LOW);
    
    AhbSlaveSequenceItemConverter::fromClass(req, structPacket); 
   // `uvm_info(get_type_name(), $sformatf("Converted structPacket: %p", structPacket), UVM_HIGH)

    AhbSlaveConfigConverter::fromClass(ahbSlaveAgentConfig, structConfig);
  //  `uvm_info(get_type_name(), $sformatf("Converted structConfig: %p", structConfig), UVM_HIGH)

     ahbSlaveDriverBFM.slaveDriveToBFM(structPacket, structConfig);

    AhbSlaveSequenceItemConverter::toClass(structPacket, req);  
    
    seq_item_port.item_done();
  end
endtask : run_phase
/*
task AhbSlaveDriverProxy::taskWrite(inout ahbTransferCharStruct structPacket);
  `uvm_info("DEBUG_NA", $sformatf("taskWrite"), UVM_HIGH); 
  
  for(int i=0; i<(DATA_WIDTH/8); i++) begin
    `uvm_info("DEBUG_NA", $sformatf("task_write inside for loop :: %0d", i), UVM_HIGH);
    `uvm_info("DEBUG_NA", $sformatf("task_write inside for loop hwstrb = %0b", structPacket.hwstrb[i]), UVM_HIGH);
    
    if(structPacket.hwstrb[i] == 1) begin
      ahbSlaveAgentConfig.slaveMemoryTask(structPacket.haddr+i,structPacket.hwdata[8*i+7 -: 8]);
      `uvm_info("DEBUG_NA", $sformatf("task_write inside for loop data = %0h", 
                                      ahbSlaveAgentConfig.slaveMemory[structPacket.haddr+i]), UVM_HIGH);
    end
  end
endtask : taskWrite

task AhbSlaveDriverProxy::taskRead(inout ahbTransferCharStruct structPacket);
  `uvm_info("DEBUG_NA", $sformatf("task_read"), UVM_HIGH);
  
  for(int i=0; i<(DATA_WIDTH/8); i++) begin
    if(ahbSlaveAgentConfig.slaveMemory.exists(structPacket.haddr)) begin
      structPacket.hrdata[8*i+7 -: 8] = ahbSlaveAgentConfig.slaveMemory[structPacket.haddr + i];
    end
    else begin
      `uvm_error(get_type_name(), $sformatf("Selected address has no data"));
      structPacket. hresp  = ERROR;
      structPacket.hrdata  = 'h0;
    end
  end 

endtask : taskRead
    

task AhbSlaveDriverProxy:: checkForHresp(inout ahbTransferCharStruct structPacket);
  
  `uvm_info("DEBUG_NA", $sformatf("AFTER HRESP_CHECK_1 struct :: %p", structPacket), UVM_HIGH);
  if(structPacket.haddr inside {[ ahbSlaveAgentConfig.minimumAddress: ahbSlaveAgentConfig.maximumAddress]}) begin
    structPacket.hresp = OKAY;
    
    if(structPacket.hwrite==1) begin
      taskWrite(structPacket);
    end
    else begin
      taskRead(structPacket);
    end
  end
  else begin
   structPacket.hresp  = ERROR;
   structPacket.hrdata  = 'h0;
  end
  
  `uvm_info("DEBUG_NA", $sformatf("AFTER HRESP_CHECK_2 minimumAddress = %0h, maximumAddress=%0h ",
                                  ahbSlaveAgentConfig.minimumAddress, ahbSlaveAgentConfig.maximumAddress), UVM_HIGH);

  `uvm_info("DEBUG_NA", $sformatf("AFTER HRESP_CHECK_3 struct-Haddr :: %0h", structPacket.haddr), UVM_HIGH);
  `uvm_info("DEBUG_NA-hresp", $sformatf("AFTER HRESP_CHECK_4 struct :: %p", structPacket), UVM_HIGH);

endtask : checkForHresp
*/
`endif
