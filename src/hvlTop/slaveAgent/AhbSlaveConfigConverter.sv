`ifndef AHBSLAVECONFIGCONVERTER_INCLUDED_
`define AHBSLAVECONFIGCONVERTER_INCLUDED_

class AhbSlaveConfigConverter extends uvm_object;
  `uvm_object_utils(AhbSlaveConfigConverter)

  extern function new(string name = "AhbSlaveConfigConverter");
   extern static function void fromClass(input AhbSlaveAgentConfig inputConv, output ahbTransferConfigStruct outputConv);
  extern function void do_print(uvm_printer printer);

endclass : AhbSlaveConfigConverter

function AhbSlaveConfigConverter::new(string name = "AhbSlaveConfigConverter");
  super.new(name);
endfunction : new

function void AhbSlaveConfigConverter::fromClass(input AhbSlaveAgentConfig inputConv, 
                                                     output ahbTransferConfigStruct outputConv);

  outputConv.minimumAddress = inputConv.minimumAddress; 
  outputConv.maximumAddress = inputConv.maximumAddress; 
  outputConv.noOfWaitStates = inputConv.noOfWaitStates;

endfunction : fromClass

function void AhbSlaveConfigConverter::do_print(uvm_printer printer);

  ahbTransferConfigStruct ahbStruct;
  super.do_print(printer);

endfunction : do_print

`endif

