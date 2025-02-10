`ifndef AHBMASTERAGENT_INCLUDED_
`define AHBMASTERAGENT_INCLUDED_

class AhbMasterAgent extends uvm_agent;
  `uvm_component_utils(AhbMasterAgent)

  AhbMasterAgentConfig ahbMasterAgentConfig;

  AhbMasterSequencer ahbMasterSequencer;
  
  AhbMasterDriverProxy ahbMasterDriverProxy;

  AhbMasterMonitorProxy ahbMasterMonitorProxy;

  AhbMasterCoverage ahbMasterCoverage;
    
  extern function new(string name = "AhbMasterAgent", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
 
    
endclass :AhbMasterAgent

function AhbMasterAgent::new(string name = "AhbMasterAgent",uvm_component parent = null);
  super.new(name, parent);
endfunction : new
    
function void AhbMasterAgent::build_phase(uvm_phase phase);
  super.build_phase(phase);
   if(ahbMasterAgentConfig.is_active == UVM_ACTIVE) begin
        ahbMasterSequencer = AhbMasterSequencer::type_id::create("ahbMasterSequencer",this);
        ahbMasterDriverProxy = AhbMasterDriverProxy::type_id::create("ahbMasterDriverProxy",this);
  end
  
  ahbMasterMonitorProxy = AhbMasterMonitorProxy::type_id::create("ahbMasterMonitorProxy",this);

   if(ahbMasterAgentConfig.hasCoverage) begin
    ahbMasterCoverage = AhbMasterCoverage::type_id::create("ahbMasterCoverage",this);
  end

  
endfunction : build_phase

function void AhbMasterAgent::connect_phase(uvm_phase phase);
  if(ahbMasterAgentConfig.is_active == UVM_ACTIVE) begin
    ahbMasterDriverProxy.ahbMasterAgentConfig = ahbMasterAgentConfig;
    ahbMasterSequencer.ahbMasterAgentConfig = ahbMasterAgentConfig;
    ahbMasterDriverProxy.seq_item_port.connect(ahbMasterSequencer.seq_item_export);
  end
    ahbMasterMonitorProxy.ahbMasterAgentConfig = ahbMasterAgentConfig;
    ahbMasterMonitorProxy.ahbMasterAgentConfig = ahbMasterAgentConfig;

  if(ahbMasterAgentConfig.hasCoverage) begin
    ahbMasterCoverage.ahbMasterAgentConfig = ahbMasterAgentConfig;
    ahbMasterMonitorProxy.ahbMasterAnalysisPort.connect(ahbMasterCoverage.analysis_export);
  end

endfunction : connect_phase

`endif
