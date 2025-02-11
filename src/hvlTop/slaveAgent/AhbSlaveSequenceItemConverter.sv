`ifndef AHBSLAVESEQUENCEITEMCONVERTER_INCLUDED_
`define AHBSLAVESEQUENCEITEMCONVERTER_INCLUDED_

class AhbSlaveSequenceItemConverter extends uvm_object;

  extern function new(string name = "AhbSlaveSequenceItemConverter");
  extern static function void fromClass(input AhbSlaveTransaction inputConv, output ahbTransferCharStruct outputConv);
  extern static function void toClass(input ahbTransferCharStruct inputConv, ref AhbSlaveTransaction outputConv);
  extern function void do_print(uvm_printer printer);

endclass : AhbSlaveSequenceItemConverter

function AhbSlaveSequenceItemConverter::new(string name = "AhbSlaveSequenceItemConverter");
  super.new(name);
endfunction: new

    function void AhbSlaveSequenceItemConverter::fromClass(input AhbSlaveTransaction inputConv, output ahbTransferCharStruct outputConv);

      outputConv.haddr = inputConv.haddr;
      `uvm_info("AhbSlaveSequenceItemConverterClass", $sformatf("After randomizing haddr= %b", outputConv.haddr), UVM_FULL);

       $cast(outputConv.hprot, inputConv.hprot);
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hprot = %b", outputConv.hprot), UVM_FULL);

      $cast(outputConv.hburst, inputConv.hburst);
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hburst = %b", outputConv.hburst), UVM_FULL);

      outputConv.hmastlock = inputConv.hmastlock;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hmastlock = %b", outputConv.hmastlock), UVM_FULL);

      $cast(outputConv.hsize, inputConv.hsize);
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hsize = %b", outputConv.hsize), UVM_FULL);

      outputConv.hnonsec = inputConv.hnonsec;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hnonsec = %b", outputConv.hnonsec), UVM_FULL);

      outputConv.hexcl = inputConv.hexcl;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hexcl = %b", outputConv.hexcl), UVM_FULL);

      $cast(outputConv.hmaster, inputConv.hmaster);
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hmaster = %b", outputConv.hmaster), UVM_FULL);

      $cast(outputConv.htrans, inputConv.htrans);
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing htrans = %b", outputConv.htrans), UVM_FULL);

      outputConv.hwdata = inputConv.hwdata;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hwdata = %0h", outputConv.hwdata), UVM_FULL);

      outputConv.hwstrb = inputConv.hwstrb;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hwstrb = %b", outputConv.hwstrb), UVM_FULL);

      outputConv.hwrite = inputConv.hwrite;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hwrite = %b", outputConv.hwrite), UVM_FULL);

      outputConv.hrdata = inputConv.hrdata;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hrdata = %0h", outputConv.hrdata), UVM_FULL);

      outputConv.hreadyout = inputConv.hreadyout;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hreadyout = %b", outputConv.hreadyout), UVM_FULL);

      $cast(outputConv.hresp, inputConv.hresp);
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hresp = %b", outputConv.hresp), UVM_FULL);
      /*
      output_conv.hexokay = input_conv.hexokay;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformat("After randomizing hexokay = %b", output_conv.hexokay), UVM_FULL);
      */
      outputConv.hready =  inputConv.hready;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hready = %b", outputConv.hready), UVM_FULL);
      
      outputConv.hselx =  inputConv.hselx;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hselx = %b", outputConv.hselx), UVM_FULL);



endfunction : fromClass 

    function void AhbSlaveSequenceItemConverter::toClass(input ahbTransferCharStruct inputConv, ref AhbSlaveTransaction outputConv);

      outputConv.haddr = inputConv.haddr;
      `uvm_info("AhbSlaveSequenceItemConverterClass", $sformatf("After randomizing haddr= %b", outputConv.haddr), UVM_FULL);

    $cast(outputConv.hprot, inputConv.hprot);
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hprot = %b", outputConv.hprot), UVM_FULL);

      $cast(outputConv.hburst, inputConv.hburst);
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hburst = %b", outputConv.hburst), UVM_FULL);

      outputConv.hmastlock = inputConv.hmastlock;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hmastlock = %b", outputConv.hmastlock), UVM_FULL);

      $cast(outputConv.hsize, inputConv.hsize);
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hsize = %b", outputConv.hsize), UVM_FULL);

      outputConv.hnonsec = inputConv.hnonsec;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hnonsec = %b", outputConv.hnonsec), UVM_FULL);

      outputConv.hexcl = inputConv.hexcl;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hexcl = %b", outputConv.hexcl), UVM_FULL);

      $cast(outputConv.hmaster, inputConv.hmaster);
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hmaster = %b", outputConv.hmaster), UVM_FULL);

      $cast(outputConv.htrans, inputConv.htrans);
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing htrans = %b", outputConv.htrans), UVM_FULL);

      outputConv.hwdata = inputConv.hwdata;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hwdata = %0h", outputConv.hwdata), UVM_FULL);

      outputConv.hwstrb = inputConv.hwstrb;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hwstrb = %b", outputConv.hwstrb), UVM_FULL);

      outputConv.hwrite = inputConv.hwrite;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hwrite = %b", outputConv.hwrite), UVM_FULL);

      outputConv.hrdata = inputConv.hrdata;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hrdata = %0h", outputConv.hrdata), UVM_FULL);

      outputConv.hreadyout = inputConv.hreadyout;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hreadyout = %b", outputConv.hreadyout), UVM_FULL);

      $cast(outputConv.hresp, inputConv.hresp);
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hresp = %b", outputConv.hresp), UVM_FULL);
      /*
      output_conv.hexokay = input_conv.hexokay;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformat("After randomizing hexokay = %b", output_conv.hexokay), UVM_FULL);
      */
      outputConv.hready =  inputConv.hready;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hready = %b", outputConv.hready), UVM_FULL);
      
      outputConv.hselx =  inputConv.hselx;
      `uvm_info("ahbSlaveSequeceItemconverterClass", $sformatf("After randomizing hselx = %b", outputConv.hselx), UVM_FULL);


endfunction : toClass

function void AhbSlaveSequenceItemConverter::do_print(uvm_printer printer);
  ahbTransferCharStruct ahbStruct;
  super.do_print(printer);

printer.print_field("hprot", ahbStruct.hprot, $bits(ahbStruct.hprot), UVM_BIN);
printer.print_field("hburst", ahbStruct.hburst, $bits(ahbStruct.hburst), UVM_BIN);
printer.print_field("hmastlock", ahbStruct.hmastlock, $bits(ahbStruct.hmastlock), UVM_BIN);
printer.print_field("hsize", ahbStruct.hsize, $bits(ahbStruct.hsize), UVM_BIN);
printer.print_field("hnonsec", ahbStruct.hnonsec, $bits(ahbStruct.hnonsec), UVM_BIN);
printer.print_field("hexcl", ahbStruct.hexcl, $bits(ahbStruct.hexcl), UVM_BIN);
printer.print_field("hmaster", ahbStruct.hmaster, $bits(ahbStruct.hmaster), UVM_BIN);
printer.print_field("htrans", ahbStruct.htrans, $bits(ahbStruct.htrans), UVM_BIN);
printer.print_field("hwdata", ahbStruct.hwdata, $bits(ahbStruct.hwdata), UVM_HEX);
printer.print_field("hwstrb", ahbStruct.hwstrb, $bits(ahbStruct.hwstrb), UVM_BIN);
printer.print_field("hwrite", ahbStruct.hwrite, $bits(ahbStruct.hwrite), UVM_BIN);
printer.print_field("hrdata", ahbStruct.hrdata, $bits(ahbStruct.hrdata), UVM_HEX);
printer.print_field("hreadyout", ahbStruct.hreadyout, $bits(ahbStruct.hreadyout), UVM_BIN);
printer.print_field("hresp", ahbStruct.hresp, $bits(ahbStruct.hresp), UVM_BIN);
printer.print_field("hexokay", ahbStruct.hexokay, $bits(ahbStruct.hexokay), UVM_BIN);
printer.print_field("hready", ahbStruct.hready, $bits(ahbStruct.hready), UVM_BIN);
printer.print_field("hselx", ahbStruct.hselx, $bits(ahbStruct.hselx), UVM_BIN);

endfunction : do_print


`endif 
