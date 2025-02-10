
`ifndef AHBMASTERDRIVERPROXY_INCLUDED_
`define AHBMASTERDRIVERPROXY_INCLUDED_
 
class AhbMasterDriverProxy extends uvm_driver #(AhbMasterTransaction);
  `uvm_component_utils(AhbMasterDriverProxy)
 
  AhbMasterTransaction   ahbMasterTransaction;
 
  virtual AhbMasterDriverBFM ahbMasterDriverBFM;
 
 
  AhbMasterAgentConfig ahbMasterAgentConfig;
 
  extern function new(string name = "AhbMasterDriverProxy", uvm_component parent);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
 
endclass : AhbMasterDriverProxy
 
function AhbMasterDriverProxy::new(string name = "AhbMasterDriverProxy",uvm_component parent);
  super.new(name, parent);
endfunction : new
 
function void AhbMasterDriverProxy::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db #(virtual AhbMasterDriverBFM)::get(this,"","AhbMasterDriverBFM", ahbMasterDriverBFM)) begin
    `uvm_fatal("FATAL_MDP_CANNOT_GET_APB_MASTER_DRIVER_BFM","cannot get() ahbMasterDriverBFM");
  end
endfunction : build_phase
 
function void AhbMasterDriverProxy::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase
 
function void AhbMasterDriverProxy::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  ahbMasterDriverBFM.ahbMasterDriverProxy = this;
 
endfunction : end_of_elaboration_phase
 
task AhbMasterDriverProxy::run_phase(uvm_phase phase);
 
  ahbMasterDriverBFM.waitForResetn();
 
  `uvm_info(get_type_name(), $sformatf(" run phase inside master driver proxy \n "), UVM_NONE);
 
 
forever begin
 
 ahbTransferCharStruct dataPacket;
 ahbTransferConfigStruct configPacket;
 
    seq_item_port.get_next_item(req);
 
	`uvm_info(get_type_name(), $sformatf("REQ-MASTERTX \n %s",req.sprint),UVM_HIGH);
	AhbMasterSequenceItemConverter::fromClass(req, dataPacket);
        AhbMasterConfigConverter::fromClass(ahbMasterAgentConfig, configPacket);
	ahbMasterDriverBFM.driveToBFM(dataPacket,configPacket);
	AhbMasterSequenceItemConverter::toClass(dataPacket, req);
	`uvm_info(get_type_name(), $sformatf("AFTER :: received req packet \n %s", req.sprint()), UVM_NONE);
 
    seq_item_port.item_done();
  end
 
endtask : run_phase
 
`endif


