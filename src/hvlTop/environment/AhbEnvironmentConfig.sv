`ifndef AHBENVIRONMENTCONFIG_INCLUDED_
`define AHBENVIRONMENTCONFIG_INCLUDED_

class AhbEnvironmentConfig extends uvm_object;
  `uvm_object_utils(AhbEnvironmentConfig)
  
  bit hasScoreboard = 1;

  bit hasVirtualSequencer = 1;

  int noOfMasters=1;

  int noOfSlaves=1;

  AhbMasterAgentConfig ahbMasterAgentConfig[];

  AhbSlaveAgentConfig ahbSlaveAgentConfig[];

  extern function new(string name = "AhbEnvironmentConfig");
  extern function void do_print(uvm_printer printer);

endclass : AhbEnvironmentConfig

function  AhbEnvironmentConfig::new(string name = "AhbEnvironmentConfig");
  super.new(name);
endfunction : new

function void AhbEnvironmentConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  
  printer.print_field ("hasScoreboard", hasScoreboard, $bits(hasScoreboard), UVM_DEC);
  printer.print_field ("hasVirtualSequencer", hasVirtualSequencer, $bits(hasVirtualSequencer), UVM_DEC);
  printer.print_field ("noOfMasters",  noOfMasters,  $bits(noOfMasters), UVM_DEC);
  printer.print_field ("noOfSlaves",  noOfSlaves,  $bits(noOfSlaves), UVM_DEC);

endfunction : do_print

`endif
