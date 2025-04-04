`ifndef AHBMASTERCOVERAGE_INCLUDED_
`define AHBMASTERCOVERAGE_INCLUDED_

class AhbMasterCoverage extends uvm_subscriber #(AhbMasterTransaction);
  `uvm_component_utils(AhbMasterCoverage)

  AhbMasterAgentConfig ahbMasterAgentConfig;

  covergroup ahbMasterCovergroup with function sample (AhbMasterAgentConfig ahbMasterAgentConfig, AhbMasterTransaction ahbMasterTransaction);

    option.per_instance = 1;

    HADDR_CP: coverpoint ahbMasterTransaction.haddr {
      option.comment = "AHB Address Coverage";
      bins ahbAddrByteAligned  = { [0:'hFFFFFFFF] } ;
      bins ahbAddrHalfWordAligned   = { [0:'hFFFFFFFF] } iff(ahbMasterTransaction.haddr[0]==0);
      bins ahbAddrWordAligned   = { [0:'hFFFFFFFF] } iff(ahbMasterTransaction.haddr[1:0]==2'b00);
      bins ahbAddrAllZeroes      = {32'h00000000};         
      bins ahbAddrDefault        = default;
    }

    HWRITE_CP:coverpoint ahbMasterTransaction.hwrite{
      option.comment = " ahb write";
      bins ahbRead ={0};
      bins ahbWrite ={1};
    }

    HSIZE_CP:coverpoint ahbMasterTransaction.hsize{
      option.comment = " ahb size";
      bins ahbByte   ={BYTE};
      bins ahbHalfWord  ={HALFWORD};
      bins ahbWord  ={WORD};
      illegal_bins illegalBinsOfAhbsize64Bytes =  {6};  
      illegal_bins illegalBinsOfAhbsize128Bytes = {7}; 
    }

    HBURST_CP:coverpoint ahbMasterTransaction.hburst{
      option.comment = " ahb burst";
      bins ahbSingle={SINGLE};
      //bins ahbIncr={INCR};
      bins ahbWrap4={WRAP4};
      bins ahbIncr4={INCR4};
      bins ahbWrap8={WRAP8};
      bins ahbIncr8={INCR8};
      bins ahbWrap16={WRAP16};
      bins ahbIncr16={INCR16};
    }

    HTRANS_CP:coverpoint ahbMasterTransaction.htrans{
      option.comment = " ahb trans";
      bins ahbTransIdle          ={IDLE};
      bins ahbTransBusy          ={BUSY};
      bins ahbTransNonsequential ={NONSEQ};
      bins ahbTransSequential    ={SEQ};
    }
   
  HTRANS_TRANSITION_CP: coverpoint ahbMasterTransaction.htrans {
    option.comment = "AHB HTRANS state transitions";
    bins BusyToSeq   = (BUSY => SEQ);
    bins SeqToBusy   = (SEQ => BUSY);
    bins NonSeqToSeq = (NONSEQ => SEQ);
    bins SeqToIdle = (SEQ => IDLE);
    bins NonSeqToIdle =(NONSEQ => IDLE);
   // bins IdleToSeq = (IDLE => SEQ);   
    bins BusyToBusy   = (BUSY => BUSY); 
}

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

    HWSTRB_CP_0:coverpoint ahbMasterTransaction.hwstrb[0]{
      option.comment = " ahb strb";
      bins ahbStrbSingleBit   = {4'b0001, 4'b0010, 4'b0100, 4'b1000};
      bins ahbStrbDoubleBits  = {4'b0011, 4'b0101, 4'b1001, 4'b0110, 4'b1010, 4'b1100};
      bins ahbStrbAllOnes     = {4'b1111};
      ignore_bins ahbStrbThreeBits   = {4'b0111, 4'b1110, 4'b1101, 4'b1011};
      ignore_bins ahbStrbAllZeroes   = {4'b0000};
    }   

    HNONSEC_CP:coverpoint ahbMasterTransaction.hnonsec{
      option.comment = " ahb nonsec";
      bins ahbNonsec0={0};
     // bins ahbNonsec1={1};
    }

    HEXCL_CP:coverpoint ahbMasterTransaction.hexcl{
      option.comment = " ahb excl";
      bins ahbExcl0={0};
     // bins ahbExcl1={1};
    }

    HSIZE_CP_x_HBURST_CP:cross  HSIZE_CP ,HBURST_CP;

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
