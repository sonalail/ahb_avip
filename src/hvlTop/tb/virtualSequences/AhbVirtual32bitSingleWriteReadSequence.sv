`ifndef AHBVIRTUAL32BITSINGLEWRITEREADSEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITSINGLEWRITEREADSEQUENCE_INCLUDED_

class AhbVirtual32bitSingleWriteReadSequence extends AhbVirtualBaseSequence;
        `uvm_object_utils(AhbVirtual32bitSingleWriteReadSequence)

        AhbMaster32bitSingleWriteReadSequence ahbMaster32bitSingleWriteReadSequence;
        AhbSlave32bitSingleWriteReadSequence ahbSlave32bitSingleWriteReadSequence;
        AhbMaster32bitSingleReadWriteSequence ahbMaster32bitSingleReadWriteSequence;
        AhbSlave32bitSingleReadWriteSequence ahbSlave32bitSingleReadWriteSequence;

        extern function new(string name ="AhbVirtual32bitSingleWriteReadSequence");
        extern task body();
endclass : AhbVirtual32bitSingleWriteReadSequence

function AhbVirtual32bitSingleWriteReadSequence::new(string name ="AhbVirtual32bitSingleWriteReadSequence");
        super.new(name);
endfunction

task AhbVirtual32bitSingleWriteReadSequence::body();
        super.body();
        ahbMaster32bitSingleWriteReadSequence = AhbMaster32bitSingleWriteReadSequence::type_id::create("ahbMaster32bitSingleWriteReadSequence");
        ahbSlave32bitSingleWriteReadSequence  = AhbSlave32bitSingleWriteReadSequence::type_id::create("ahbSlave32bitSingleWriteReadSequence");
        ahbMaster32bitSingleReadWriteSequence = AhbMaster32bitSingleReadWriteSequence::type_id::create("ahbMaster32bitSingleReadWriteSequence");
        ahbSlave32bitSingleReadWriteSequence  = AhbSlave32bitSingleReadWriteSequence::type_id::create("ahbSlave32bitSingleReadWriteSequence");
        fork
                begin
                        forever begin
                                if(!ahbSlave32bitSingleWriteReadSequence.randomize() with {choosePacketDataSequence == 1;  }) begin
                                `uvm_error(get_type_name(), "Randomization failed : Inside ahb virtual 32 bit write read sequence")
                                end
                                ahbSlave32bitSingleWriteReadSequence.start(p_sequencer.ahbSlaveSequencer);
                        end
                end

                begin
                        forever begin
                                if(!ahbSlave32bitSingleReadWriteSequence.randomize() with {choosePacketDataSequence == 1; }) begin
                                `uvm_error(get_type_name(), "Randomization failed : Inside ahb virtual 32 bit write read sequence")
                                end
                                ahbSlave32bitSingleReadWriteSequence.start(p_sequencer.ahbSlaveSequencer);
                        end
                end
        join_none

        fork
                begin
                        repeat(1) begin
                                if(!ahbMaster32bitSingleWriteReadSequence.randomize() with {addrSequence== 32'h990; }) begin
                                `uvm_error(get_type_name(), "Randomization failed : Inside ahb virtual 32 bit write read sequence")
                                end
                                ahbMaster32bitSingleWriteReadSequence.start(p_sequencer.ahbMasterSequencer);
                        end
                end

                begin
                        repeat(1) begin
                                if(!ahbMaster32bitSingleReadWriteSequence.randomize() with {addrSequence == 32'h990; }) begin
                                `uvm_error(get_type_name(), "Randomization failed : Inside ahb virtual 32 bit write read sequence")
                                end
								#1;
                                ahbMaster32bitSingleReadWriteSequence.start(p_sequencer.ahbMasterSequencer);
                        end
                end
        join
endtask
`endif
