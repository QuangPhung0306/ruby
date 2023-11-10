module UnitSelection::DataGridView1RowHeaderMouseClick
  def dataGridView1_RowHeaderMouseClick
     if (@radiobutton6 == true)

       @textbox1 = @datavalue.first[3].to_f.round(1).to_s
       @textbox7 = @datavalue.first[4].to_f.round(1).to_s
       @textbox23 = @datavalue.first[5].to_f.round(0).to_s
       @textbox2 = @datavalue.first[6].to_f.round(1).to_s
       @textbox5 = @datavalue.first[7].to_f.round(1).to_s
       @textbox38 = @datavalue.first[8].to_f.round(0).to_s
       if (@flag1 == 1 || @flag1 == 2)
         @textbox65 = @datavalue.first[8].to_f.round(0).to_s
       end
       @textbox50 = @datavalue.first[14].to_f.round(2).to_s
       @combobox4 = (@datavalue.first[2]).to_f.round(0).to_s
       @combobox1 = @datavalue.first[1].to_f.round(0).to_s
       @textbox8 = @datavalue.first[0].to_f.round(0).to_s
       @textbox55 = @datavalue.first[15].to_f.round(1).to_s
       @textbox56 = @datavalue.first[16].to_f.round(1).to_s
       @textboxd = @datavalue.first[18].to_f.round(1).to_s
       @textboxe = @datavalue.first[19].to_f.round(1).to_s
       @textbox16 = @datavalue.first[53].to_f.round(1).to_s
       @textbox73 = @datavalue.first[17].to_f.round(1).to_s
       @textbox62 = @datavalue.first[21].to_f.round(1).to_s
       @textbox68 = @datavalue.first[22].to_f.round(1).to_s
       @textbox69 = @datavalue.first[23].to_f.round(1).to_s
       @textbox70 = @datavalue.first[24].to_f.round(1).to_s
       @textbox71 = @datavalue.first[25].to_f.round(1).to_s
       @textbox66 = @datavalue.first[26].to_f.round(1).to_s
       @textbox67 = @datavalue.first[27].to_f.round(1).to_s
       @textbox18 = @datavalue.first[30].to_f.round(1).to_s
       @textbox10 = @datavalue.first[32].to_f.round(1).to_s
       @textbox19 = @datavalue.first[33].to_f.round(1).to_s
       @textbox60 = @datavalue.first[36].to_f.round(1).to_s
       @textbox61 = @datavalue.first[37].to_f.round(1).to_s
       @textbox81 = @datavalue.first[38].to_f.round(1).to_s
       @textbox82 = @datavalue.first[39].to_f.round(1).to_s
       @textbox4 = @datavalue.first[40].to_f.round(1).to_s
       @textbox6 = @datavalue.first[41].to_f.round(1).to_s
       @textbox79 = @datavalue.first[42].to_f.round(0).to_s
       @textbox45 = @datavalue.first[43].to_f.round(1).to_s
       @textbox46 = @datavalue.first[44].to_f.round(1).to_s
       @textbox64 = @datavalue.first[64].to_f.round(0).to_s
       @textbox77 = @datavalue.first[68].to_f.round(1).to_s

       @textbox41 = @datavalue.first[69].to_f.round(1).to_s
       @textbox42 = @datavalue.first[70].to_f.round(1).to_s
       @textbox39 = @datavalue.first[71].to_f.round(1).to_s
       @textbox40 = @datavalue.first[72].to_f.round(1).to_s

       @textbox80 = @datavalue.first[73].to_f.round(0).to_s
       @textbox65 = @datavalue.first[74].to_f.round(0).to_s
       @textbox22 = @datavalue.first[75].to_f.round(0).to_s

       @textbox17 = @datavalue.first[9].to_f.round(1).to_s
       @textbox12 = @datavalue.first[10].to_f.round(3).to_s
       @textbox43 = @datavalue.first[49].to_f.round(1).to_s
       @textbox44 = @datavalue.first[50].to_f.round(1).to_s
       @textbox21 = @datavalue.first[12].to_f.round(1).to_s
       @textbox20 = @datavalue.first[13].to_f.round(1).to_s
       @textbox75 = @datavalue.first[51].to_f.round(1).to_s
       @textbox74 = @datavalue.first[52].to_f.round(1).to_s
       @textbox52 = @datavalue.first[20].to_f.round(1).to_s
     end
     
     if (@radiobutton5 == true)

       @textbox31 = @datavalue.first[3].to_f.round(1).to_s
       @textbox30 = @datavalue.first[4].to_f.round(1).to_s
       @textbox29 = @datavalue.first[5].to_f.round(0).to_s
       @textbox34 = @datavalue.first[6].to_f.round(1).to_s
       @textbox33 = @datavalue.first[7].to_f.round(1).to_s
       @textbox32 = @datavalue.first[8].to_f.round(0).to_s
       if (@flag1 == 1 || @flag1 == 2)
         @textbox83 = @datavalue.first[8].to_f.round(0).to_s
       end
       @textbox37 = @datavalue.first[9].to_f.round(1).to_s
       @textbox36 = @datavalue.first[10].to_f.round(3).to_s
       @textbox25 = @datavalue.first[12].to_f.round(1).to_s
       @textbox24 = @datavalue.first[13].to_f.round(1).to_s
       @textbox49 = @datavalue.first[14].to_f.round(2).to_s
       @combobox4 = (@datavalue.first[2]).to_f.round(0).to_s
       @combobox1 = @datavalue.first[1].to_f.round(0).to_s
       @textbox8 = @datavalue.first[0].to_f.round(0).to_s
       @textbox54 = @datavalue.first[15].to_f.round(2).to_s
       @textbox53 = @datavalue.first[16].to_f.round(2).to_s
       @textbox72 = @datavalue.first[17].to_f.round(2).to_s
       @textbox89 = @datavalue.first[18].to_f.round(1).to_s
       @textbox90 = @datavalue.first[19].to_f.round(1).to_s
       @textbox91 = @datavalue.first[53].to_f.round(1).to_s
       @textbox51 = @datavalue.first[20].to_f.round(1).to_s
       @textbox68 = @datavalue.first[22].to_f.round(1).to_s
       @textbox69 = @datavalue.first[23].to_f.round(1).to_s
       @textbox70 = @datavalue.first[24].to_f.round(1).to_s
       @textbox71 = @datavalue.first[25].to_f.round(1).to_s
       @textbox66 = @datavalue.first[26].to_f.round(1).to_s
       @textbox67 = @datavalue.first[27].to_f.round(1).to_s
       @textbox35 = @datavalue.first[30].to_f.round(1).to_s
       @textbox48 = @datavalue.first[32].to_f.round(1).to_s
       @textbox47 = @datavalue.first[33].to_f.round(1).to_s
       @textbox59 = @datavalue.first[36].to_f.round(1).to_s
       @textbox58 = @datavalue.first[37].to_f.round(1).to_s
       @textbox87 = @datavalue.first[38].to_f.round(1).to_s
       @textbox86 = @datavalue.first[39].to_f.round(1).to_s
       @textbox27 = @datavalue.first[40].to_f.round(1).to_s
       @textbox26 = @datavalue.first[41].to_f.round(1).to_s
       @textbox78 = @datavalue.first[42].to_f.round(1).to_s
       @textbox43 = @datavalue.first[49].to_f.round(1).to_s
       @textbox44 = @datavalue.first[50].to_f.round(1).to_s
       @textbox75 = @datavalue.first[51].to_f.round(1).to_s
       @textbox74 = @datavalue.first[52].to_f.round(1).to_s
       @textbox77 = @datavalue.first[68].to_f.round(1).to_s
     end
  end
end