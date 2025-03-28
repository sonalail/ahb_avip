`ifndef AHBMASTERSEQUENCER_INCLUDED_
`define AHBMASTERSEQUENCER_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: AhbMasterSequencer
//--------------------------------------------------------------------------------------------
class AhbMasterSequencer extends uvm_sequencer #(AhbMasterTransaction);
  `uvm_component_utils(AhbMasterSequencer)

  //Variable: ahbMasterAgentConfig
  //Declaring handle for AhbMasterAgentConfig class 
  AhbMasterAgentConfig ahbMasterAgentConfig;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "AhbMasterSequencer", uvm_component parent);
    
endclass : AhbMasterSequencer
 
    //--------------------------------------------------------------------------------------------
    // Construct: new
    //  Initializes the AhbMasterSequencer class component
    //
    // Parameters:
    //  name - AhbMasterSequencer
    //  parent - parent under which this component is created
    //--------------------------------------------------------------------------------------------
function AhbMasterSequencer::new(string name = "AhbMasterSequencer",uvm_component parent);
  super.new(name,parent);
endfunction : new

`endif
