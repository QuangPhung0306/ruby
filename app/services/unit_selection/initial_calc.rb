module UnitSelection::InitialCalc
  def initial_calc change_unit = nil
    @flagini = 1

    begin
      # @pai = 3.1415
      @textbox17 = "-"
      @textbox37 = "-"
      @textbox12 = "-"
      @textbox36 = "-"
      @textbox44 = "-"
      @textbox43 = "-"
      @textbox52 = "-"
      @textbox51 = "-"
      @textbox64 = "-"
      @textbox84 = "-"
      @textbox21 = "-"
      @textbox25 = "-"
      @textbox20 = "-"
      @textbox24 = "-"
      @textbox18 = "-"
      @textbox35 = "-"
      @textbox55 = "-"
      @textbox54 = "-"
      @textbox56 = "-"
      @textbox53 = "-"
      @textbox73 = "-"
      @textbox72 = "-"
      @textbox46 = "-"
      @textbox45 = "-"
      result = {textbox17: @textbox17, textbox37: @textbox37, textbox12: @textbox12, textbox36: @textbox36, textbox44: @textbox44, textbox43: @textbox43, textbox52: @textbox52, textbox51: @textbox51, textbox64: @textbox64, textbox84: @textbox84, textbox21: @textbox21, textbox25: @textbox25, textbox20: @textbox20, textbox24: @textbox24, textbox18: @textbox18, textbox35: @textbox35, textbox55: @textbox55, textbox54: @textbox54, textbox56: @textbox56, textbox53: @textbox53, textbox73: @textbox73, textbox72: @textbox72, textbox46: @textbox46, textbox45: @textbox45}
      if @radiobutton9 == true
        @textbox2 = "-"
        @textbox5 = "-"
        @textbox33 = "-"
        @textbox34 = "-"
        result.merge!({textbox2: @textbox2, textbox5: @textbox5, textbox33: @textbox33, textbox34: @textbox34})
      end

      if @flagdst == 1
        if @dstuc != 1
          if @combobox2.to_s == "Consorb" || @combobox2.to_s == "Recusorb 1" || @combobox2.to_s == "Recusorb 2"
            @csa = @cc[@dstunit][11] * @textbox68.to_f / 100
            @csh = @cc[@dstunit][11] * @textbox69.to_f / 100
            @csp = @cc[@dstunit][11] * @textbox70.to_f / 100
            @csp2 = @cc[@dstunit][11] * @textbox71.to_f / 100
          else
            @csa = ((@combobox1.to_f / 1000 / 2) ** 2)*@pai * @textbox68.to_f / 100
            @csh = ((@combobox1.to_f / 1000 / 2) ** 2)*@pai * @textbox69.to_f / 100
            @csp = ((@combobox1.to_f / 1000 / 2) ** 2)*@pai * @textbox70.to_f / 100
            @csp2 = ((@combobox1.to_f / 1000 / 2) ** 2)*@pai * @textbox71.to_f / 100
          end
          @textbox15 = (360 * @textbox70.to_f / 100).round(0).to_s
          @textbox11 = (360 * @textbox69.to_f / 100).round(0).to_s
          @textbox9 = (360 * @textbox68.to_f / 100).round(0).to_s
          result.merge!({textbox15: @textbox15, textbox11: @textbox11, textbox9: @textbox9})
        end
      end
      @cf = 1040.0

      if @textbox2 == "-"
        @htg = (100 + 273.15)
      end
      if @textbox5  == "-"
        @textbox5 = @textbox19.to_s
        result.merge!({textbox5: @textbox5})
      end
      if @textbox7.to_s == ""
        raise "textbox7 is blank"
      end
      @va = 4.555*(0.622 + @textbox7.to_f / 1000)*(@textbox1.to_f + 273.15) * 101.32 / (1000 * @label139.to_f / 10)
      @fakg = @textbox23.to_f / @va
      @vc = 4.555*(0.622 + @textbox6.to_f / 1000)*(@textbox4.to_f + 273.15) * 101.32 / (1000 * @label139.to_f / 10)
      @fckg = (@textbox22.to_f / @vc)
      @vcc = 4.555*(0.622 + @textbox6.to_f / 1000)*(@textbox4.to_f + 273.15) * 101.32 / (1000 * @label139.to_f / 10)
      @fcckg = (@textbox79.to_f / @vcc)
      @vh = 4.555*(0.622 + @textbox5.to_f / 1000)*(@htg)* 101.32 / (1000 * @label139.to_f / 10)
      @fhkg = (@textbox38.to_f / @vh)
      @vra = 4.555*(0.622 + @textbox61.to_f / 1000)*(@textbox60.to_f + 273.15) * 101.32 / (1000 * @label139.to_f / 10)
      @frakg = (@textbox80.to_f / @vra)
      @voa = 4.555*(0.622 + @textbox82.to_f / 1000)*(@textbox81.to_f + 273.15) * 101.32 / (1000 * @label139.to_f / 10)
      @foakg = (@textbox76.to_f / @voa)
      @ve = 4.555*(0.622 + @textbox19.to_f / 1000)*(@textbox10.to_f + 273.15) * 101.32 / (1000 * @label139.to_f / 10)
      if @textbox65.to_s == ""
        raise "textbox65 is blank"
      else
        @fekg = (@textbox65.to_f / @ve)
      end
      if @radiobutton5 == true
        if @flagsgj == 3
          @textbox9 = "233"
          @textbox15 = "37"
          @textbox11 = "90"
          result.merge!({textbox9: @textbox9, textbox15: @textbox15, textbox11: @textbox11})

          if (@radiobutton1 == true)
            @textbox59 = ((@textbox60.to_f) * 1.8 + 32).round(1).to_s
            @textbox58 = (@textbox61.to_f * 7).round(1).to_s
            @textbox88 = (@textbox80.to_f / 1.699).round(0).to_s

            @textbox1 = ((@textbox60.to_f) + 3).round(1).to_s
            @textbox31 = ((@textbox1.to_f) * 1.8 + 32).round(1).to_s
            @textbox7 = @textbox61.to_f
            @textbox30 = (@textbox7.to_f * 7).round(1).to_s
            unless flow_rate_remained?(change_unit)
              @textbox23 = @textbox80
              @textbox29 = (@textbox23.to_f / 1.699).round(0).to_s
            end
            @textboxd = (@textbox23.to_f / 3600 / @csa).round(1).to_s

            if (@checkbox19 == true)
              @textbox19 = @textbox61.to_f;
              @textbox10 = @textbox60.to_f;
            end
            @textbox48 = ((@textbox10.to_f) * 1.8 + 32).round(1).to_s
            @textbox47 = (@textbox19.to_f * 7).round(1).to_s
            @textbox83 = (@textbox65.to_f / 1.699).round(0).to_s

            @textbox4 = (@textbox10.to_f + 3.0).round(1).to_s;
            @textbox6 = (@textbox19.to_f).round(1).to_s;
            @textbox27 = ((@textbox4.to_f) * 1.8 + 32).round(1).to_s
            @textbox26 = (@textbox6.to_f * 7).round(1).to_s

            @textbox28 = (@textbox22.to_f / 1.699).round(0).to_s
            @textbox16 = (@textbox22.to_f / 3600 / @csp).round(1).to_s

            @textbox79 = @textbox22
            @textbox78 = (@textbox79.to_f / 1.699).round(0).to_s

            @oatg = @textbox10.to_f + 273.15;
            @xboa = @textbox19.to_f / 1000.0
            @energyh = @textbox50.to_f;
            @xbh = @textbox19.to_f / 1000.0
            @heatertg = @oatg + @energyh * 1000 / @cf / ((@fekg - @fckg) / 3600);

            if (@radiobutton9 == true)
              @textbox5 = "-";
              @textbox2 = "-";
            elsif (@radiobutton8 == true)
              if (@textbox2 == "-")
                @textbox2 = "140";
              else
                @htg = @textbox2.to_f + 273.15;
              end
            end
            @textbox38 = (@textbox65.to_f).round(1).to_s
            @textbox32 = (@textbox38.to_f / 1.699).round(0).to_s
            @textboxe = (@textbox38.to_f / 3600 / @csh).round(1).to_s

          elsif (@radiobutton2 == true)
            @textbox31 = ((@textbox1.to_f) * 1.8 + 32).round(1).to_s
            @textbox30 = (@textbox7.to_f * 7).round(1).to_s
            unless flow_rate_remained?(change_unit)
              @textbox23 = (@textboxd.to_f * 3600 * @csa).round(1).to_s
              @textbox29 = (@textboxd.to_f * 3600 * @csa / 1.699).round(0).to_s
            end
            @va = 4.555*(0.622 + @textbox7.to_f / 1000)*(@textbox1.to_f + 273.15) * 101.32 / (1000 * @label139.to_f / 10)
            @fakg = (@textbox23.to_f * (@textbox1.to_f + 273.15) / 293.15 / @va);

            @textbox60 = ((@textbox1.to_f) - 3).round(1).to_s;
            @textbox59 = ((@textbox60.to_f) * 1.8 + 32).round(1).to_s
            @textbox61 = @textbox7;
            @textbox58 = (@textbox61.to_f * 7).round(1).to_s

            if (@checkbox2 == true)
              @textboxe = @textboxd
            end
            @textbox38 = (@textboxe.to_f * 3600 * @csh).round(0).to_s
            @textbox32 = (@textboxe.to_f * 3600 * @csh / 1.699).round(0).to_s

            @textbox27 = ((@textbox4.to_f) * 1.8 + 32).round(1).to_s
            if (@checkbox5 == true)
              @textbox16 = @textboxe
            end
            @textbox22 = (@textbox16.to_f * 3600 * @csp).round(0).to_s
            @textbox28 = (@textbox16.to_f * 3600 * @csp / 1.699).round(0).to_s

            if (@checkbox6 == true)
              @textbox4 = @textbox1;
            end
            if (@checkbox4 == true)
              @textbox6 = @textbox7;
            end
            @textbox27 = ((@textbox4.to_f) * 1.8 + 32).round(1).to_s
            @textbox26 = (@textbox6.to_f * 7).round(1).to_s
            @textbox79 = @textbox22
            @textbox78 = (@textbox79.to_f / 1.699).round(0).to_s

            @textbox80 = (@textbox23.to_f).round(0).to_s
            @textbox88 = (@textbox80.to_f / 1.699).round(0).to_s

            @oatg = @textbox10.to_f + 273.15;
            @energyh = @textbox50.to_f;
            @xbh = @textbox19.to_f / 1000.0
            @heatertg = @oatg + @energyh * 1000 / @cf / ((@fekg - @fckg) / 3600);

            if (@radiobutton9 == true)
              @textbox2 = "-";
            elsif (@radiobutton8 == true)
              if (@textbox2 == "-")
               @textbox2 = "140";
              else
                @htg = @textbox2.to_f + 273.15
              end
            end
            if (@checkbox2 == true)
              @textboxe = @textboxd
            end
            @textbox34 = ((@textbox2.to_f) * 1.8 + 32).round(1).to_s
            @fhkg = (@textbox38.to_f * (@htg) / 293.15 / @vh)

            if (@checkbox19 == true)
              @textbox19 = @textbox61.to_f;
              @textbox10 = @textbox60.to_f;
            end
            @textbox48 = ((@textbox10.to_f) * 1.8 + 32).round(1).to_s
            @textbox47 = (@textbox19.to_f * 7).round(1).to_s
            @textbox65 = (@textbox38.to_f - @textbox22.to_f).round(0).to_s;
            @textbox83 = (@textbox65.to_f / 1.699).round(0).to_s
            @ve = 4.555*(0.622 + @textbox19.to_f / 1000)*(@textbox10.to_f + 273.15) * 101.32 / (1000 * @label139.to_f / 10)
            @fekg = (@textbox65.to_f * (@textbox10.to_f + 273.15) / 293.15 / @ve)
          end

        elsif @combobox2.to_s == "Consorb"

          if @combobox8.to_s == "CS-5" || @combobox8.to_s == "CS-5L"
            @textbox59 = (@textbox60.to_f * 1.8 + 32).round(1).to_s
            @textbox58 = (@textbox61.to_f * 7).round(1).to_s

            @textbox87 = (@textbox81.to_f * 1.8 + 32).round(1).to_s
            @textbox86 = (@textbox82.to_f * 7).round(1).to_s

            @textbox1 = ((@textbox81.to_f * @foakg + @textbox60.to_f*@frakg).to_f / (@foakg + @frakg)).round(1).to_s
            @textbox7 = ((@textbox82.to_f * @foakg + @textbox61.to_f*@frakg).to_f / (@foakg + @frakg)).round(1).to_s
            @textbox31 = (@textbox1.to_f * 1.8 + 32).round(1).to_s
            @textbox30 = (@textbox7.to_f * 7).round(1).to_s
            @textbox4 = ((@textbox81.to_f * @foakg + @textbox60.to_f*@frakg) / (@foakg + @frakg)).round(1).to_s
            @textbox6 = ((@textbox82.to_f * @foakg + @textbox61.to_f*@frakg) / (@foakg + @frakg)).round(1).to_s
            @textbox27 = (@textbox4.to_f * 1.8 + 32).round(1).to_s
            @textbox26 = (@textbox6.to_f * 7).round(1).to_s

            @textbox19 = @textbox6
            @textbox10 = @textbox4
            @textbox47 = (@textbox19.to_f * 7).round(1).to_s
            @textbox48 = (@textbox10.to_f * 1.8 + 32).round(1).to_s
            result.merge!({
              textbox59: @textbox59,
              textbox58: @textbox58,
              textbox87: @textbox87,
              textbox86: @textbox86,
              textbox1: @textbox1,
              textbox7: @textbox7,
              textbox31: @textbox31,
              textbox30: @textbox30,
              textbox4: @textbox4,
              textbox6: @textbox6,
              textbox27: @textbox27,
              textbox26: @textbox26,
              textbox19: @textbox19,
              textbox10: @textbox10,
              textbox47: @textbox47,
              textbox48: @textbox48
            })

          else
            @textbox31 = (@textbox1.to_f * 1.8 + 32).round(1).to_s
            @textbox30 = (@textbox7.to_f * 7).round(1).to_s

            if @checkbox19 == true
              @textbox19 = @textbox7
              @textbox10 = @textbox1
              result.merge!({textbox19: @textbox19, textbox10: @textbox10})
            end

            @textbox47 = (@textbox19.to_f * 7).round(1).to_s
            @textbox48 = (@textbox10.to_f * 1.8 + 32).round(1).to_s
            result.merge!({textbox31: @textbox31, textbox30: @textbox30, textbox47: @textbox47, textbox48: @textbox48})
          end
          @textbox5 = @textbox19
          result.merge!(textbox5: @textbox5)

          if @radiobutton9 == true
            @oatg = @textbox10.to_f + 273.15
            @energyh = @textbox50.to_f
            @xbh = @textbox5.to_f / 1000.0
            @htg = 273.15 + (3000 * @energyh / @textbox65.to_f + @textbox10.to_f * (1 + @xbh *1.86)) / (1 + @xbh *1.86)

            @textbox2 = (@htg - 273.15).round(0).to_s
            @textbox49 = (@textbox50.to_f * 1000 / 0.29307107).round(1).to_s
            result.merge!({
              textbox2: @textbox2,
              textbox49: @textbox49
            })

          elsif @radiobutton8 == true
            if (@textbox2.to_s == "-")
              @textbox2 = 140
              result.merge!({textbox2: @textbox2})
            else
              @htg = @textbox2.to_f + 273.15
              @textbox50 = (@textbox65.to_f / 3000 * ((@textbox2.to_f - @textbox10.to_f) + @textbox5.to_f / 1000.0 * 1.86 * (@textbox2.to_f - @textbox10.to_f))).round(2)

              @textbox49 = ((@htg - @oatg) / 1000 * @cf * (@fekg / 3600) * 1000 / 0.29307107).round(1).to_s
              result.merge!({textbox50: @textbox50, textbox49: @textbox49})
            end
          end
          @textbox34 = (@textbox2.to_f * 1.8 + 32).round(1).to_s
          @textbox33 = (@textbox5.to_f * 7).round(1).to_s
          result.merge!({textbox34: @textbox34, textbox33: @textbox33})

        elsif @combobox2.to_s.in?(["Recusorb 1", "Recusorb 2"])
          @textbox5 = "-"
          @textbox33 = "-"

          result.merge!({textbox5: @textbox5, textbox33: @textbox33})

          if (@combobox8.to_s == "DR-010 B" || @combobox8.to_s == "DR-20B" || @combobox8.to_s == "DR-30D" || @combobox8.to_s == "DR-40-T10" || @combobox8.to_s == "DR-40-T16" || @combobox8.to_s == "DR-50 R" || @combobox2.to_s == "Recusorb 2")
             @textbox59 = (@textbox60.to_f * 1.8 + 32).round(1).to_s
             @textbox58 = (@textbox61.to_f * 7).round(1).to_s

             @textbox1 = ((@textbox81.to_f * @foakg + @textbox60.to_f*@frakg) / (@foakg + @frakg)).round(1).to_s
             @textbox7 = ((@textbox82.to_f * @foakg + @textbox61.to_f*@frakg) / (@foakg + @frakg)).round(1).to_s
             @textbox31 = (@textbox1.to_f * 1.8 + 32).round(1).to_s
             @textbox30 = (@textbox7.to_f * 7).round(1).to_s

             @textbox87 = (@textbox81.to_f * 1.8 + 32).round(1).to_s
             @textbox86 = (@textbox82.to_f * 7).round(1).to_s

             @textbox4 = ((@textbox81.to_f * @foakg + @textbox60.to_f*@frakg) / (@foakg + @frakg)).round(1).to_s
             @textbox6 = ((@textbox82.to_f * @foakg + @textbox61.to_f*@frakg) / (@foakg + @frakg)).round(1).to_s
             @textbox27 = (@textbox4.to_f * 1.8 + 32).round(1).to_s
             @textbox26 = (@textbox6.to_f * 7).round(1).to_s

             result.merge!({
               textbox59: @textbox59,
               textbox58: @textbox58,
               textbox1: @textbox1,
               textbox7: @textbox7,
               textbox31: @textbox31,
               textbox30: @textbox30,
               textbox87: @textbox87,
               textbox86: @textbox86,
               textbox4: @textbox4,
               textbox6: @textbox6,
               textbox27: @textbox27,
               textbox26: @textbox26,
             })

             if @radiobutton9 == true
                @textbox49 = (@textbox50.to_f * 1000 / 0.29307107).round(1).to_s
                result.merge!(textbox49: @textbox49)
             end
           else
             @textbox31 = (@textbox1.to_f * 1.8 + 32).round(1).to_s
             @textbox30 = (@textbox7.to_f * 7).round(1).to_s
             result.merge!({textbox31: @textbox31, textbox30: @textbox30})

             if (@checkbox6 == true)
               @textbox4 = @textbox1
               result.merge!(textbox4: @textbox4)
             end
             if (@checkbox4 == true)
               @textbox6 = @textbox7
               result.merge!(textbox6: @textbox6)
             end
             @textbox27 = (@textbox4.to_f * 1.8 + 32).round(1).to_s
             @textbox26 = (@textbox6.to_f * 7).round(1).to_s
             result.merge!({textbox27: @textbox27, textbox26: @textbox26})

             if (@radiobutton9 == true)
               @textbox49 = (@textbox50.to_f * 1000 / 0.29307107).round(1).to_s
               result.merge!(textbox49: @textbox49)
             end
           end

           if (@radiobutton9 == true)
             @htg = (100 + 273.15)
           elsif (@radiobutton8 == true)
             if (@textbox2.to_s == "-")
               @textbox2 = 140
               result.merge!(textbox2: @textbox2)
             else
               @htg = (@textbox2.to_f) + 273.15
             end
           end
           @textbox34 = ((@htg -273.15) * 1.8 + 32).round(1).to_s
           result.merge!(textbox34: @textbox34)
        end
         @itgc = @textbox1.to_f
         @itg = @itgc + 273.15
         @itgf = @itgc * 1.8 + 32
         @svp = (98066.5 / 1000) * (10 ** (-7.90298*(373.15 / @itg - 1) + 5.02808*Math.log10(373.15 / @itg) - 0.00000013816*(10**(11.344*(1 - @itg)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @itg - 1)) - 1) + Math.log10(1.03323)))
         @xb = @textbox7.to_f / 1000.0
         @xbwbpp = @xb*@label139.to_f / 10 / (@xb+0.622)
         @xbrh = @xbwbpp / @svp * 100
         if (265.3*Math.log10((@xbwbpp * 1000) / 611) / (9.5 - Math.log10((@xbwbpp * 1000) / 611))>0)
           @xbdp = 265.3*Math.log10((@xbwbpp * 1000) / 611) / (9.5 - Math.log10((@xbwbpp * 1000) / 611)) + 2.5685647*Math.log((@xbwbpp * 1000)) - 16.999402
         else
           if (265.3*Math.log10((@xbwbpp * 1000) / 611) / (9.5 - Math.log10((@xbwbpp * 1000) / 611))<-15)
             @xbdp = 265.3*Math.log10((@xbwbpp * 1000) / 611) / (9.5 - Math.log10((@xbwbpp * 1000) / 611)) + 0.10186604*Math.log((@xbwbpp * 1000)) - 0.47448632
           else
             @xbdp = 265.3*Math.log10((@xbwbpp * 1000) / 611) / (9.5 - Math.log10((@xbwbpp * 1000) / 611))
           end
         end

         @hsvp = (98066.5 / 1000) * 10 ** (-7.90298*(373.15 / @htg - 1) + 5.02808*Math.log10(373.15 / @htg) - 0.00000013816*(10 ** (11.344*(1 - @htg)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @htg - 1)) - 1) + Math.log10(1.03323))
         @htgf = (@htg - 273.15) * 1.8 + 32
         if (@textbox5.to_s == "-")
           @xbh = (@textbox6.to_f) / 1000.0
         else
           @xbh = (@textbox5.to_f) / 1000.0
           @xbhwbpp = (@xbh)*(@label139.to_f) / 10 / ((@xbh)+0.622)
           @xbhrh = @xbhwbpp / @hsvp * 100

           if (265.3*Math.log10((@xbhwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhwbpp * 1000) / 611))>0)
             @xbhdp = 265.3*Math.log10((@xbhwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhwbpp * 1000) / 611)) + 2.5685647*Math.log((@xbhwbpp * 1000)) - 16.999402
           else
             if (265.3*Math.log10((@xbhwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhwbpp * 1000) / 611))<-15)
               @xbhdp = 265.3*Math.log10((@xbhwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhwbpp * 1000) / 611)) + 0.10186604*Math.log((@xbhwbpp * 1000)) - 0.47448632
             else
               @xbhdp = 265.3*Math.log10((@xbhwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhwbpp * 1000) / 611))
             end
           end

         end
         @ptg = (@textbox4.to_f) + 273.15
         @psvp = (98066.5 / 1000) * 10 ** (-7.90298*(373.15 / @ptg - 1) + 5.02808*Math.log10(373.15 / @ptg) - 0.00000013816*(10**(11.344*(1 - @ptg)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @ptg - 1)) - 1) + Math.log10(1.03323))
         @ptgf = (@ptg - 273.15) * 1.8 + 32
         @xbp = (@textbox6.to_f) / 1000.0
         @xbpwbpp = (@xbp)*(@label139.to_f) / 10 / ((@xbp)+0.622)
         @xbprh = @xbpwbpp / @psvp * 100

         if (265.3*Math.log10((@xbpwbpp * 1000) / 611) / (9.5 - Math.log10((@xbpwbpp * 1000) / 611))>0)
           @xbpdp = 265.3*Math.log10((@xbpwbpp * 1000) / 611) / (9.5 - Math.log10((@xbpwbpp * 1000) / 611)) + 2.5685647*Math.log((@xbpwbpp * 1000)) - 16.999402
         else
           if (265.3*Math.log10((@xbpwbpp * 1000) / 611) / (9.5 - Math.log10((@xbpwbpp * 1000) / 611))<-15)
             @xbpdp = 265.3*Math.log10((@xbpwbpp * 1000) / 611) / (9.5 - Math.log10((@xbpwbpp * 1000) / 611)) + 0.10186604*Math.log((@xbpwbpp * 1000)) - 0.47448632
           else
             @xbpdp = 265.3*Math.log10((@xbpwbpp * 1000) / 611) / (9.5 - Math.log10((@xbpwbpp * 1000) / 611))
           end
         end
         @p2tg = (@textbox4.to_f) + 273.15
         @p2svp = (98066.5 / 1000) * 10 ** (-7.90298*(373.15 / @p2tg - 1) + 5.02808*Math.log10(373.15 / @p2tg) - 0.00000013816*(10**(11.344*(1 - @p2tg)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @p2tg - 1)) - 1) + Math.log10(1.03323))
         @xbp2 = (@textbox6.to_f) / 1000.0
         @p2xoutavemix = (@textbox6.to_f) / 1000.0
         @xbp2wbpp = (@xbp2)*(@label139.to_f) / 10 / ((@xbp2)+0.622)
         @xbp2rh = @xbp2wbpp / @p2svp * 100
         if (265.3*Math.log10((@xbp2wbpp * 1000) / 611) / (9.5 - Math.log10((@xbp2wbpp * 1000) / 611))>0)
           @xbp2dp = 265.3*Math.log10((@xbp2wbpp * 1000) / 611) / (9.5 - Math.log10((@xbp2wbpp * 1000) / 611)) + 2.5685647*Math.log((@xbp2wbpp * 1000)) - 16.999402
         else
           if (265.3*Math.log10((@xbp2wbpp * 1000) / 611) / (9.5 - Math.log10((@xbp2wbpp * 1000) / 611))<-15)
             @xbp2dp = 265.3*Math.log10((@xbp2wbpp * 1000) / 611) / (9.5 - Math.log10((@xbp2wbpp * 1000) / 611)) + 0.10186604*Math.log((@xbp2wbpp * 1000)) - 0.47448632
           else
             @xbp2dp = 265.3*Math.log10((@xbp2wbpp * 1000) / 611) / (9.5 - Math.log10((@xbp2wbpp * 1000) / 611))
           end
         end
         @va = 4.555*(0.622 + (@textbox7.to_f) / 1000)*((@textbox1.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
         @fakg = ((@textbox23.to_f) * ((@textbox1.to_f) + 273.15) / 293.15 / @va)
         @vc = 4.555*(0.622 + (@textbox6.to_f) / 1000)*((@textbox4.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
         @fckg = ((@textbox22.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vc)
         @vcc = 4.555*(0.622 + (@textbox6.to_f) / 1000)*((@textbox4.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
         @fcckg = ((@textbox79.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vcc)
         if (@textbox5.to_s == "-")
           @vh = 4.555*(0.622 + (@textbox6.to_f) / 1000)*(@htg)* 101.32 / (1000 * (@label139.to_f) / 10)
           @fhkg = ((@textbox38.to_f) * (@htg) / 293.15 / @vh)
         else
           @vh = 4.555*(0.622 + (@textbox5.to_f) / 1000)*(@htg)* 101.32 / (1000 * (@label139.to_f) / 10)
           @fhkg = ((@textbox38.to_f) * (@htg) / 293.15 / @vh)
         end
         @vra = 4.555*(0.622 + (@textbox61.to_f) / 1000)*((@textbox60.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
         @frakg = ((@textbox80.to_f) * ((@textbox60.to_f) + 273.15) / 293.15 / @vra)
         @voa = 4.555*(0.622 + (@textbox82.to_f) / 1000)*((@textbox81.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
         @foakg = ((@textbox76.to_f) * ((@textbox81.to_f) + 273.15) / 293.15 / @voa)
         @ve = 4.555*(0.622 + (@textbox19.to_f) / 1000)*((@textbox10.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
         @fekg = ((@textbox65.to_f) * ((@textbox10.to_f) + 273.15) / 293.15 / @ve)

        if (@radiobutton1 == true)
         if ((@combobox2.to_s) == "1:1" || (@combobox2.to_s) == "1:3")
         elsif ((@combobox2.to_s) == "1:1:3" || (@combobox2.to_s) == "1:1:6")
         elsif ((@combobox2.to_s) == "1:3:9")
         elsif ((@combobox2.to_s) == "Consorb")

           if ((@combobox8.to_s) == "CS-5" || (@combobox8.to_s) == "CS-5L")

             @textbox88 = ((@textbox80.to_f) / 1.699).round(0).to_s
             @frakg = ((@textbox80.to_f) * ((@textbox60.to_f) + 273.15) / 293.15 / @vra)

             unless flow_rate_remained?(change_unit)
               @textbox23 = (@frakg * @va * (273.15 + 20) / (273.15 + (@textbox1.to_f))).round(1).to_s
               @textbox29 = ((@textbox23.to_f) / 1.699).round(1).to_s
             end
             @textboxd = ((@textbox23.to_f) / 3600 / @csa).round(1).to_s
             @textbox89 = @textboxd == Float::INFINITY ? Float::INFINITY : ((@textboxd.to_f) / 0.00508).round(1).to_s
             @fakg = ((@textbox23.to_f) * ((@textbox1.to_f) + 273.15) / 293.15 / @va)


             @textbox85 = ((@textbox76.to_f) / 1.699).round(1).to_s
             @foakg = ((@textbox76.to_f) * ((@textbox81.to_f) + 273.15) / 293.15 / @voa)

             @textbox79 = (@foakg * @vcc * (273.15 + 20) / (273.15 + (@textbox4.to_f))).round(0).to_s
             @textbox78 = ((@textbox79.to_f) / 1.699).round(1).to_s


             @textbox65 = @textbox79
             @textbox83 = ((@textbox65.to_f) / 1.699).round(1).to_s
             @fekg = ((@textbox65.to_f) * ((@textbox10.to_f) + 273.15) / 293.15 / @ve)
           else
             @textboxd = ((@textbox23.to_f) / 3600 / @csa).round(1).to_s
             @textbox29 = ((@textbox23.to_f) / 1.699).round(1).to_s unless flow_rate_remained?(change_unit)
             @textbox89 = @textboxd == Float::INFINITY ? Float::INFINITY : ((@textboxd.to_f) / 0.00508).round(1).to_s
             @fakg = ((@textbox23.to_f) * ((@textbox1.to_f) + 273.15) / 293.15 / @va)

             @textbox83 = ((@textbox65.to_f) / 1.699).round(1).to_s
             @fekg = ((@textbox65.to_f) * ((@textbox10.to_f) + 273.15) / 293.15 / @ve)
           end

           @textbox38 = (@fekg * @vh * (273.15 + 20) / (273.15 + (@textbox2.to_f))).round(1).to_s
           @textboxe = ((@textbox38.to_f) / 3600 / @csh).round(1).to_s
           @textbox32 = ((@textbox38.to_f) / 1.699).round(1).to_s
           @textbox90 = @textboxe == Float::INFINITY ? Float::INFINITY : ((@textboxe.to_f) / 0.00508).round(1).to_s
           @fhkg = ((@textbox38.to_f) * (@htg) / 293.15 / @vh)

         elsif ((@combobox2.to_s) == "Recusorb 1" || (@combobox2.to_s) == "Recusorb 2")

           if ((@combobox8.to_s) == "DR-010 B" || (@combobox8.to_s) == "DR-20B" || (@combobox8.to_s) == "DR-30D" || (@combobox8.to_s) == "DR-40-T10" || (@combobox8.to_s) == "DR-40-T16" || (@combobox8.to_s) == "DR-50 R" || (@combobox2.to_s) == "Recusorb 2")


             @textbox88 = ((@textbox80.to_f) / 1.699).round(1).to_s
             @frakg = ((@textbox80.to_f) * ((@textbox60.to_f) + 273.15) / 293.15 / @vra)
             unless flow_rate_remained?(change_unit)
               @textbox23 = (@frakg * @va * (273.15 + 20) / (273.15 + (@textbox1.to_f))).round(1).to_s
               @textbox29 = ((@textbox23.to_f) / 1.699).round(1).to_s
             end
             @textboxd = ((@textbox23.to_f) / 3600 / @csa).round(1).to_s
             @textbox89 = @textboxd == Float::INFINITY ? Float::INFINITY : ((@textboxd.to_f) / 0.00508).round(1).to_s
             @fakg = ((@textbox23.to_f) * ((@textbox1.to_f) + 273.15) / 293.15 / @va)

             @textbox85 = ((@textbox76.to_f) / 1.699).round(1).to_s
             @foakg = ((@textbox76.to_f) * ((@textbox81.to_f) + 273.15) / 293.15 / @voa)

             @textbox79 = (@foakg * @vcc * (273.15 + 20) / (273.15 + (@textbox4.to_f))).round(12).round(0).to_s
             @textbox78 = ((@textbox79.to_f) / 1.699).round(1).to_s
             @fcckg = ((@textbox79.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vcc)

             raise "textbox66 is not number" if @textbox66.to_s == "" || !@textbox66.match(Settings.regex.float_number)

             @textbox22 = ((@textbox79.to_f) - (@textbox79.to_f) * (@textbox66.to_f) / 100 - (@textbox79.to_f) * (@textbox67.to_f) / 100).round(0).to_s
             @textbox16 = ((@textbox22.to_f) / 3600 / @csp).round(1).to_s
             @textbox28 = ((@textbox22.to_f) / 1.699).round(1).to_s
             @textbox91 = ((@textbox16.to_f) / 0.00508).round(1).to_s
             @fckg = ((@textbox22.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vc)

           else

             @textboxd = ((@textbox23.to_f) / 3600 / @csa).round(1).to_s
             @textbox29 = ((@textbox23.to_f) / 1.699).round(1).to_s unless flow_rate_remained?(change_unit)
             @textbox89 = @textboxd == Float::INFINITY ? Float::INFINITY : ((@textboxd.to_f) / 0.00508).round(1).to_s
             @fakg = ((@textbox23.to_f) * ((@textbox1.to_f) + 273.15) / 293.15 / @va)
             @textbox78 = ((@textbox79.to_f) / 1.699).round(1).to_s
             @fcckg = ((@textbox79.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vcc)

             raise "textbox66 is not number" if @textbox66.to_s == "" || !@textbox66.match(Settings.regex.float_number)

             @textbox22 = ((@textbox79.to_f) - (@textbox79.to_f) * (@textbox66.to_f) / 100 - (@textbox79.to_f) * (@textbox67.to_f) / 100).round(0).to_s
             @textbox16 = ((@textbox22.to_f) / 3600 / @csp).round(1).to_s
             @textbox28 = ((@textbox22.to_f) / 1.699).round(1).to_s
             @textbox91 = ((@textbox16.to_f) / 0.00508).round(1).to_s
             @fckg = ((@textbox22.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vc)

           end

           @textbox38 = (@fcckg * @vh * (273.15 + 20) / (@htg)).round(0).to_s
           @textboxe = ((@textbox38.to_f) / 3600 / @csh).round(1).to_s
           @textbox32 = ((@textbox38.to_f) / 1.699).round(1).to_s
           @textbox90 = @textboxe == Float::INFINITY ? Float::INFINITY : ((@textboxe.to_f) / 0.00508).round(1).to_s
           @fhkg = ((@textbox38.to_f) * (@htg) / 293.15 / @vh)
         end
        elsif (@radiobutton2 == true)

         if ((@combobox2.to_s) == "1:1" || (@combobox2.to_s) == "1:3")
         elsif ((@combobox2.to_s) == "1:1:3" || (@combobox2.to_s) == "1:1:6")
         elsif ((@combobox2.to_s) == "1:3:9")
         end
        end

      elsif @radiobutton6 == true
        @textbox50 = ((@textbox49.to_f) / 1000 * 0.29307107).round(2)

         if (@textbox34 != "-")
           @textbox2 = (((@textbox34.to_f) - 32) / 1.8).round(1).to_s
         end

         if ((@combobox2.to_s) == "Consorb")
           if ((@combobox8.to_s) == "CS-5" || (@combobox8.to_s) == "CS-5L")
             @textbox60 = (((@textbox59.to_f) - 32) / 1.8).round(1).to_s
             @textbox61 = ((@textbox58.to_f) / 7).round(1).to_s

             @textbox80 = ((@textbox88.to_f) * 1.699).round(0).to_s
             @frakg = ((@textbox80.to_f) * ((@textbox60.to_f) + 273.15) / 293.15 / @vra)

             if @textbox87.to_s == ""
               raise "textbox87 is blank"
             end
             @textbox81 = (((@textbox87.to_f) - 32) / 1.8).round(1).to_s
             if @textbox86.to_s == ""
               raise "textbox86 is blank"
             end
             @textbox82 = ((@textbox86.to_f) / 7).round(1).to_s

             @textbox76 = ((@textbox85.to_f) * 1.699).round(1).to_s
             @foakg = ((@textbox76.to_f) * ((@textbox81.to_f) + 273.15) / 293.15 / @voa)

             if @textbox87.to_s == ""
               raise "textbox87 is blank"
             end

             @textbox31 = (((@textbox87.to_f) * @foakg + (@textbox59.to_f)*@frakg) / (@foakg + @frakg)).round(1).to_s

             if @textbox86.to_s == ""
               raise "textbox86 is blank"
             end

             @textbox30 = (((@textbox86.to_f) * @foakg + (@textbox58.to_f)*@frakg) / (@foakg + @frakg)).round(1).to_s

             @textbox1 = (((@textbox31.to_f) - 32) / 1.8).round(1).to_s
             @textbox7 = ((@textbox30.to_f) / 7).round(1).to_s

             unless flow_rate_remained?(change_unit)
               @textbox29 = ((@textbox88.to_f)).round(1).to_s
               @textbox23 = ((@textbox29.to_f) * 1.699).round(1).to_s
             end
             @textboxd = ((@textbox23.to_f) / 3600 / @csa).round(1).to_s
             @textbox89 = @textboxd == Float::INFINITY ? Float::INFINITY : ((@textboxd.to_f) / 0.00508).round(1).to_s
             @fakg = ((@textbox23.to_f) * ((@textbox1.to_f) + 273.15) / 293.15 / @va)

             if @textbox87.to_s == ""
               raise "textbox87 is blank"
             end

             @textbox27 = (((@textbox87.to_f) * @foakg + (@textbox59.to_f)*@frakg) / (@foakg + @frakg)).round(1).to_s

             if @textbox86.to_s == ""
               raise "textbox86 is blank"
             end

             @textbox26 = (((@textbox86.to_f) * @foakg + (@textbox58.to_f)*@frakg) / (@foakg + @frakg)).round(1).to_s
             @textbox4 = (((@textbox27.to_f)) * 1.8 + 32).round(1).to_s
             @textbox6 = ((@textbox26.to_f) * 7).round(1).to_s

             @textbox79 = ((@textbox78.to_f) * 1.699).round(1).to_s
             @fcckg = ((@textbox79.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vcc)

             @textbox65 = @textbox79
             @textbox83 = ((@textbox65.to_f) / 1.699).round(1).to_s
             @fekg = ((@textbox65.to_f) * ((@textbox10.to_f) + 273.15) / 293.15 / @ve)
             result.merge!({ textbox60: @textbox60, textbox61: @textbox61, textbox80: @textbox80, textbox81: @textbox81, textbox82: @textbox82, textbox76: @textbox76, textbox31: @textbox31, textbox30: @textbox30, textbox1: @textbox1, textbox7: @textbox7, textbox29: @textbox29, textbox23: @textbox23, textboxd: @textboxd, textbox89: @textbox89, textbox27: @textbox27, textbox26: @textbox26, textbox4: @textbox4, textbox6: @textbox6, textbox79: @textbox79, textbox65: @textbox65, textbox83: @textbox83})
           else
             @textbox1 = (((@textbox31.to_f) - 32) / 1.8).round(2)
             @textbox7 = ((@textbox30.to_f) / 7).round(3)

             @textboxd = ((@textbox29.to_f)*1.699 / 3600 / @csa).round(1).to_s
             @textbox89 = @textboxd == Float::INFINITY ? Float::INFINITY : ((@textboxd.to_f) / 0.00508).round(1).to_s
             @textbox23 = ((@textbox29.to_f) *1.699).round(1).to_s unless flow_rate_remained?(change_unit)
             @va = 4.555*(0.622 + (@textbox7.to_f) / 1000)*((@textbox1.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
             @fakg = ((@textbox23.to_f) * ((@textbox1.to_f) + 273.15) / 293.15 / @va)

             @textbox26 = @textbox30
             @textbox27 = @textbox31
             @textbox6 = ((@textbox26.to_f) / 7).round(3)
             @textbox4 = (((@textbox27.to_f) - 32) / 1.8).round(1).to_s

             result.merge!({ textbox1: @textbox1, textbox7: @textbox7, textboxd: @textboxd, textbox89: @textbox89, textbox23: @textbox23, textbox26: @textbox26, textbox27: @textbox27, textbox6: @textbox6, textbox4: @textbox4})
           end

           @textbox65 = ((@textbox83.to_f) *1.699).round(1).to_s
           @textbox38 = @textbox65

           if (@checkbox19 == true)
             @textbox47 = @textbox30
             @textbox48 = @textbox31
             result.merge!(textbox47: @textbox47, textbox48: @textbox48)
           end
           @textbox19 = ((@textbox47.to_f) / 7).round(3)
           @textbox10 = (((@textbox48.to_f) - 32) / 1.8).round(1).to_s
           @ve = 4.555*(0.622 + (@textbox19.to_f) / 1000)*((@textbox10.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
           @fekg = ((@textbox65.to_f) * ((@textbox10.to_f) + 273.15) / 293.15 / @ve)
           @textbox33 = @textbox47
           @textbox5 = ((@textbox33.to_f) / 7).round(3)

           result.merge!({textbox65: @textbox65, textbox38: @textbox38, textbox19: @textbox19, textbox10: @textbox10, textbox33: @textbox33, textbox5: @textbox5})

           if (@radiobutton9 == true)
             @oatg = (@textbox10.to_f) + 273.15
             @textbox50 = ((@textbox49.to_f) / 1000 * 0.29307107).round(2)
             @energyh = (@textbox50)
             @xbh = (@textbox5.to_f) / 1000.0
             @htg = 273.15 + (3000 * @energyh / @textbox65.to_f + @textbox10.to_f * (1 + @xbh *1.86)) / (1 + @xbh *1.86)
             @textbox2 = (@htg - 273.15).round(1).to_s
             @textbox34 = ((@htg - 273.15) * 1.8 + 32).round(1).to_s
             result.merge!({textbox50: @textbox50, textbox2: @textbox2, textbox34: @textbox34})
           elsif (@radiobutton8 == true)
             if (@textbox2.to_s == "-")
               @textbox2 = 140
               result.merge!({textbox2: @textbox2})
             else
               @oatg = (@textbox10.to_f) + 273.15
               @htg = (@textbox2.to_f) + 273.15
               @textbox50 = (@textbox65.to_f / 3000 * ((@textbox2.to_f - @textbox10.to_f) + @textbox5.to_f / 1000.0 * 1.86 * (@textbox2.to_f - @textbox10.to_f))).round(2)
               @textbox49 = ((@htg - @oatg) / 1000 * @cf * (@fekg / 3600) * 1000 / 0.29307107).round(1).to_s
               result.merge!({textbox50: textbox50})
             end
           end

           @textbox38 = ((@textbox32.to_f) * 1.699).round(1).to_s
           @textboxe = ((@textbox38.to_f) / 3600 / @csh).round(1).to_s
           @textbox90 = @textboxe == Float::INFINITY ? Float::INFINITY : ((@textboxe.to_f) / 0.00508).round(1).to_s
           @fhkg = ((@textbox38.to_f) * (@htg) / 293.15 / @vh)
         elsif ((@combobox2.to_s) == "Recusorb 1" || (@combobox2.to_s) == "Recusorb 2")

           if ((@combobox8.to_s) == "DR-010 B" || (@combobox8.to_s) == "DR-20B" || (@combobox8.to_s) == "DR-30D" || (@combobox8.to_s) == "DR-40-T10" || (@combobox8.to_s) == "DR-40-T16" || (@combobox8.to_s) == "DR-50 R" || (@combobox2.to_s) == "Recusorb 2")
             @textbox80 = ((@textbox88.to_f) * 1.699).round(1).to_s
             @frakg = ((@textbox80.to_f) * ((@textbox60.to_f) + 273.15) / 293.15 / @vra)
             raise "Textbox 86 or textbox 87 is blank" if @textbox86.blank? || @textbox87.blank?
             @textbox81 = (((@textbox87.to_f) - 32) / 1.8).round(1).to_s
             @textbox82 = ((@textbox86.to_f) / 7).round(1).to_s

             @textbox76 = ((@textbox85.to_f) * 1.699).round(1).to_s
             @foakg = ((@textbox76.to_f) * ((@textbox81.to_f) + 273.15) / 293.15 / @voa)

             @textbox31 = (((@textbox87.to_f) * @foakg + (@textbox59.to_f)*@frakg) / (@foakg + @frakg)).round(1).to_s
             @textbox30 = (((@textbox86.to_f) * @foakg + (@textbox58.to_f)*@frakg) / (@foakg + @frakg)).round(1).to_s
             @textbox1 = (((@textbox31.to_f) - 32) / 1.8).round(2)
             @textbox7 = ((@textbox30.to_f) / 7).round(1).to_s

             unless flow_rate_remained?(change_unit)
               @textbox29 = ((@textbox88.to_f)).round(1).to_s
               @textbox23 = ((@textbox29.to_f) * 1.699).round(1).to_s
             end
             @textboxd = ((@textbox23.to_f) / 3600 / @csa).round(1).to_s
             @textbox89 = @textboxd == Float::INFINITY ? Float::INFINITY : ((@textboxd.to_f) / 0.00508).round(1).to_s
             @fakg = ((@textbox23.to_f) * ((@textbox1.to_f) + 273.15) / 293.15 / @va)

             @textbox27 = (((@textbox87.to_f) * @foakg + (@textbox59.to_f)*@frakg) / (@foakg + @frakg)).round(1).to_s
             @textbox26 = (((@textbox86.to_f) * @foakg + (@textbox58.to_f)*@frakg) / (@foakg + @frakg)).round(1).to_s
             @textbox79 = ((@textbox76.to_f)).round(1).to_s
             @textbox78 = ((@textbox79.to_f) / 1.699).round(1).to_s
             @fcckg = ((@textbox79.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vcc)

             raise "textbox66 is not number" if @textbox66.to_s == "" || !@textbox66.match(Settings.regex.float_number)

             @textbox22 = ((@textbox79.to_f) - (@textbox79.to_f) * (@textbox66.to_f) / 100 - (@textbox79.to_f) * (@textbox67.to_f) / 100).round(0).to_s
             @textbox16 = ((@textbox22.to_f) / 3600 / @csp).round(1).to_s
             @textbox28 = ((@textbox22.to_f) / 1.699).round(1).to_s
             @textbox91 = ((@textbox16.to_f) / 0.00508).round(1).to_s
             @fckg = ((@textbox22.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vc)
           else
             @textbox1 = (((@textbox31.to_f) - 32) / 1.8).round(2)
             @textbox7 = ((@textbox30.to_f) / 7).round(1).to_s
             @textbox23 = ((@textbox29.to_f) * 1.699).round(1).to_s unless flow_rate_remained?(change_unit)
             @textboxd = ((@textbox23.to_f) / 3600 / @csa).round(1).to_s
             @textbox89 = @textboxd == Float::INFINITY ? Float::INFINITY : ((@textboxd.to_f) / 0.00508).round(1).to_s
             @fakg = ((@textbox23.to_f) * ((@textbox1.to_f) + 273.15) / 293.15 / @va)

             if (@checkbox4 == true)
               @textbox26 = @textbox30
             end
             if (@checkbox6 == true)
               @textbox27 = @textbox31
             end
             @textbox6 = ((@textbox26.to_f) / 7).round(1).to_s
             @textbox4 = (((@textbox27.to_f) - 32) / 1.8).round(1).to_s

             @textbox79 = ((@textbox78.to_f) * 1.699).round(1).to_s
             @fcckg = ((@textbox79.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vcc)

             raise "textbox66 is not number" if @textbox66.to_s == "" || !@textbox66.match(Settings.regex.float_number)

             @textbox22 = ((@textbox79.to_f) - (@textbox79.to_f) * (@textbox66.to_f) / 100 - (@textbox79.to_f) * (@textbox67.to_f) / 100).round(0).to_s
             @textbox16 = ((@textbox22.to_f) / 3600 / @csp).round(1).to_s
             @textbox28 = ((@textbox22.to_f) / 1.699).round(1).to_s
             @textbox91 = ((@textbox16.to_f) / 0.00508).round(1).to_s
             @fckg = ((@textbox22.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vc)

           end
           if (@checkbox19 == true)
             @textbox47 = @textbox30
             @textbox48 = @textbox31
           end
           @textbox19 = ((@textbox47.to_f) / 7).round(1).to_s
           @textbox10 = (((@textbox48.to_f) - 32) / 1.8).round(1).to_s

           if (@radiobutton9 == true)
             @oatg = (@textbox10.to_f) + 273.15
             @textbox50 = ((@textbox49.to_f) / 1000 * 0.29307107).round(2)
             @energyh = (@textbox50)
             @xbh = (@textbox5.to_f) / 1000.0
             @htg = @oatg + @energyh * 1000 / @cf / (@fekg / 3600)

           elsif (@radiobutton8 == true)
             if (@textbox2.to_s == "-")
               @textbox2 = 140
               @textbox34 = (((@textbox2.to_f)) * 1.8 + 32).round(1).to_s
             else
               @textbox2 = (((@textbox34.to_f) - 32) / 1.8).round(1).to_s
               @htg = (@textbox2.to_f) + 273.15
             end
           end
           @textbox33 = @textbox47
           @textbox5 = ((@textbox33.to_f) / 7).round(1).to_s

           @textbox38 = ((@textbox32.to_f) * 1.699).round(1).to_s
           @textboxe = ((@textbox38.to_f) / 3600 / @csh).round(1).to_s
           @textbox90 = @textboxe == Float::INFINITY ? Float::INFINITY : ((@textboxe.to_f) / 0.00508).round(1).to_s
           @fhkg = ((@textbox38.to_f) * (@htg) / 293.15 / @vh)
         end

         @itgc = @textbox1.to_f
         @itg = @itgc + 273.15
         @itgf = @itgc * 1.8 + 32
         @svp = (98066.5 / 1000) * (10 ** (-7.90298*(373.15 / @itg - 1) + 5.02808*Math.log10(373.15 / @itg) - 0.00000013816*(10**(11.344*(1 - @itg)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @itg - 1)) - 1) + Math.log10(1.03323)))
         @xb = (@textbox7.to_f) / 1000.0
         @xbwbpp = (@xb)*(@label139.to_f) / 10 / ((@xb)+0.622)
         @xbrh = @xbwbpp / @svp * 100

         if (265.3*Math.log10((@xbwbpp * 1000) / 611) / (9.5 - Math.log10((@xbwbpp * 1000) / 611))>0)
           @xbdp = 265.3*Math.log10((@xbwbpp * 1000) / 611) / (9.5 - Math.log10((@xbwbpp * 1000) / 611)) + 2.5685647*Math.log((@xbwbpp * 1000)) - 16.999402
          else
           if (265.3*Math.log10((@xbwbpp * 1000) / 611) / (9.5 - Math.log10((@xbwbpp * 1000) / 611))<-15)
             @xbdp = 265.3*Math.log10((@xbwbpp * 1000) / 611) / (9.5 - Math.log10((@xbwbpp * 1000) / 611)) + 0.10186604*Math.log((@xbwbpp * 1000)) - 0.47448632
           else
             @xbdp = 265.3*Math.log10((@xbwbpp * 1000) / 611) / (9.5 - Math.log10((@xbwbpp * 1000) / 611))
           end
          end

         @hsvp = (98066.5 / 1000) * 10 ** (-7.90298*(373.15 / @htg - 1) + 5.02808*Math.log10(373.15 / @htg) - 0.00000013816*(10 ** (11.344*(1 - @htg)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @htg - 1)) - 1) + Math.log10(1.03323))
         @htgf = (@htg - 273.15) * 1.8 + 32
         @xbh = (@textbox5.to_f) / 1000.0
         @xbhwbpp = (@xbh)*(@label139.to_f) / 10 / ((@xbh)+0.622)
         @xbhrh = @xbhwbpp / @hsvp * 100

         if (265.3*Math.log10((@xbhwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhwbpp * 1000) / 611))>0)
           @xbhdp = 265.3*Math.log10((@xbhwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhwbpp * 1000) / 611)) + 2.5685647*Math.log((@xbhwbpp * 1000)) - 16.999402
         else
           if (265.3*Math.log10((@xbhwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhwbpp * 1000) / 611))<-15)
             @xbhdp = 265.3*Math.log10((@xbhwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhwbpp * 1000) / 611)) + 0.10186604*Math.log((@xbhwbpp * 1000)) - 0.47448632
           else
             @xbhdp = 265.3*Math.log10((@xbhwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhwbpp * 1000) / 611))
           end
         end

        @ptg = (@textbox4.to_f) + 273.15
        @psvp = (98066.5 / 1000) * 10 ** (-7.90298*(373.15 / @ptg - 1) + 5.02808*Math.log10(373.15 / @ptg) - 0.00000013816*(10**(11.344*(1 - @ptg)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @ptg - 1)) - 1) + Math.log10(1.03323))
        @ptgf = (@ptg - 273.15) * 1.8 + 32
        @xbp = (@textbox6.to_f) / 1000.0
        @xbpwbpp = (@xbp)*(@label139.to_f) / 10 / ((@xbp)+0.622)
        @xbprh = @xbpwbpp / @psvp * 100

         if (265.3*Math.log10((@xbpwbpp * 1000) / 611) / (9.5 - Math.log10((@xbpwbpp * 1000) / 611))>0)
           @xbpdp = 265.3*Math.log10((@xbpwbpp * 1000) / 611) / (9.5 - Math.log10((@xbpwbpp * 1000) / 611)) + 2.5685647*Math.log((@xbpwbpp * 1000)) - 16.999402
          else
           if (265.3*Math.log10((@xbpwbpp * 1000) / 611) / (9.5 - Math.log10((@xbpwbpp * 1000) / 611))<-15)
             @xbpdp = 265.3*Math.log10((@xbpwbpp * 1000) / 611) / (9.5 - Math.log10((@xbpwbpp * 1000) / 611)) + 0.10186604*Math.log((@xbpwbpp * 1000)) - 0.47448632
           else
             @xbpdp = 265.3*Math.log10((@xbpwbpp * 1000) / 611) / (9.5 - Math.log10((@xbpwbpp * 1000) / 611))
           end
          end

        @p2tg = (@textbox4.to_f) + 273.15
        @p2svp = (98066.5 / 1000) * 10 ** (-7.90298*(373.15 / @p2tg - 1) + 5.02808*Math.log10(373.15 / @p2tg) - 0.00000013816*(10**(11.344*(1 - @p2tg)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @p2tg - 1)) - 1) + Math.log10(1.03323))
        @xbp2 = (@textbox6.to_f) / 1000.0
        @p2xoutavemix = (@textbox6.to_f) / 1000.0
        @xbp2wbpp = (@xbp2)*(@label139.to_f) / 10 / ((@xbp2)+0.622)
        @xbp2rh = @xbp2wbpp / @p2svp * 100

        if (265.3*Math.log10((@xbp2wbpp * 1000) / 611) / (9.5 - Math.log10((@xbp2wbpp * 1000) / 611))>0)
         @xbp2dp = 265.3*Math.log10((@xbp2wbpp * 1000) / 611) / (9.5 - Math.log10((@xbp2wbpp * 1000) / 611)) + 2.5685647*Math.log((@xbp2wbpp * 1000)) - 16.999402
        else
         if (265.3*Math.log10((@xbp2wbpp * 1000) / 611) / (9.5 - Math.log10((@xbp2wbpp * 1000) / 611))<-15)
           @xbp2dp = 265.3*Math.log10((@xbp2wbpp * 1000) / 611) / (9.5 - Math.log10((@xbp2wbpp * 1000) / 611)) + 0.10186604*Math.log((@xbp2wbpp * 1000)) - 0.47448632
         else
           @xbp2dp = 265.3*Math.log10((@xbp2wbpp * 1000) / 611) / (9.5 - Math.log10((@xbp2wbpp * 1000) / 611))
         end
        end

         @itgf = (@textbox31.to_f)
         @itg = (@itgf - 32) / 1.8 + 273.15
         @svp = (98066.5 / 1000) * 10 ** (-7.90298*(373.15 / @itg - 1) + 5.02808*Math.log10(373.15 / @itg) - 0.00000013816*(10**(11.344*(1 - @itg)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @itg - 1)) - 1) + Math.log10(1.03323))
         @itgc = (@itgf - 32) / 1.8

         if (@textbox34.to_s != "-")
           @htgf = (@textbox34.to_f)
         end
         @htg = (@htgf - 32) / 1.8 + 273.15
         @hsvp = (98066.5 / 1000) * 10 ** (-7.90298*(373.15 / @htg - 1) + 5.02808*Math.log10(373.15 / @htg) - 0.00000013816*(10 ** (11.344*(1 - @htg)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @htg - 1)) - 1) + Math.log10(1.03323))

         @ptgf = (@textbox27 .to_f)
         @ptg = (@ptgf - 32) / 1.8 + 273.15
         @psvp = (98066.5 / 1000) * 10 ** (-7.90298*(373.15 / @ptg - 1) + 5.02808*Math.log10(373.15 / @ptg) - 0.00000013816*(10**(11.344*(1 - @ptg)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @ptg - 1)) - 1) + Math.log10(1.03323))

         @va = 4.555*(0.622 + (@textbox7.to_f) / 1000)*((@textbox1.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
         @fakg = ((@textbox23.to_f) * ((@textbox1.to_f) + 273.15) / 293.15 / @va)
         @vc = 4.555*(0.622 + (@textbox6.to_f) / 1000)*((@textbox4.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
         @fckg = ((@textbox22.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vc)
         @vcc = 4.555*(0.622 + (@textbox6.to_f) / 1000)*((@textbox4.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
         @fcckg = ((@textbox79.to_f) * ((@textbox4.to_f) + 273.15) / 293.15 / @vcc)
         @vh = 4.555*(0.622 + (@textbox5.to_f) / 1000)*(@htg)* 101.32 / (1000 * (@label139.to_f) / 10)
         @fhkg = ((@textbox38.to_f) * (@htg) / 293.15 / @vh)
         @vra = 4.555*(0.622 + (@textbox61.to_f) / 1000)*((@textbox60.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
         @frakg = ((@textbox80.to_f) * ((@textbox60.to_f) + 273.15) / 293.15 / @vra)
         @voa = 4.555*(0.622 + (@textbox82.to_f) / 1000)*((@textbox81.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
         @foakg = ((@textbox76.to_f) * ((@textbox81.to_f) + 273.15) / 293.15 / @voa)
         @ve = 4.555*(0.622 + (@textbox19.to_f) / 1000)*((@textbox10.to_f) + 273.15) * 101.32 / (1000 * (@label139.to_f) / 10)
         @fekg = ((@textbox65.to_f) * ((@textbox10.to_f) + 273.15) / 293.15 / @ve)

      end
      @textbox42 = @xbdp.round(1).to_s
      @textbox41 = @xbrh.round(1).to_s
      if (@textbox5 != "-")
        @textbox46 = @xbhdp.round(1).to_s
        @textbox45 = @xbhrh.round(1).to_s
      end

      @textbox40 = @xbpdp.round(1).to_s
      @textbox39 = @xbprh.round(1).to_s
      @label139 = (((44.331514 - @textbox77.to_f / 1000) / 11.880516) ** 5.255877).round(1).to_s

      if @radiobutton10
        @ptg_c2 = (@textbox81.to_f) + 273.15
        @psvp_c2 = (98066.5 / 1000) * 10 ** (-7.90298*(373.15 / @ptg_c2 - 1) + 5.02808*Math.log10(373.15 / @ptg_c2) - 0.00000013816*(10**(11.344*(1 - @ptg_c2)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @ptg_c2 - 1)) - 1) + Math.log10(1.03323))
        @xbp_c2 = (@textbox82.to_f) / 1000.0
        @xbpwbpp_c2 = (@xbp_c2)*(@label139.to_f) / 10 / ((@xbp_c2)+0.622)
        @xbprh_c2 = @xbpwbpp_c2 / @psvp_c2 * 100
        @textbox101 = @xbprh_c2.round(1).to_s

        @ptg_a1 = (@textbox60.to_f) + 273.15
        @psvp_a1 = (98066.5 / 1000) * 10 ** (-7.90298*(373.15 / @ptg_a1 - 1) + 5.02808*Math.log10(373.15 / @ptg_a1) - 0.00000013816*(10**(11.344*(1 - @ptg_a1)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @ptg_a1 - 1)) - 1) + Math.log10(1.03323))
        @xbp_a1 = (@textbox61.to_f) / 1000.0
        @xbpwbpp_a1 = (@xbp_a1)*(@label139.to_f) / 10 / ((@xbp_a1)+0.622)
        @xbprh_a1 = @xbpwbpp_a1 / @psvp_a1 * 100
        @textbox102 = @xbprh_a1.round(1).to_s
      end

      @ptg_e = (@textbox10.to_f) + 273.15
      @psvp_e = (98066.5 / 1000) * 10 ** (-7.90298*(373.15 / @ptg_e - 1) + 5.02808*Math.log10(373.15 / @ptg_e) - 0.00000013816*(10**(11.344*(1 - @ptg_e)) - 1) + 0.0081328*(10**(-3.49149*(373.15 / @ptg_e - 1)) - 1) + Math.log10(1.03323))
      @xbp_e = (@textbox19.to_f) / 1000.0
      @xbpwbpp_e = (@xbp_e)*(@label139.to_f) / 10 / ((@xbp_e)+0.622)
      @xbprh_e = @xbpwbpp_e / @psvp_e * 100
      @textbox103 = @xbprh_e.round(1).to_s

      @iu = (@textboxd.to_f)
      @uh = (@textboxe.to_f)
      @up = (@textbox16.to_f)
      @up2 = ((@textbox79.to_f) * (@textbox67.to_f) / 100 / 3600 / @csp2) rescue 0

      @oatg = (@textbox10.to_f) + 273.15
      @xboa = (@textbox19.to_f) / 1000.0

      if (@textbox5.to_s == "-")
       @xbh = (@textbox19.to_f) / 1000.0
      else
       @xbh = (@textbox5.to_f) / 1000.0
      end

      @rph = (@textbox8.to_f)

      @adiv = (@textbox9.to_f)
      @hdiv = (@textbox11.to_f)
      @pdiv = (@textbox15.to_f)
      @p2div = 360 * (@textbox71.to_f) / 100

      result.merge!({textbox42: @textbox42, textbox41: @textbox41, textbox40: @textbox40, textbox39: @textbox39, label139: @label139})

      if @textbox62.to_f <= 5 && @textbox62.to_f > 0
        @textbox62_backcolor = "Color::Yellow"
      elsif @textbox62.to_f <= 0
        @textbox62_backcolor = "Color::Red"
      else
        @textbox62_backcolor = "Color::White"
      end

      result.merge!(textbox62_backcolor: @textbox62_backcolor)
    rescue
      @flagini = 0
      @flaginput = 0
    end
    @okinput = 1
    okrange
    @okinput = 0
    @flaginput = 0
    @flagini = 0
  end

  def flow_rate_remained? change_unit
    change_unit && @checkbox23
  end
end