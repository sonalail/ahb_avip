`ifndef AHBMASTERSEQUENCEITEMCONVERTER_INCLUDED_
`define AHBMASTERSEQUENCEITEMCONVERTER_INCLUDED_

class AhbMasterSequenceItemConverter extends uvm_object;

  extern function new(string name = "AhbMasterSequenceItemConverter");
  extern static function void fromClass(input AhbMasterTransaction inputConv, output ahbTransferCharStruct  outputConv);
  extern static function void toClass(input ahbTransferCharStruct  inputConv, ref AhbMasterTransaction outputConv);
  extern function void do_print(uvm_printer printer);

endclass : AhbMasterSequenceItemConverter

function AhbMasterSequenceItemConverter::new(string name = "AhbMasterSequenceItemConverter");
  super.new(name);
endfunction: new

function void AhbMasterSequenceItemConverter::fromClass(input AhbMasterTransaction inputConv, output ahbTransferCharStruct outputConv);
  `uvm_info("AhbMasterSequenceItemConverterClass",$sformatf("-------------------------------------------------------------"),UVM_FULL);


  outputConv.haddr = inputConv.haddr;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing haddr= %b", outputConv.haddr), UVM_FULL);

  $cast(outputConv.hprot, inputConv.hprot);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hprot = %b", outputConv.hprot), UVM_FULL);

  $cast(outputConv.hburst, inputConv.hburst);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hburst = %b", outputConv.hburst), UVM_FULL);

  outputConv.hmastlock = inputConv.hmastlock;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hmastlock = %b", outputConv.hmastlock), UVM_FULL);

  $cast(outputConv.hsize, inputConv.hsize);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hsize = %b", outputConv.hsize), UVM_FULL);

  outputConv.hnonsec = inputConv.hnonsec;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hnonsec = %b", outputConv.hnonsec), UVM_FULL);

  outputConv.hexcl = inputConv.hexcl;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hexcl = %b", outputConv.hexcl), UVM_FULL);

  $cast(outputConv.hmaster, inputConv.hmaster);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hmaster = %b", outputConv.hmaster), UVM_FULL);

  $cast(outputConv.htrans, inputConv.htrans);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing htrans = %b", outputConv.htrans), UVM_FULL);


  outputConv.hselx = inputConv.hselx;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hselx = %0h", outputConv.hselx), UVM_FULL);


  $cast(outputConv.hwrite, inputConv.hwrite);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hwrite = %b", outputConv.hwrite), UVM_FULL);

  outputConv.hreadyout = inputConv.hreadyout;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hreadyout = %b", outputConv.hreadyout), UVM_FULL);

  $cast(outputConv.hresp, inputConv.hresp);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hresp = %b", outputConv.hresp), UVM_FULL);

  outputConv.hexokay = inputConv.hexokay;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hexokay = %b", outputConv.hexokay), UVM_FULL);

  outputConv.hready = inputConv.hready;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hready = %b", outputConv.hready), UVM_FULL);

  outputConv.noOfWaitStates = inputConv.noOfWaitStatesDetected;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf(" noOfWaitStates = %b", outputConv.noOfWaitStates), UVM_FULL);

  outputConv.noOfBusyStates = inputConv.noOfBusyStates;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf(" noOfBusyStates = %b", outputConv.noOfBusyStates), UVM_FULL);


  foreach(inputConv.hwdata[i])begin
    if(inputConv.hwdata[i] != 0)begin
      outputConv.hwdata[i] = inputConv.hwdata[i];
      `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hwdata = %0p", outputConv.hwdata), UVM_FULL);
    end
  end

  foreach(inputConv.hwdata[i])begin
    if(inputConv.hwdata[i] != 0)begin
      outputConv.hwstrb[i] = inputConv.hwstrb[i];
      `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hwstrb = %0p", outputConv.hwstrb), UVM_FULL);
    end
  end

  foreach(inputConv.hrdata[i])begin
    if(inputConv.hrdata[i] != 0)begin
      outputConv.hrdata[i] = inputConv.hrdata[i];
      `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hrdata = %0p", outputConv.hrdata), UVM_FULL);
    end
  end

  foreach(inputConv.busyControl[i])begin

    outputConv.busyControl[i] = inputConv.busyControl[i];
    `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing busyControl = %0p", outputConv.busyControl), UVM_FULL);

  end

  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("-------------------------------------------------------------"), UVM_FULL);

endfunction : fromClass


function void AhbMasterSequenceItemConverter::toClass(input ahbTransferCharStruct inputConv, ref AhbMasterTransaction outputConv);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("-------------------------------------------------------------"), UVM_FULL);

  outputConv.haddr = inputConv.haddr;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing haddr= %b", outputConv.haddr), UVM_FULL);

  $cast(outputConv.hprot, inputConv.hprot);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hprot = %b", outputConv.hprot), UVM_FULL);

  $cast(outputConv.hburst, inputConv.hburst);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hburst = %b", outputConv.hburst), UVM_FULL);

  outputConv.hmastlock = inputConv.hmastlock;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hmastlock = %b", outputConv.hmastlock), UVM_FULL);

  $cast(outputConv.hsize, inputConv.hsize);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hsize = %b", outputConv.hsize), UVM_FULL);

  outputConv.hnonsec = inputConv.hnonsec;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hnonsec = %b", outputConv.hnonsec), UVM_FULL);

  outputConv.hexcl = inputConv.hexcl;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hexcl = %b", outputConv.hexcl), UVM_FULL);

  $cast(outputConv.hmaster, inputConv.hmaster);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hmaster = %b", outputConv.hmaster), UVM_FULL);

  $cast(outputConv.htrans, inputConv.htrans);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing htrans = %b", outputConv.htrans), UVM_FULL);

  outputConv.hselx = inputConv.hselx;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hselx = %0h", outputConv.hselx), UVM_FULL);

  $cast(outputConv.hwrite, inputConv.hwrite);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hwrite = %b", outputConv.hwrite), UVM_FULL);

  outputConv.hreadyout = inputConv.hreadyout;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hreadyout = %b", outputConv.hreadyout), UVM_FULL);

  $cast(outputConv.hresp, inputConv.hresp);
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hresp = %b", outputConv.hresp), UVM_FULL);

  outputConv.hexokay = inputConv.hexokay;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hexokay = %b", outputConv.hexokay), UVM_FULL);

  outputConv.hready = inputConv.hready;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hready = %b", outputConv.hready), UVM_FULL);

  outputConv.noOfWaitStatesDetected = inputConv.noOfWaitStates;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf(" noOfWaitStatesDetected = %b", outputConv.noOfWaitStatesDetected), UVM_FULL);

  outputConv.noOfBusyStates = inputConv.noOfBusyStates;
  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf(" noOfBusyStates = %b", outputConv.noOfBusyStates), UVM_FULL);

  foreach(inputConv.hwdata[i])begin
    if(inputConv.hwdata[i] != 0)begin
      outputConv.hwdata[i] = inputConv.hwdata[i];
      `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hwdata = %0p", outputConv.hwdata), UVM_FULL);
    end
  end

  foreach(inputConv.hwdata[i])begin
    if(inputConv.hwdata[i] != 0)begin
      outputConv.hwstrb[i] = inputConv.hwstrb[i];
      `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hwstrb = %0p", outputConv.hwstrb), UVM_FULL);
    end
  end

  foreach(inputConv.hrdata[i])begin
    if(inputConv.hrdata[i] != 0)begin
      outputConv.hrdata[i] = inputConv.hrdata[i];
      `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing hrdata = %0p", outputConv.hrdata), UVM_FULL);
    end
  end

  foreach(inputConv.busyControl[i])begin

    outputConv.busyControl[i] = inputConv.busyControl[i];
    `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("After randomizing busyControl = %0p", outputConv.busyControl), UVM_FULL);

  end  

  `uvm_info("AhbMasterSequenceItemConverterClass", $sformatf("-------------------------------------------------------------"), UVM_FULL);

