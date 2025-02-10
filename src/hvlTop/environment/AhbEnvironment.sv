`ifndef AHBENVIRONMENT_INCLUDED_
`define AHBENVIRONMENT_INCLUDED_

class AhbEnvironment extends uvm_env;
  `uvm_component_utils(AhbEnvironment)

  AhbMasterAgent ahbMasterAgent[];

  AhbSlaveAgent  ahbSlaveAgent[];

  AhbScoreboard ahbScoreboard;

  AhbVirtualSequencer ahbVirtualSequencer;
  
  AhbEnvironmentConfig ahbEnvironmentConfig;  

  AhbMasterAgentConfig ahbMasterAgentConfig[];

  AhbSlaveAgentConfig ahbSlaveAgentConfig[];
  extern function new(string name = "AhbEnvironment", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : AhbEnvironment

function AhbEnvironment::new(string name = "AhbEnvironment",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void AhbEnvironment::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db #(AhbEnvironmentConfig)::get(this,"","AhbEnvironmentConfig",ahbEnvironmentConfig)) begin
   `uvm_fatal("FATAL_ENV_CONFIG", $sformatf("Couldn't get the ahbEnvironmentConfig from config_db"))
  end

  ahbMasterAgentConfig = new[ahbEnvironmentConfig.noOfMasters];
  foreach(ahbMasterAgentConfig[i])
  begin
	if(!uvm_config_db #(AhbMasterAgentConfig)::get(this,"",$sformatf("AhbMasterAgentConfig[%0d]",i),ahbMasterAgentConfig[i])) begin
       `uvm_fatal("FATAL_MA_AGENT_CONFIG", $sformatf("Couldn't get the ahbMasterAgentConfig from config_db"))
     end
  end

  ahbMasterAgent = new[ahbEnvironmentConfig.noOfMasters];
  foreach(ahbMasterAgent[i]) begin
    ahbMasterAgent[i] = AhbMasterAgent::type_id::create($sformatf("ahbMasterAgent[%0d]",i),this);
  end

  ahbSlaveAgentConfig = new[ahbEnvironmentConfig.noOfSlaves];
  foreach(ahbSlaveAgentConfig[i]) begin
 	if(!uvm_config_db #(AhbSlaveAgentConfig)::get(this,"",$sformatf("AhbSlaveAgentConfig[%0d]",i), ahbSlaveAgentConfig[i])) begin
       `uvm_fatal("FATAL_MA_CANNOT_GET_AHB_SLAVE_AGENT_CONFIG", "cannot get ahbSlaveAgentConfig from uvm_config_db");
      end
 end

  ahbSlaveAgent = new[ahbEnvironmentConfig.noOfSlaves];
  foreach(ahbSlaveAgent[i]) begin
    ahbSlaveAgent[i] = AhbSlaveAgent::type_id::create($sformatf("ahbSlaveAgent[%0d]",i),this);
  end

  if(ahbEnvironmentConfig.hasVirtualSequencer) begin
    ahbVirtualSequencer = AhbVirtualSequencer::type_id::create("ahbVirtualSequencer",this);
  end

  if(ahbEnvironmentConfig.hasScoreboard) begin
    ahbScoreboard = AhbScoreboard::type_id::create("ahbScoreboard",this);
  end

  foreach(ahbMasterAgent[i]) begin
    ahbMasterAgent[i].ahbMasterAgentConfig=ahbMasterAgentConfig[i];
  end
  
  foreach(ahbSlaveAgent[i]) begin  
    ahbSlaveAgent[i].ahbSlaveAgentConfig=ahbSlaveAgentConfig[i];
  end

endfunction : build_phase

function void AhbEnvironment::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if(ahbEnvironmentConfig.hasVirtualSequencer) begin
    foreach(ahbMasterAgent[i]) begin
      ahbVirtualSequencer.ahbMasterSequencer = ahbMasterAgent[i].ahbMasterSequencer;
    end
    foreach(ahbSlaveAgent[i]) begin
      ahbVirtualSequencer.ahbSlaveSequencer = ahbSlaveAgent[i].ahbSlaveSequencer;
    end
  end
  
  foreach(ahbMasterAgent[i]) begin
    ahbMasterAgent[i].ahbMasterMonitorProxy.ahbMasterAnalysisPort.connect(ahbScoreboard.ahbMasterAnalysisFifo[i].analysis_export);
  end

  foreach(ahbSlaveAgent[i]) begin
    ahbSlaveAgent[i].ahbSlaveMonitorProxy.ahbSlaveAnalysisPort.connect(ahbScoreboard.ahbSlaveAnalysisFifo[i].analysis_export);
  end
  
endfunction : connect_phase

`endif
