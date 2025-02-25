`ifndef AHBMASTERCOVERAGE_INCLUDED_
`define AHBMASTERCOVERAGE_INCLUDED_

class AhbMasterCoverage extends uvm_subscriber #(AhbMasterTransaction);
  `uvm_component_utils(AhbMasterCoverage)

  AhbMasterAgentConfig ahbMasterAgentConfig;

  covergroup ahbMasterCovergroup with function sample (AhbMasterAgentConfig ahbMasterAgentConfig, AhbMasterTransaction ahbMasterTransaction);
    
  option.per_instance = 1;
    
 HADDR_CP: coverpoint ahbMasterTransaction.haddr {
  option.comment = "AHB Address Coverage";
bins ahbAddrModeOf4  = { [0:'hFFFFFFFF] } with (item % 4 == 0);
  bins ahbAddrModeOf8   = { [0:'hFFFFFFFF] } with (item % 8 == 0);
  bins ahbAddrModeOf16  = { [0:'hFFFFFFFF] } with (item % 16 == 0);
  bins ahbAddrModeOf32  = { [0:'hFFFFFFFF] } with (item % 32 == 0);
  bins ahbAddrModeOf64  = { [0:'hFFFFFFFF] } with (item % 64 == 0);
  bins ahbAddrModeOf128 = { [0:'hFFFFFFFF] } with (item % 128 == 0);
  bins ahbAddrModeOf256 = { [0:'hFFFFFFFF] } with (item % 256 == 0);
  
  bins ahbAddrAllZeroes      = {32'h00000000};         
  bins ahbAddrAllOnes        = {32'hFFFFFFFF};      
  bins ahbAddrAltBits1010    = {32'hAAAAAAAA};         
  bins ahbAddrAltBits0101    = {32'h55555555};         
  
 
 // bins ahbAddrToggle     = (ahbMasterTransaction.haddr dist {0:=10, [1:'hFFFFFFFF]:=90}); 
 
  bins ahbAddrMinimum    = {32'h00000000};         
  bins ahbAddrMaximum    = {32'hFFFFFFFF};         
  
  bins ahbAddrSequential[] = { [0:'hFFFFFFF0] } with (item%1==0);  
  

  bins ahbAddrBurst4[]         = {[0:'hFFFFFFFF]} with (item%16==0); 
  bins ahbAddrBurst8[]         = {[0:'hFFFFFFFF]} with (item%32==0); 
  bins ahbAddrBurst16[]        = {[0:'hFFFFFFFF]} with (item%64==0); 

  
  bins ahbAddrDefault        = default;
}


    HWRITE_CP:coverpoint ahbMasterTransaction.hwrite{
      option.comment = " ahb write";
      bins ahbWrite0 ={0};
      bins ahbWrite1 ={1};
    }

     HSIZE_CP:coverpoint ahbMasterTransaction.hsize{
      option.comment = " ahb size";
       bins ahbSize1Byte   ={0};
       bins ahbSize2Bytes  ={1};
       bins ahbSize4Bytes  ={2};
       bins ahbSize8Bytes  ={3};
       bins ahbSize16Bytes ={4};
       bins ahbSize32Bytes ={5};
       illegal_bins illegalBinsOfAhbsize64Bytes =  {6};  
       illegal_bins illegalBinsOfAhbsize128Bytes = {7}; 
    }

      HBURST_CP:coverpoint ahbMasterTransaction.hburst{
      option.comment = " ahb burst";
        bins ahbBurst0={0};
        bins ahbBurst1={1};
        bins ahbBurst2={2};
        bins ahbBurst3={3};
        bins ahbBurst4={4};
        bins ahbBurst5={5};
        bins ahbBurst6={6};
        bins ahbBurst7={7};
                       
    }

      HTRANS_CP:coverpoint ahbMasterTransaction.htrans{
      option.comment = " ahb trans";
        bins ahbTransIdle          ={0};
        bins ahbTransBusy          ={1};
        bins ahbTransNonsequential ={2};
        bins ahbTransSequential    ={3};
    }

/*      HWDATA_CP:coverpoint ahbMasterTransaction.hwdata{
      option.comment = " ahb wdata";
        bins ahbWdata1      ={0};
        bins ahbWdata2      ={1};
        bins ahbWdata4      ={3};
        bins ahbWdata8      ={7};
        bins ahbWdata16		={15};
        bins ahbWdata32		={31};
        bins ahbWdata64		={63};
        bins ahbWdata128	={127};
        bins ahbWdata256	={255};
        bins ahbWdataDefault=default;
    }*/

     HPROT_CP:coverpoint ahbMasterTransaction.hprot{
      option.comment = " ahb prot";
       bins ahbProt0={0};
       bins ahbProt1={1};
       bins ahbProt2={2};
    }

    HMASTLOCK_CP:coverpoint ahbMasterTransaction.hmastlock{
      option.comment = " ahb mastlock";
      bins ahbMastlock0={0};
      bins ahbMastlock1={1};
    }

   /*  HWSTRB_CP:coverpoint ahbMasterTransaction.hwstrb{
      option.comment = " ahb strb";
       bins ahbStrbSingleBit   = {4'b0001, 4'b0010, 4'b0100, 4'b1000};
       bins ahbStrbDoubleBits  = {4'b0011, 4'b0110, 4'b1100, 4'b1001, 4'b0101, 4'b1010};
       bins ahbStrbThreeBits   = {4'b0111, 4'b1110, 4'b1101, 4'b1011};
       bins ahbStrbAllZeroes   = {4'b0000};
       bins ahbStrbAllOnes     = {4'b1111};
    }*/
    
     HNONSEC_CP:coverpoint ahbMasterTransaction.hnonsec{
      option.comment = " ahb nonsec";
       bins ahbNonsec0={0};
       bins ahbNonsec1={1};
    }
 
      HEXCL_CP:coverpoint ahbMasterTransaction.hexcl{
      option.comment = " ahb excl";
        bins ahbExcl0={0};
        bins ahbExcl1={1};
    }
    
     //HWDATA_CP_x_HADDR_CP:cross  HWDATA_CP ,HADDR_CP;
     HSIZE_CP_x_HBURST_CP:cross  HSIZE_CP ,HBURST_CP;
     //HWSTRB_CP_x_HWDATA_CP:cross  HWSTRB_CP ,HWDATA_CP; 
     //HTRANS_CP_x_HWDATA_CP:cross  HTRANS_CP ,HWDATA_CP;
    
  endgroup: ahbMasterCovergroup

  extern function new(string name = "AhbMasterCoverage", uvm_component parent = null);
  extern function void write(AhbMasterTransaction t);
  extern virtual function void report_phase(uvm_phase phase);

endclass : AhbMasterCoverage

function  AhbMasterCoverage::new(string name = "AhbMasterCoverage", uvm_component parent = null);
  super.new(name, parent);
  ahbMasterCovergroup = new();
endfunction : new

function void AhbMasterCoverage::write(AhbMasterTransaction t);
    `uvm_info(get_type_name(),$sformatf("Before calling SAMPLE METHOD"),UVM_HIGH);
  ahbMasterCovergroup.sample(ahbMasterAgentConfig,t);
  `uvm_info(get_type_name(),"After calling SAMPLE METHOD",UVM_HIGH);

endfunction : write

function void AhbMasterCoverage::report_phase(uvm_phase phase);
  `uvm_info(get_type_name(), $sformatf("Entered the report_phase of AHB Master Coverage"), UVM_NONE);
  `uvm_info(get_type_name(), $sformatf("AHB Master Agent Coverage = %0.2f %%", ahbMasterCovergroup.get_coverage()), UVM_NONE);
endfunction: report_phase

`endif

