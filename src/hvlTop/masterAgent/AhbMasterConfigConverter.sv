`ifndef AHBMASTERCONFIGCONVERTER_INCLUDED_
`define AHBMASTERCONFIGCONVERTER_INCLUDED_

class AhbMasterConfigConverter extends uvm_object;
  `uvm_object_utils(AhbMasterConfigConverter)

  extern static function void fromClass(input AhbMasterAgentConfig inputConv, output ahbTransferConfigStruct outputConv);
  extern function void do_print(uvm_printer printer);

endclass : AhbMasterConfigConverter

function AhbMasterConfigConverter::new(string name = "AhbMasterConfigConverter");
  super.new(name);
endfunction : new

  outputConv.haddr = inputConv.haddr;

endfunction : fromClass

function void AhbMasterConfigConverter::do_print(uvm_printer printer);

  ahbTransferConfigStruct ahbStruct;
  super.do_print(printer);

endfunction : do_print

`endif

