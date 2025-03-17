`ifndef APBMASTERMONITORPROXY_INCLUDED_
`define APBMASTERMONITORPROXY_INCLUDED_

class AhbMasterMonitorProxy extends uvm_monitor; 
  `uvm_component_utils(AhbMasterMonitorProxy)

  virtual AhbMasterMonitorBFM ahbMasterMonitorBFM;

  AhbMasterAgentConfig ahbMasterAgentConfig;

  uvm_analysis_port#(AhbMasterTransaction) ahbMasterAnalysisPort;
  
  extern function new(string name = "AhbMasterMonitorProxy", uvm_component parent);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : AhbMasterMonitorProxy

function AhbMasterMonitorProxy::new(string name = "AhbMasterMonitorProxy",uvm_component parent);
  super.new(name, parent);
  ahbMasterAnalysisPort = new("ahbMasterAnalysisPort",this);
endfunction : new

function void AhbMasterMonitorProxy::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db #(virtual AhbMasterMonitorBFM)::get(this,"","AhbMasterMonitorBFM", ahbMasterMonitorBFM)) begin
    `uvm_fatal("FATAL_MDP_CANNOT_GET_AHB_MASTER_MONITOR_BFM","cannot get() ahbMasterMonitorBFM");
  end
endfunction : build_phase

function void AhbMasterMonitorProxy::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  ahbMasterMonitorBFM.ahbMasterMonitorProxy = this;
endfunction : end_of_elaboration_phase

task AhbMasterMonitorProxy::run_phase(uvm_phase phase);
  AhbMasterTransaction ahbMasterPacket;

  `uvm_info(get_type_name(), $sformatf("Inside the master_monitor_proxy"), UVM_LOW);
  ahbMasterPacket = AhbMasterTransaction::type_id::create("ahbMasterPacket");

  ahbMasterMonitorBFM.waitForResetn();

  forever begin
    ahbTransferCharStruct structDataPacket;
    ahbTransferConfigStruct  structConfigPacket; 
    AhbMasterTransaction  ahbMasterClonePacket;

    AhbMasterConfigConverter :: fromClass(ahbMasterAgentConfig,  structConfigPacket);
    ahbMasterMonitorBFM.sampleData (structDataPacket,  structConfigPacket);
    $display("&&&&values inside master monitor proxy %p&&&",structDataPacket);
    AhbMasterSequenceItemConverter :: toClass(structDataPacket, ahbMasterPacket);


    $cast(ahbMasterClonePacket, ahbMasterPacket.clone());
    `uvm_info(get_type_name(),$sformatf("Sending packet via analysis_port: , \n %s", ahbMasterClonePacket.sprint()),UVM_HIGH)
    ahbMasterAnalysisPort.write(ahbMasterClonePacket);
  end

endtask : run_phase

`endif
