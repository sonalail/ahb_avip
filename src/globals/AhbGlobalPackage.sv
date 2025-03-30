`ifndef AHBGLOBALPACKAGE_INCLUDED_
`define AHBGLOBALPACKAGE_INCLUDED_

package AhbGlobalPackage;

  parameter int NO_OF_MASTERS = 1;

  parameter int NO_OF_SLAVES = 1;

  parameter bit MASTER_AGENT_ACTIVE = 1;

  parameter bit SLAVE_AGENT_ACTIVE = 1;

  parameter int ADDR_WIDTH = 32;

  parameter int DATA_WIDTH = 32;

  parameter int HMASTER_WIDTH = (NO_OF_MASTERS == 1) ? 1 : $clog2(NO_OF_MASTERS);

  parameter int HPROT_WIDTH = 4;

  parameter int SLAVE_MEMORY_SIZE = 12;

  parameter int SLAVE_MEMORY_GAP = 5;

  parameter int MEMORY_WIDTH = 8;

  parameter int LENGTH = 4;

  parameter int waitForStateValue = 16;

  typedef enum logic [2:0] {
    SINGLE      = 3'b000,
    INCR        = 3'b001,
    WRAP4       = 3'b010,
    INCR4       = 3'b011,
    WRAP8       = 3'b100,
    INCR8       = 3'b101,
    WRAP16      = 3'b110,
    INCR16      = 3'b111
  } ahbBurstEnum;

  typedef enum logic [1:0] {
    IDLE      = 2'b00,
    BUSY      = 2'b01,
    NONSEQ    = 2'b10,
    SEQ       = 2'b11
  } ahbTransferEnum;

  typedef enum logic {
    OKAY   = 1'b0,
    ERROR  = 1'b1
  } ahbRespEnum;

typedef enum logic [2:0] {
  BYTE        = 3'b000, // 8 bits
  HALFWORD    = 3'b001, // 16 bits
  WORD        = 3'b010, // 32 bits
  DOUBLEWORD  = 3'b011, // 64 bits
  LINE4       = 3'b100, // 128 bits (4-word line)
  LINE8       = 3'b101, // 256 bits (8-word line)
  LINE16      = 3'b110, // 512 bits
  LINE32      = 3'b111  // 1024 bits
} ahbHsizeEnum;

 
  typedef enum logic [HPROT_WIDTH-1:0] {
    NORMAL_SECURE_DATA              = 4'b0000,
    NORMAL_SECURE_INSTRUCTION       = 4'b0001,
    NORMAL_NONSECURE_DATA           = 4'b0010,
    NORMAL_NONSECURE_INSTRUCTION    = 4'b0011,
    PRIVILEGED_SECURE_DATA          = 4'b0100,
    PRIVILEGED_SECURE_INSTRUCTION   = 4'b0101,
    PRIVILEGED_NONSECURE_DATA       = 4'b0110,
    PRIVILEGED_NONSECURE_INSTRUCTION = 4'b0111
  } ahbProtectionEnum;

  typedef enum bit{
	WRITE = 1'b1,
	READ = 1'b0
	}ahbWriteEnum;

typedef struct {
logic  [ADDR_WIDTH-1:0]  haddr;          // Address of the transfer
logic  [NO_OF_SLAVES-1:0] hselx;        // slave select 
ahbBurstEnum            hburst;         // Burst type
logic                   hmastlock;      // Locked sequence indicator
ahbProtectionEnum       hprot;          // Protection type
ahbHsizeEnum            hsize;          // Transfer size
logic                   hnonsec;        // Secure or non-secure indicator
logic                   hexcl;          // Exclusive access sequence
logic [HMASTER_WIDTH-1:0] hmaster;     // Master ID
ahbTransferEnum          htrans;        // Transfer type
logic [2**LENGTH:0] [DATA_WIDTH-1:0]   hwdata;         // Write data bus
logic [2**LENGTH:0] [(DATA_WIDTH/8)-1:0] hwstrb;     // Write strobes
ahbWriteEnum            hwrite;         // Write or read indicator
logic [2**LENGTH:0] [DATA_WIDTH-1:0]  hrdata;         // Read data bus
logic                   hreadyout;      // Transfer completion for subordinate
ahbRespEnum             hresp;          // Response status
logic                   hexokay;        // Exclusive OKAY status
logic                   hready;         // Combined transfer completion
int                     noOfWaitStates;
bit [2**LENGTH:0] busyControl;          //indicating When Busy Transfer must be introduced
  } ahbTransferCharStruct;

 
  typedef struct{
    logic [ADDR_WIDTH-1:0] haddr;          // Address of the transfer
     bit [ADDR_WIDTH-1:0]minimumAddress;
     bit [ADDR_WIDTH-1:0]maximumAddress; 
   // int slave_id;
    int noOfWaitStates;
  } ahbTransferConfigStruct ;

endpackage : AhbGlobalPackage

`endif

