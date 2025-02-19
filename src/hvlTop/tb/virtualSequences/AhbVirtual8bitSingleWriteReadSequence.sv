`ifndef AHBVIRTUAL8BITSINGLEWRITEREADSEQUENCE_INCLUDED_
`define AHBVIRTUAL8BITSINGLEWRITEREADSEQUENCE_INCLUDED_

class AhbVirtual8bitSingleWriteReadSequence extends AhbVirtualBaseSequence;
        `uvm_object_utils(AhbVirtual8bitSingleWriteReadSequence)

        AhbMaster8bitSingleWriteReadSequence ahbMaster8bitSingleWriteReadSequence;
        AhbSlave8bitSingleWriteReadSequence ahbSlave8bitSingleWriteReadSequence;
        AhbMaster8bitSingleReadWriteSequence ahbMaster8bitSingleReadWriteSequence;
        AhbSlave8bitSingleReadWriteSequence ahbSlave8bitSingleReadWriteSequence;

        extern function new(string name ="AhbVirtual8bitSingleWriteReadSequence");
        extern task body();
endclass : AhbVirtual8bitSingleWriteReadSequence

function AhbVirtual8bitSingleWriteReadSequence::new(string name ="AhbVirtual8bitSingleWriteReadSequence");
        super.new(name);
endfunction

task AhbVirtual8bitSingleWriteReadSequence::body();
        super.body();
        ahbMaster8bitSingleWriteReadSequence = AhbMaster8bitSingleWriteReadSequence::type_id::create("ahbMaster8bitSingleWriteReadSequence");
        ahbSlave8bitSingleWriteReadSequence  = AhbSlave8bitSingleWriteReadSequence::type_id::create("ahbSlave8bitSingleWriteReadSequence");
        ahbMaster8bitSingleReadWriteSequence = AhbMaster8bitSingleReadWriteSequence::type_id::create("ahbMaster8bitSingleReadWriteSequence");
        ahbSlave8bitSingleReadWriteSequence  = AhbSlave8bitSingleReadWriteSequence::type_id::create("ahbSlave8bitSingleReadWriteSequence");
        fork
                begin
                        forever begin
                                if(!ahbSlave8bitSingleWriteReadSequence.randomize() with {choosePacketDataSequence == 1;  }) begin
                                `uvm_error(get_type_name(), "Randomization failed : Inside ahb virtual 8 bit write read sequence")
                                end
                                ahbSlave8bitSingleWriteReadSequence.start(p_sequencer.ahbSlaveSequencer);
                        end
                end

                begin
                        forever begin
                                if(!ahbSlave8bitSingleReadWriteSequence.randomize() with {choosePacketDataSequence == 1; }) begin
                                `uvm_error(get_type_name(), "Randomization failed : Inside ahb virtual 8 bit write read sequence")
                                end
                                ahbSlave8bitSingleReadWriteSequence.start(p_sequencer.ahbSlaveSequencer);
                        end
                end
        join_none

        fork
                begin
                        repeat(1) begin
                                if(!ahbMaster8bitSingleWriteReadSequence.randomize() with {addrSequence== 8'h90; }) begin
                                `uvm_error(get_type_name(), "Randomization failed : Inside ahb virtual 8 bit write read sequence")
                                end
                                ahbMaster8bitSingleWriteReadSequence.start(p_sequencer.ahbMasterSequencer);
                        end
                end

                begin
                        repeat(1) begin
                                if(!ahbMaster8bitSingleReadWriteSequence.randomize() with {addrSequence == 8'h90; }) begin
                                `uvm_error(get_type_name(), "Randomization failed : Inside ahb virtual 8 bit write read sequence")
                                end
								#1;
                                ahbMaster8bitSingleReadWriteSequence.start(p_sequencer.ahbMasterSequencer);
                        end
                end
        join
endtask
`endif