endfunction : toClass

function void AhbMasterSequenceItemConverter::do_print(uvm_printer printer);
  ahbTransferCharStruct ahbStruct;
  super.do_print(printer);

  printer.print_field("hprot", ahbStruct.hprot, $bits(ahbStruct.hprot), UVM_BIN);
  printer.print_field("hburst", ahbStruct.hburst, $bits(ahbStruct.hburst), UVM_BIN);
  printer.print_field("hmastlock", ahbStruct.hmastlock, $bits(ahbStruct.hmastlock), UVM_BIN);
  printer.print_field("hsize", ahbStruct.hsize, $bits(ahbStruct.hsize), UVM_BIN);
  printer.print_field("hnonsec", ahbStruct.hnonsec, $bits(ahbStruct.hnonsec), UVM_BIN);
  printer.print_field("hexcl", ahbStruct.hexcl, $bits(ahbStruct.hexcl), UVM_BIN);
  printer.print_field("hmaster", ahbStruct.hmaster, $bits(ahbStruct.hmaster), UVM_BIN);
  printer.print_field("hselx", ahbStruct.hselx, $bits(ahbStruct.hselx), UVM_BIN);
  printer.print_field("htrans", ahbStruct.htrans, $bits(ahbStruct.htrans), UVM_BIN);
  printer.print_field("hwrite", ahbStruct.hwrite, $bits(ahbStruct.hwrite), UVM_BIN);
  printer.print_field("hreadyout", ahbStruct.hreadyout, $bits(ahbStruct.hreadyout), UVM_BIN);
  printer.print_field("hresp", ahbStruct.hresp, $bits(ahbStruct.hresp), UVM_BIN);
  printer.print_field("hexokay", ahbStruct.hexokay, $bits(ahbStruct.hexokay), UVM_BIN);
  printer.print_field("hready", ahbStruct.hready, $bits(ahbStruct.hready), UVM_BIN);
  printer.print_field("noOfWaitStates",ahbStruct.noOfWaitStates,$bits(ahbStruct.noOfWaitStates),UVM_BIN);

  foreach(ahbStruct.hwdata[i])begin
    printer.print_field  ($sformatf("hwdata[%0d]",i), ahbStruct.hwdata[i], $bits(ahbStruct.hwdata[i]), UVM_HEX);
  end

  foreach(ahbStruct.hwstrb[i])begin
    printer.print_field  ($sformatf("hwstrb[%0d]",i),ahbStruct.hwstrb[i], $bits(ahbStruct.hwstrb[i]), UVM_BIN);
  end

  foreach(ahbStruct.hrdata[i])begin
    printer.print_field  ($sformatf("hrdata[%0d]",i), ahbStruct.hrdata[i], $bits(ahbStruct.hrdata[i]), UVM_HEX);
  end
endfunction : do_print  

`endif
