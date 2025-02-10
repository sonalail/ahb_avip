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
  //`uvm_info("Ahb_slave_config_converter",$sformatf("After randomizing the minimumAddress = %0h",outputConv.minimumAddress),UVM_HIGH);

  outputConv.maximumAddress = inputConv.maximumAddress; 
  //`uvm_info("Ahb_slave_config_converter",$sformatf("After randomizing the maximumAddress = %0h",outputConv.maximumAddress),UVM_HIGH);

  //output_conv_h.slave_id = input_conv_h.slave_id;
  //`uvm_info("AhbSlaveConfigConverter",$sformatf("After randomizing the slave_id = %0h",output_conv_h.slave_id),UVM_HIGH);
  
  
endfunction : fromClass

function void AhbSlaveConfigConverter::do_print(uvm_printer printer);
  
  ahbTransferConfigStruct ahbStruct;
  super.do_print(printer);
 
 // printer.print_field( "minimumAddress", ahbStruct.minimumAddress, $bits(ahbStruct.minimumAddress),UVM_HEX);
 // printer.print_field( "maximumAddress", ahbStruct.maximumAddress, $bits(ahbStruct.maximumAddress),UVM_HEX);
  
endfunction : do_print

`endif

