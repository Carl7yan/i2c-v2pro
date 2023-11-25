
`ifndef RKV_I2C_MASTER_HS_MASTER_CODE_VIRT_SEQ_SV
`define RKV_I2C_MASTER_HS_MASTER_CODE_VIRT_SEQ_SV
class rkv_i2c_master_hs_master_code_virt_seq extends rkv_i2c_base_virtual_sequence;

  `uvm_object_utils(rkv_i2c_master_hs_master_code_virt_seq)

  function new (string name = "rkv_i2c_master_hs_master_code_virt_seq");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_info(get_type_name(), "=====================STARTED=====================", UVM_LOW)
    super.body();
    vif.wait_rstn_release();
    vif.wait_apb(10);

    cfg.i2c_cfg.slave_cfg[0].bus_speed = lvc_i2c_pkg::HIGHSPEED_MODE;
    env.i2c_slv.reconfigure_via_task(cfg.i2c_cfg.slave_cfg[0]);

    // read reset value of IC_*_SPKLEN
    rgm.IC_FS_SPKLEN.mirror(status);
    rgm.IC_HS_SPKLEN.mirror(status);

    // set min value to IC_*_SPKLEN and read them
    // so the result of setting 0 is 1 because min value is 1
    rgm.IC_FS_SPKLEN.IC_FS_SPKLEN.set(0);
    rgm.IC_FS_SPKLEN.update(status);
    rgm.IC_FS_SPKLEN.mirror(status);
    rgm.IC_HS_SPKLEN.IC_HS_SPKLEN.set(0);
    rgm.IC_HS_SPKLEN.update(status);
    rgm.IC_HS_SPKLEN.mirror(status);

    // test reset value
    `uvm_do_on_with(apb_user_cfg_seq, 
                    p_sequencer.apb_mst_sqr,
                    {SPEED == 3;
                    IC_10BITADDR_MASTER == 0;
                    IC_TAR == `LVC_I2C_SLAVE0_ADDRESS;
                    ENABLE == 1;
                  })

    `uvm_do_on_with(apb_user_write_packet_seq, 
                    p_sequencer.apb_mst_sqr,
                   {packet.size() == 1; 
                    packet[0] == 8'b1010_1010;
                   })

    `uvm_do_on(i2c_slv_write_resp_seq, p_sequencer.i2c_slv_sqr)

    `uvm_do_on(apb_user_wait_empty_seq, p_sequencer.apb_mst_sqr)

    #10us;

    // set HS master code 'b000
    rgm.IC_ENABLE.ENABLE.set(0);
    rgm.IC_ENABLE.update(status);

    rgm.IC_HS_MADDR.IC_HS_MAR.set(0);
    rgm.IC_HS_MADDR.update(status);

    // enable i2c interface
    rgm.IC_ENABLE.ENABLE.set(1);
    rgm.IC_ENABLE.update(status);

    `uvm_do_on_with(apb_user_write_packet_seq, 
                    p_sequencer.apb_mst_sqr,
                   {packet.size() == 1; 
                    packet[0] == 8'b1010_1010;
                   })

    `uvm_do_on(i2c_slv_write_resp_seq, p_sequencer.i2c_slv_sqr)

    `uvm_do_on(apb_user_wait_empty_seq, p_sequencer.apb_mst_sqr)

    #10us;
    
    // set HS master code 'b001
    rgm.IC_ENABLE.ENABLE.set(0);
    rgm.IC_ENABLE.update(status);

    rgm.IC_HS_MADDR.IC_HS_MAR.set(1);
    rgm.IC_HS_MADDR.update(status);

    // enable i2c interface
    rgm.IC_ENABLE.ENABLE.set(1);
    rgm.IC_ENABLE.update(status);

    `uvm_do_on_with(apb_user_write_packet_seq, 
                    p_sequencer.apb_mst_sqr,
                   {packet.size() == 1; 
                    packet[0] == 8'b1010_1010;
                   })

    `uvm_do_on(i2c_slv_write_resp_seq, p_sequencer.i2c_slv_sqr)

    `uvm_do_on(apb_user_wait_empty_seq, p_sequencer.apb_mst_sqr)

    #10us;
    
    // set HS master code 'b010
    rgm.IC_ENABLE.ENABLE.set(0);
    rgm.IC_ENABLE.update(status);

    rgm.IC_HS_MADDR.IC_HS_MAR.set(2);
    rgm.IC_HS_MADDR.update(status);

    // enable i2c interface
    rgm.IC_ENABLE.ENABLE.set(1);
    rgm.IC_ENABLE.update(status);

    `uvm_do_on_with(apb_user_write_packet_seq, 
                    p_sequencer.apb_mst_sqr,
                   {packet.size() == 1; 
                    packet[0] == 8'b1010_1010;
                   })

    `uvm_do_on(i2c_slv_write_resp_seq, p_sequencer.i2c_slv_sqr)

    `uvm_do_on(apb_user_wait_empty_seq, p_sequencer.apb_mst_sqr)

    #10us;
    
    // set HS master code 'b011
    rgm.IC_ENABLE.ENABLE.set(0);
    rgm.IC_ENABLE.update(status);

    rgm.IC_HS_MADDR.IC_HS_MAR.set(3);
    rgm.IC_HS_MADDR.update(status);

    // enable i2c interface
    rgm.IC_ENABLE.ENABLE.set(1);
    rgm.IC_ENABLE.update(status);

    `uvm_do_on_with(apb_user_write_packet_seq, 
                    p_sequencer.apb_mst_sqr,
                   {packet.size() == 1; 
                    packet[0] == 8'b1010_1010;
                   })

    `uvm_do_on(i2c_slv_write_resp_seq, p_sequencer.i2c_slv_sqr)

    `uvm_do_on(apb_user_wait_empty_seq, p_sequencer.apb_mst_sqr)

    #10us;
    
    // set HS master code 'b100
    rgm.IC_ENABLE.ENABLE.set(0);
    rgm.IC_ENABLE.update(status);

    rgm.IC_HS_MADDR.IC_HS_MAR.set(4);
    rgm.IC_HS_MADDR.update(status);

    // enable i2c interface
    rgm.IC_ENABLE.ENABLE.set(1);
    rgm.IC_ENABLE.update(status);

    `uvm_do_on_with(apb_user_write_packet_seq, 
                    p_sequencer.apb_mst_sqr,
                   {packet.size() == 1; 
                    packet[0] == 8'b1010_1010;
                   })

    `uvm_do_on(i2c_slv_write_resp_seq, p_sequencer.i2c_slv_sqr)

    `uvm_do_on(apb_user_wait_empty_seq, p_sequencer.apb_mst_sqr)

    #10us;
    
    // set HS master code 'b101
    rgm.IC_ENABLE.ENABLE.set(0);
    rgm.IC_ENABLE.update(status);

    rgm.IC_HS_MADDR.IC_HS_MAR.set(5);
    rgm.IC_HS_MADDR.update(status);

    // enable i2c interface
    rgm.IC_ENABLE.ENABLE.set(1);
    rgm.IC_ENABLE.update(status);

    `uvm_do_on_with(apb_user_write_packet_seq, 
                    p_sequencer.apb_mst_sqr,
                   {packet.size() == 1; 
                    packet[0] == 8'b1010_1010;
                   })

    `uvm_do_on(i2c_slv_write_resp_seq, p_sequencer.i2c_slv_sqr)

    `uvm_do_on(apb_user_wait_empty_seq, p_sequencer.apb_mst_sqr)

    #10us;
    
    // set HS master code 'b110
    rgm.IC_ENABLE.ENABLE.set(0);
    rgm.IC_ENABLE.update(status);

    rgm.IC_HS_MADDR.IC_HS_MAR.set(6);
    rgm.IC_HS_MADDR.update(status);

    // enable i2c interface
    rgm.IC_ENABLE.ENABLE.set(1);
    rgm.IC_ENABLE.update(status);

    `uvm_do_on_with(apb_user_write_packet_seq, 
                    p_sequencer.apb_mst_sqr,
                   {packet.size() == 1; 
                    packet[0] == 8'b1010_1010;
                   })

    `uvm_do_on(i2c_slv_write_resp_seq, p_sequencer.i2c_slv_sqr)

    `uvm_do_on(apb_user_wait_empty_seq, p_sequencer.apb_mst_sqr)

    #10us;
    
    // set HS master code 'b111
    rgm.IC_ENABLE.ENABLE.set(0);
    rgm.IC_ENABLE.update(status);

    rgm.IC_HS_MADDR.IC_HS_MAR.set(7);
    rgm.IC_HS_MADDR.update(status);

    // enable i2c interface
    rgm.IC_ENABLE.ENABLE.set(1);
    rgm.IC_ENABLE.update(status);

    `uvm_do_on_with(apb_user_write_packet_seq, 
                    p_sequencer.apb_mst_sqr,
                   {packet.size() == 1; 
                    packet[0] == 8'b1010_1010;
                   })

    `uvm_do_on(i2c_slv_write_resp_seq, p_sequencer.i2c_slv_sqr)

    `uvm_do_on(apb_user_wait_empty_seq, p_sequencer.apb_mst_sqr)

    #10us;

    // Attach element sequences below
    `uvm_info(get_type_name(), "=====================FINISHED=====================", UVM_LOW)
  endtask

endclass
`endif // RKV_I2C_MASTER_HS_MASTER_CODE_VIRT_SEQ_SV
