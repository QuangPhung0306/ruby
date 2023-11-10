module UnitSelection::Selectdiameter
  def selectdiameter
    (0..10).to_a.each do |i|
      @flagd[i] = 0
    end

    @umax = 5.5
    @umin = 1.5

    if (checkBox13 == true)
      if (radioButton5 == true)
        @combobox1 = "4250"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[18] = 4250
        end
        @combobox1 = "3950"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[17] = 3950
        end
        @combobox1 = "3550"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[16] = 3550
        end
        @combobox1 = "2950"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[15] = 2950
        end
        @combobox1 = "2650"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[14] = 2650
        end
        @combobox1 = "2450"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[13] = 2450
        end
        @combobox1 = "2190"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[12] = 2190
        end
        @combobox1 = "1940"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[11] = 1940
        end
        @combobox1 = "1730"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[10] = 1730
        end
        @combobox1 = "1525"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[9] = 1525
        end
        @combobox1 = "1220"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[8] = 1220
        end
        @combobox1 = "1060"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[7] = 1060
        end
        @combobox1 = "965"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[6] = 965
        end
        @combobox1 = "770"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[5] = 770
        end
        @combobox1 = "660"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[4] = 660
        end
        @combobox1 = "550"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[3] = 550
        end
        @combobox1 = "450"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[2] = 450
        end
        @combobox1 = "320"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[1] = 320
        end
        @combobox1 = "250"

        if ((@textbox23.to_f / 3600 / @csa) >= @umin && (@textbox23.to_f / 3600 / @csa) <= @umax)
          @flagd[0] = 250
        end
      elsif (@radiobutton6 == true)
        @combobox1 = "4250"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[18] = 4250
        end
        @combobox1 = "3950"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[17] = 3950
        end
        @combobox1 = "3550"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[16] = 3550
        end
        @combobox1 = "2950"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[15] = 2950
        end
        @combobox1 = "2650"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[14] = 2650
        end
        @combobox1 = "2450"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[13] = 2450
        end
        @combobox1 = "2190"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[12] = 2190
        end
        @combobox1 = "1940"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[11] = 1940
        end
        @combobox1 = "1730"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[10] = 1730
        end
        @combobox1 = "1525"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[9] = 1525
        end
        @combobox1 = "1220"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[8] = 1220
        end
        @combobox1 = "1060"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[7] = 1060
        end
        @combobox1 = "965"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[6] = 965
        end
        @combobox1 = "770"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[5] = 770
        end
        @combobox1 = "660"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[4] = 660
        end
        @combobox1 = "550"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[3] = 550
        end
        @combobox1 = "450"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[2] = 450
        end
        @combobox1 = "320"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[1] = 320
        end
        @combobox1 = "250"

        if ((@textbox29.to_f*1.639 / 3600 / @csa) >= @umin && (@textbox29.to_f*1.639 / 3600 / @csa) <= @umax)
          @flagd[0] = 250
        end
      end

      (0..18).to_a.each do |i|
        if ( @flagd[i] != 0)
          @combobox1 =  @flagd[i]
          break
        end
      end
      @combobox1 = false
    end
  end
end
