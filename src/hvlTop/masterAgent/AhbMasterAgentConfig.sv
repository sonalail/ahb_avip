`ifndef AHBMASTERAGENTCONFIG_INCLUDED_
`define AHBMASTERAGENTCONFIG_INCLUDED_

class AhbMasterAgentConfig extends uvm_object;
  `uvm_object_utils(AhbMasterAgentConfig)

  uvm_active_passive_enum is_active = UVM_ACTIVE;  

  bit hasCoverage;

  bit [ADDR_WIDTH-1:0]haddr;

  bit [MEMORY_WIDTH-1:0]masterMemory[(SLAVE_MEMORY_SIZE+SLAVE_MEMORY_GAP)*NO_OF_SLAVES:0];

  bit [ADDR_WIDTH-1:0]masterMinimumAddressRangeArray[int];

  bit [ADDR_WIDTH-1:0]masterMaximumAddressRangeArray[int];

  int noOfWaitStates;

  extern function new(string name = "AhbMasterAgentConfig");
  extern function void do_print(uvm_printer printer);
  extern function void masterMinimumAddressRange(int slaveNumber, bit [ADDR_WIDTH-1:0]slaveMinimumAddressRange);
  extern function void masterMaximumAddressRange(int slaveNumber, bit [ADDR_WIDTH-1:0]slaveMaximumAddressRange);

endclass : AhbMasterAgentConfig

function AhbMasterAgentConfig::new(string name = "AhbMasterAgentConfig");
  super.new(name);
endfunction : new

function void AhbMasterAgentConfig::do_print(uvm_printer printer);
  super.do_print(printer);

  printer.print_field ("is_active",    is_active,  $bits(is_active), UVM_DEC);
  printer.print_field ("hasCoverage", hasCoverage, $bits(hasCoverage), UVM_DEC);

  foreach(masterMaximumAddressRangeArray[i]) begin
    printer.print_field($sformatf("masterMinimumAddressRangeArray[%0d]",i),masterMinimumAddressRangeArray[i],
                        $bits(masterMinimumAddressRangeArray[i]),UVM_HEX);
    printer.print_field($sformatf("masterMaximumAddressRangeArray[%0d]",i),masterMaximumAddressRangeArray[i],
                        $bits(masterMaximumAddressRangeArray[i]),UVM_HEX);
  end

endfunction : do_print

function void AhbMasterAgentConfig::masterMaximumAddressRange(int slaveNumber, bit [ADDR_WIDTH-1:0]slaveMaximumAddressRange);
  masterMaximumAddressRangeArray[slaveNumber] = slaveMaximumAddressRange;
endfunction : masterMaximumAddressRange

function void AhbMasterAgentConfig::masterMinimumAddressRange(int slaveNumber, bit [ADDR_WIDTH-1:0]slaveMinimumAddressRange);
  masterMinimumAddressRangeArray[slaveNumber] = slaveMinimumAddressRange;
endfunction : masterMinimumAddressRange

`endif

