`ifndef AHBSCOREBOARD_INCLUDED_
`define AHBSCOREBOARD_INCLUDED_

class AhbScoreboard extends uvm_scoreboard;
  `uvm_component_utils(AhbScoreboard)

  AhbMasterTransaction ahbMasterTransaction;

  AhbSlaveTransaction ahbSlaveTransaction;

  uvm_tlm_analysis_fifo#(AhbMasterTransaction) ahbMasterAnalysisFifo[];

  uvm_tlm_analysis_fifo#(AhbSlaveTransaction) ahbSlaveAnalysisFifo[];

  int ahbMasterTransactionCount = 0;

  int ahbSlaveTransactionCount = 0;

  int VerifiedMasterHwdataCount = 0;

  int FailedMasterHwdataCount = 0;

  int VerifiedMasterHaddrCount = 0;

  int FailedMasterHaddrCount = 0;

  int VerifiedMasterHwriteCount = 0;

  int FailedMasterHwriteCount = 0;

  int VerifiedSlaveHrdataCount = 0;

  int FailedSlaveHrdataCount = 0;

  int VerifiedMasterHprotCount;

  int FailedMasterHprotCount;

  int indexMaster;

  int indexSlave;

  extern function new(string name = "AhbScoreboard", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual function void check_phase (uvm_phase phase);
  extern virtual function void report_phase(uvm_phase phase);

endclass : AhbScoreboard

function AhbScoreboard::new(string name = "AhbScoreboard",uvm_component parent = null);
  super.new(name, parent);
  ahbMasterAnalysisFifo = new[NO_OF_MASTERS];
  ahbSlaveAnalysisFifo = new[NO_OF_SLAVES];

  foreach(ahbMasterAnalysisFifo[i]) begin
    ahbMasterAnalysisFifo[i] = new($sformatf("ahbMasterAnalysisFifo[%0d]",i),this);
  end

  foreach(ahbSlaveAnalysisFifo[i]) begin
    ahbSlaveAnalysisFifo[i] = new($sformatf("ahbSlaveAnalysisFifo[%0d]",i),this);
  end
endfunction : new

function void AhbScoreboard::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task AhbScoreboard::run_phase(uvm_phase phase);
  super.run_phase(phase);

  forever begin
    for(int j = 0; j < NO_OF_MASTERS; j++) begin
      ahbMasterAnalysisFifo[j].get(ahbMasterTransaction);
      ahbMasterTransactionCount++;
      `uvm_info(get_type_name(), $sformatf("after calling master's analysis fifo get method"), UVM_HIGH);
    end

    for(int i = 0; i < NO_OF_SLAVES; i++) begin
      ahbSlaveAnalysisFifo[i].get(ahbSlaveTransaction);
      ahbSlaveTransactionCount++;
      `uvm_info(get_type_name(), $sformatf("after calling slave's analysis fifo get method"), UVM_HIGH);
    end

    if(ahbMasterTransaction.hwrite == WRITE && ahbSlaveTransaction.hreadyout == 1)begin
      if(!ahbMasterTransaction.htrans == IDLE )begin
        `uvm_info(get_type_name(),$sformatf("--\n-----------------------------------------------SCOREBOARD COMPARISIONS--------------------------------------------------"),UVM_HIGH) 
        if(ahbMasterTransaction.hwdata == ahbSlaveTransaction.hwdata) begin
          `uvm_info(get_type_name(),$sformatf("ahb HWDATA from master and slave is equal"),UVM_HIGH);
          `uvm_info("SB  HWDATA MATCHED", $sformatf("Master HWDATA = %0p and Slave HWDATA = %0p",
                                                    ahbMasterTransaction.hwdata,ahbSlaveTransaction.hwdata), UVM_HIGH);
          VerifiedMasterHwdataCount++;
        end
        else begin
          `uvm_info(get_type_name(),$sformatf("ahb HWDATA from master and slave is not equal"),UVM_HIGH);
          `uvm_error("ERROR SC HWDATA MISMATCH", $sformatf("Master HWDATA = %0p and Slave HWDATA = %0p",
                                                           ahbMasterTransaction.hwdata,ahbSlaveTransaction.hwdata));
          FailedMasterHwdataCount++;
        end

        if(ahbMasterTransaction.haddr == ahbSlaveTransaction.haddr) begin
          `uvm_info(get_type_name(),$sformatf("ahb HADDR from master and slave is equal"),UVM_HIGH);
          `uvm_info("SB HADDR MATCH", $sformatf("Master HADDR = 'h%0x and Slave HADDR = 'h%0x",
                                                ahbMasterTransaction.haddr,ahbSlaveTransaction.haddr), UVM_HIGH);             
          VerifiedMasterHaddrCount++;
        end

        else begin
          `uvm_info(get_type_name(),$sformatf("ahb HADDR from master and slave is not equal"),UVM_HIGH);
          `uvm_error("ERROR SC HADDR MISMATCH", $sformatf("Master HADDR = 'h%0x and Slave HADDR = 'h%0x",
                                                          ahbMasterTransaction.haddr,ahbSlaveTransaction.haddr));
          FailedMasterHaddrCount++;
        end

        if(ahbMasterTransaction.hwrite == ahbSlaveTransaction.hwrite) begin
          `uvm_info(get_type_name(),$sformatf("ahb HWRITE from master and slave is equal"),UVM_HIGH);
          `uvm_info("SB HWRITE MATCH", $sformatf("Master HWRITE = 'h%0x and Slave hwrite = 'h%0x",
                                                 ahbMasterTransaction.hwrite,ahbSlaveTransaction.hwrite), UVM_HIGH);
          VerifiedMasterHwriteCount++;
        end

        else begin
          `uvm_info(get_type_name(),$sformatf("ahb HWRITE from master and slave is not equal"),UVM_HIGH);
          `uvm_error("ERROR SC HWRITE MISMATCH", $sformatf("Master HWRITE = 'h%0x and Slave HWRITE = 'h%0x",
                                                           ahbMasterTransaction.hwrite,ahbSlaveTransaction.hwrite));
          FailedMasterHwriteCount++;
        end


        `uvm_info(get_type_name(),$sformatf("--\n-----------------------------------------------END OF SCOREBOARD COMPARISIONS---------------------------------------"),UVM_HIGH) 
      end
    end

    else if(ahbMasterTransaction.hwrite == READ && ahbSlaveTransaction.hreadyout == 1)begin
      if(!ahbMasterTransaction.htrans == IDLE)begin
        `uvm_info(get_type_name(),$sformatf("--\n-----------------------------------------------SCOREBOARD COMPARISIONS--------------------------------------------------"),UVM_HIGH) 


        if(ahbMasterTransaction.haddr == ahbSlaveTransaction.haddr) begin
          `uvm_info(get_type_name(),$sformatf("ahb HADDR from master and slave is equal"),UVM_HIGH);
          `uvm_info("SB HADDR MATCH", $sformatf("Master HADDR = 'h%0x and Slave HADDR = 'h%0x",
                                                ahbMasterTransaction.haddr,ahbSlaveTransaction.haddr), UVM_HIGH);             
          VerifiedMasterHaddrCount++;
        end

        else begin
          `uvm_info(get_type_name(),$sformatf("ahb HADDR from master and slave is not equal"),UVM_HIGH);
          `uvm_error("ERROR SC HADDR MISMATCH", $sformatf("Master HADDR = 'h%0x and Slave HADDR = 'h%0x",
                                                          ahbMasterTransaction.haddr,ahbSlaveTransaction.haddr));
          FailedMasterHaddrCount++;
        end

        if(ahbMasterTransaction.hwrite == ahbSlaveTransaction.hwrite) begin
          `uvm_info(get_type_name(),$sformatf("ahb HWRITE from master and slave is equal"),UVM_HIGH);
          `uvm_info("SB HWRITE MATCH", $sformatf("Master HWRITE = 'h%0x and Slave hwrite = 'h%0x",
                                                 ahbMasterTransaction.hwrite,ahbSlaveTransaction.hwrite), UVM_HIGH);
          VerifiedMasterHwriteCount++;
        end

        else begin
          `uvm_info(get_type_name(),$sformatf("ahb HWRITE from master and slave is not equal"),UVM_HIGH);
          `uvm_error("ERROR SC HWRITE MISMATCH", $sformatf("Master HWRITE = 'h%0x and Slave HWRITE = 'h%0x",
                                                           ahbMasterTransaction.hwrite,ahbSlaveTransaction.hwrite));
          FailedMasterHwriteCount++;
        end


        if(ahbSlaveTransaction.hrdata == ahbMasterTransaction.hrdata) begin
          `uvm_info(get_type_name(),$sformatf("ahb HRDATA from master and slave is equal"),UVM_HIGH);
          `uvm_info("SB HRDATA MATCHED", $sformatf("Master HRDATA = %0p and Slave HRDATA = %0p",
                                                   ahbMasterTransaction.hrdata,ahbSlaveTransaction.hrdata), UVM_HIGH);
          VerifiedSlaveHrdataCount++;
        end
        else begin
          `uvm_info(get_type_name(),$sformatf("ahb HRDATA from master and slave is not equal"),UVM_HIGH);
          `uvm_error("ERROR SC HRDATA MISMATCH", $sformatf("Master HRDATA = %0p and Slave HRDATA = %0p",
                                                           ahbMasterTransaction.hrdata,ahbSlaveTransaction.hrdata));
          FailedSlaveHrdataCount++;
        end


        `uvm_info(get_type_name(),$sformatf("--\n-----------------------------------------------END OF SCOREBOARD COMPARISIONS---------------------------------------"),UVM_HIGH) 
      end
    end
  end
    endtask : run_phase

function void AhbScoreboard::check_phase(uvm_phase phase);
  super.check_phase(phase);

  `uvm_info(get_type_name(),$sformatf("--\n----------------------------------------------SCOREBOARD CHECK PHASE---------------------------------------"),UVM_HIGH) 
  `uvm_info (get_type_name(),$sformatf(" Scoreboard Check Phase is starting"),UVM_HIGH); 

  if(ahbMasterTransaction.hwrite == WRITE)begin
    if (( VerifiedMasterHwdataCount != 0) && (FailedMasterHwdataCount == 0)) begin
      `uvm_info (get_type_name(), $sformatf ("all master_hwdata comparisions are succesful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf (" VerifiedMasterHwdataCount :%0d",
                                             VerifiedMasterHwdataCount),UVM_HIGH);

      `uvm_info (get_type_name(), $sformatf ("FailedMasterHwdataCount : %0d", 
                                             FailedMasterHwdataCount),UVM_HIGH);
      `uvm_error ("SC_CheckPhase", $sformatf ("comparisions of master_hwdata not happened"));
    end
  end

  if ((VerifiedMasterHaddrCount != 0) && (FailedMasterHaddrCount == 0)) begin
    `uvm_info (get_type_name(), $sformatf ("all master_paddr comparisions are succesful"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf ("VerifiedMasterHaddrCount :%0d",
                                           VerifiedMasterHaddrCount),UVM_HIGH);
    `uvm_info (get_type_name(), $sformatf ("FailedMasterHaddrCount : %0d", 
                                           FailedMasterHaddrCount),UVM_HIGH);
    `uvm_error ("SC_CheckPhase", $sformatf ("comparisions of master_paddr not happened"));
  end

  if ((VerifiedMasterHwriteCount != 0) && (FailedMasterHwriteCount == 0)) begin
    `uvm_info (get_type_name(), $sformatf ("all master_hwrite comparisions are succesful"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf ("VerifiedMasterHwriteCount :%0d",
                                           VerifiedMasterHwriteCount),UVM_HIGH);
    `uvm_info (get_type_name(), $sformatf ("FailedMasterHwriteCount : %0d", 
                                           FailedMasterHwriteCount),UVM_HIGH);
    `uvm_error ("SC_CheckPhase", $sformatf ("comparisions of master_hwrite not happened"));
  end

  if(ahbMasterTransaction.hwrite == READ)begin
    if ((VerifiedSlaveHrdataCount != 0) && (FailedSlaveHrdataCount == 0) ) begin
      `uvm_info (get_type_name(), $sformatf ("all slave_prdata comparisions are succesful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("VerifiedSlaveHrdataCount :%0d",
                                             VerifiedSlaveHrdataCount),UVM_HIGH);
      `uvm_info (get_type_name(), $sformatf ("FaileddSlaveHrdataCount : %0d", 
                                             FailedSlaveHrdataCount),UVM_HIGH);
    end
  end

  if (ahbMasterTransactionCount == ahbSlaveTransactionCount) begin
    `uvm_info (get_type_name(), $sformatf ("master and slave have equal no. of transactions"),UVM_HIGH);
  end

  else begin
    `uvm_info (get_type_name(), $sformatf ("ahbMasterTransactionCount : %0d",ahbMasterTransactionCount ),UVM_HIGH);
    `uvm_info (get_type_name(), $sformatf ("ahbSlaveTransactionCount  : %0d",ahbSlaveTransactionCount  ),UVM_HIGH);
    `uvm_error ("SC_CheckPhase", $sformatf ("master and slave doesnot have same no.of transactions"));
  end 

  if( ahbMasterAnalysisFifo[indexMaster].size() == 0)begin
    `uvm_info ("SC_CheckPhase", $sformatf ("AHB Master analysis FIFO is empty"),UVM_HIGH);
  end

  else begin
    `uvm_info (get_type_name(), $sformatf (" ahbMasterAnalysisFifo:%0d", ahbMasterAnalysisFifo.size() ),UVM_HIGH);
    `uvm_error ("SC_CheckPhase", $sformatf ("apb Master analysis FIFO is not empty"));
  end

  if( ahbSlaveAnalysisFifo[indexSlave].size()== 0)begin
    `uvm_info ("SC_CheckPhase", $sformatf ("AHB Slave analysis FIFO is empty"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf (" ahbSlaveAnalysisFifo:%0d", ahbSlaveAnalysisFifo.size()),UVM_HIGH);

    `uvm_error ("SC_CheckPhase",$sformatf ("AHB Slave analysis FIFO is not empty"));
  end

  `uvm_info(get_type_name(),$sformatf("--\n----------------------------------------------END OF SCOREBOARD CHECK PHASE---------------------------------------"),UVM_HIGH)

endfunction : check_phase

function void AhbScoreboard::report_phase(uvm_phase phase);
  super.report_phase(phase);
  `uvm_info("scoreboard",$sformatf("--\n--------------------------------------------------Scoreboard Report-----------------------------------------------"),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf(" Scoreboard Report Phase is starting"),UVM_HIGH); 

  `uvm_info (get_type_name(),$sformatf("No. of transactions from master:%0d",
                                       ahbMasterTransactionCount),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf("No. of transactions from slave:%0d", 
                                       ahbSlaveTransactionCount ),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf("Total no. of byte wise master_hwdata comparisions passed:%0d",
                                       VerifiedMasterHwdataCount),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf("Total no. of byte wise master_paddr comparisions passed:%0d",
                                       VerifiedMasterHaddrCount),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf("Total no. of byte wise master_hwrite comparisions passed:%0d",
                                       VerifiedMasterHwriteCount),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf("Total no. of byte wise slave_prdata comparisions passed:%0d",
                                       VerifiedSlaveHrdataCount),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf("No. of byte wise master_hwdata comparision failed:%0d",
                                       FailedMasterHwdataCount),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf("No. of byte wise master_paddr comparision failed:%0d",
                                       FailedMasterHaddrCount),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf("No. of byte wise master_hwrite comparision failed:%0d",
                                       FailedMasterHwriteCount),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf("No. of byte wise slave_prdata comparision failed:%0d",
                                       FailedSlaveHrdataCount),UVM_HIGH);

  `uvm_info("scoreboard",$sformatf("--\n--------------------------------------------------End of Scoreboard Report-----------------------------------------------"),UVM_HIGH);

endfunction : report_phase

`endif
