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
  
//  `uvm_info("Ahb Sequence Item Converter fromClass",$sformatf("--\n----------------------------------------SLAVE_CFG_CONVERTER_FROM_CLASS--------------------------------------"),UVM_HIGH);
  
  outputConv.minimumAddress = inputConv.minimumAddress; 

  outputConv.maximumAddress = inputConv.maximumAddress; 
  outputConv.noOfWaitStates = inputConv.noOfWaitStates;

  //output_conv_h.slave_id = input_conv_h.slave_id;
  
  
//  `uvm_info("Ahb Slave Config Converter","--\n------------------------------------------------------------EOP---------------------------------------------------- ",UVM_HIGH);

endfunction : fromClass

function void AhbSlaveConfigConverter::do_print(uvm_printer printer);
  
  ahbTransferConfigStruct ahbStruct;
  super.do_print(printer);
 
 // printer.print_field( "minimumAddress", ahbStruct.minimumAddress, $bits(ahbStruct.minimumAddress),UVM_HEX);
 // printer.print_field( "maximumAddress", ahbStruct.maximumAddress, $bits(ahbStruct.maximumAddress),UVM_HEX);
  
endfunction : do_print

`endif

