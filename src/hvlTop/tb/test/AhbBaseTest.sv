`ifndef AHBBASETEST_INCLUDED_
`define AHBBASETEST_INCLUDED_

class AhbBaseTest extends uvm_test;
  `uvm_component_utils(AhbBaseTest)
  
  AhbEnvironment ahbEnvironment;

  AhbEnvironmentConfig ahbEnvironmentConfig;

  extern function new(string name = "AhbBaseTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setupAhbEnvironmentConfig();
  extern virtual function void setupAhbMasterAgentConfig();
  extern virtual function void setupAhbSlaveAgentConfig();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : AhbBaseTest

function AhbBaseTest::new(string name = "AhbBaseTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void AhbBaseTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  setupAhbEnvironmentConfig();
  ahbEnvironment = AhbEnvironment::type_id::create("ahbEnvironment",this);
endfunction : build_phase

function void AhbBaseTest::setupAhbEnvironmentConfig();
  ahbEnvironmentConfig = AhbEnvironmentConfig::type_id::create("ahbEnvironmentConfig");
  ahbEnvironmentConfig.noOfSlaves      = NO_OF_SLAVES;
  ahbEnvironmentConfig.noOfMasters     = NO_OF_MASTERS;
  ahbEnvironmentConfig.hasScoreboard    = 1;
  ahbEnvironmentConfig.hasVirtualSequencer  = 1;
  

  
  ahbEnvironmentConfig.ahbMasterAgentConfig = new[ahbEnvironmentConfig.noOfMasters];
  foreach(ahbEnvironmentConfig.ahbMasterAgentConfig[i]) begin
    ahbEnvironmentConfig.ahbMasterAgentConfig[i] = AhbMasterAgentConfig::type_id::create($sformatf("AhbMasterAgentConfig[%0d]",i));
  end
  setupAhbMasterAgentConfig();

  foreach(ahbEnvironmentConfig.ahbMasterAgentConfig[i]) begin
   uvm_config_db #(AhbMasterAgentConfig)::set(this,"*",$sformatf("AhbMasterAgentConfig[%0d]",i),ahbEnvironmentConfig.ahbMasterAgentConfig[i]);
  `uvm_info(get_type_name(),$sformatf("\nAHB_MASTER_CONFIG[%0d]\n%s",i,ahbEnvironmentConfig.ahbMasterAgentConfig[i].sprint()),UVM_LOW);
  end

  ahbEnvironmentConfig.ahbSlaveAgentConfig = new[ahbEnvironmentConfig.noOfSlaves];
  foreach(ahbEnvironmentConfig.ahbSlaveAgentConfig[i]) begin
    ahbEnvironmentConfig.ahbSlaveAgentConfig[i] = AhbSlaveAgentConfig::type_id::create($sformatf("AhbSlaveAgentConfig[%0d]",i));
  end

  setupAhbSlaveAgentConfig();
 
  foreach(ahbEnvironmentConfig.ahbSlaveAgentConfig[i]) begin
    uvm_config_db #(AhbSlaveAgentConfig)::set(this,"*",$sformatf("AhbSlaveAgentConfig[%0d]",i),ahbEnvironmentConfig.ahbSlaveAgentConfig[i]);
    `uvm_info(get_type_name(),$sformatf("\nAHB_SLAVE_CONFIG[%0d]\n%s",i,ahbEnvironmentConfig.ahbSlaveAgentConfig[i].sprint()),UVM_LOW);
  end

  uvm_config_db#(AhbEnvironmentConfig)::set(this,"*","AhbEnvironmentConfig",ahbEnvironmentConfig);
  `uvm_info(get_type_name(),$sformatf("\nAHB_ENV_CONFIG\n%s",ahbEnvironmentConfig.sprint()),UVM_LOW);

endfunction : setupAhbEnvironmentConfig

function void AhbBaseTest::setupAhbMasterAgentConfig();
  
  foreach(ahbEnvironmentConfig.ahbMasterAgentConfig[i]) begin
    if(MASTER_AGENT_ACTIVE === 1) begin
      ahbEnvironmentConfig.ahbMasterAgentConfig[i].is_active = uvm_active_passive_enum'(UVM_ACTIVE);
    end
    else begin
      ahbEnvironmentConfig.ahbMasterAgentConfig[i].is_active = uvm_active_passive_enum'(UVM_PASSIVE);
    end
    ahbEnvironmentConfig.ahbMasterAgentConfig[i].hasCoverage = 1; 
  end

endfunction : setupAhbMasterAgentConfig

function void AhbBaseTest::setupAhbSlaveAgentConfig();
  
  foreach(ahbEnvironmentConfig.ahbSlaveAgentConfig[i]) begin
    if(SLAVE_AGENT_ACTIVE === 1) begin
      ahbEnvironmentConfig.ahbSlaveAgentConfig[i].is_active = uvm_active_passive_enum'(UVM_ACTIVE);
    end
    else begin
      ahbEnvironmentConfig.ahbSlaveAgentConfig[i].is_active = uvm_active_passive_enum'(UVM_PASSIVE);
    end
    ahbEnvironmentConfig.ahbSlaveAgentConfig[i].hasCoverage = 1; 
  end

endfunction : setupAhbSlaveAgentConfig

function void AhbBaseTest::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this,30ns);
endfunction  : end_of_elaboration_phase

task AhbBaseTest::run_phase(uvm_phase phase);
  `uvm_info(get_type_name(),$sformatf("Inside run phase of test"),UVM_LOW);
  phase.raise_objection(this);
  super.run_phase(phase);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

