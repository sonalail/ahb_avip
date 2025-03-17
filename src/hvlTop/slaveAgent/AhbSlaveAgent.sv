`ifndef AHBSLAVEAGENT_INCLUDED_
`define AHBSLAVEAGENT_INCLUDED_

class AhbSlaveAgent extends uvm_agent;
  `uvm_component_utils( AhbSlaveAgent)

  AhbSlaveAgentConfig ahbSlaveAgentConfig;
  
  AhbSlaveSequencer ahbSlaveSequencer;
 
  AhbSlaveDriverProxy ahbSlaveDriverProxy;

  AhbSlaveMonitorProxy ahbSlaveMonitorProxy;

  AhbSlaveCoverage ahbSlaveCoverage;
  
  extern function new(string name = "AhbSlaveAgent", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
endclass :AhbSlaveAgent

function AhbSlaveAgent::new(string name = "AhbSlaveAgent",uvm_component parent = null);
  super.new(name, parent);
endfunction : new
    
function void AhbSlaveAgent::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(ahbSlaveAgentConfig.is_active == UVM_ACTIVE) begin
    ahbSlaveSequencer = AhbSlaveSequencer::type_id::create("ahbSlaveSequencer",this);
    ahbSlaveDriverProxy = AhbSlaveDriverProxy::type_id::create("ahbSlaveDriverProxy",this);
  end
  
  ahbSlaveMonitorProxy = AhbSlaveMonitorProxy::type_id::create("ahbSlaveMonitorProxy",this);

  if(ahbSlaveAgentConfig.hasCoverage) begin
    ahbSlaveCoverage = AhbSlaveCoverage::type_id::create("ahbSlaveCoverage",this);
  end
  
endfunction : build_phase
    
function void AhbSlaveAgent::connect_phase(uvm_phase phase);
      
 if(ahbSlaveAgentConfig.is_active == UVM_ACTIVE) begin
   ahbSlaveDriverProxy.ahbSlaveAgentConfig = ahbSlaveAgentConfig;
   ahbSlaveSequencer.ahbSlaveAgentConfig = ahbSlaveAgentConfig;
   ahbSlaveDriverProxy.seq_item_port.connect(ahbSlaveSequencer.seq_item_export);
 end
      
 ahbSlaveMonitorProxy.ahbSlaveAgentConfig = ahbSlaveAgentConfig;
 ahbSlaveMonitorProxy.ahbSlaveAgentConfig = ahbSlaveAgentConfig;

 if(ahbSlaveAgentConfig.hasCoverage) begin
   ahbSlaveCoverage.ahbSlaveAgentConfig = ahbSlaveAgentConfig;
   ahbSlaveMonitorProxy.ahbSlaveAnalysisPort.connect(ahbSlaveCoverage.analysis_export);
 end
  
endfunction : connect_phase

`endif
