module UnitSelection::DetCoef
  def det_coef
    @vaf = ((8E-08*(@itg**3)) - (3E-05*(@itg**2)) + (0.0603*@itg) + 2.306)*1E-06
    @df = Math.exp(Math.log(0.187*1E-05) + 2.072*Math.log(@itg)) / 1000;
    @ref = @iuu * @de / (15.83*1E-06);
    @scf = @vaf / ((@dens1*273.15 / @itg)*@df);
    @var = ((8E-08*(@htg**3)) - (3E-05*(@htg**2)) + (0.0603*@htg) + 2.306)*1E-06;
    @dr = Math.exp(Math.log(0.187*1E-05) + 2.072*Math.log(@htg)) / 1000;
    @rer = @uuh*@de / (15.83*1E-06);
    @scr = @var / ((@dens1*273.15 / @htg)*@dr);
    @apre = @label139.to_f;

    if (@checkbox22 == true)
      @coefrotor = @label161.to_f + 5;
      coef_rotor
    else
      if (@combobox3.to_s == "SSCR AS-31")
        if (@flag1 == 2)
          if (@combobox4 == "400")
            @coefrotor = 24 + 5;
          else
            @coefrotor = 5 + 5;
          end
          coef_rotor
        elsif (@flag1 == 1 || @flag1 == 7)
          @coefrotor = 17 + 5;
          coef_rotor
        elsif (@flag1 == 4)
          if (@combobox4 == "400")
            @coefrotor = 18 + 5;
          else
            @coefrotor = 2 + 5;
          end
          coef_rotor
        elsif (@flag1 == 6 || @flag1 == 8)
          if (@combobox4 == "400")
            @coefrotor = 44 + 5;
          else
            @coefrotor = 2 + 5;
          end
          coef_rotor
        elsif (@flag1 == 3)
          if (@combobox4 == "400")
            @coefrotor = 25 + 5;
          else
            @coefrotor = 3 + 5;
          end
          coef_rotor
        elsif (@flag1 == 5)
          if (@combobox4 == "400")
            @coefrotor = 19 + 5;
          else
            @coefrotor = 4 + 5;
          end
          coef_rotor
        elsif (@flagsgj == 3)
          @coefrotor = 16 + 5;
          coef_rotor
        elsif (@combobox2 == "Consorb")
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        elsif (@combobox2 == "Recusorb 1" || @combobox2 == "Recusorb 2")
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        elsif (@combobox2 == "Others")
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        else
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        end

      elsif (@flag1 == 1 && @combobox3.to_s == "SSCR-XL")
        if (@flag1 == 2)
          if (@combobox4 == "400")
            @coefrotor = 24 + 5;
          else
            @coefrotor = 5 + 5;
          end
          coef_rotor
        elsif (@flag1 == 1 || @flag1 == 7)
          @coefrotor = 17 + 5;
          coef_rotor
        elsif (@flag1 == 4)
          if (@combobox4 == "400")
            @coefrotor = 18 + 5;
          else
            @coefrotor = 2 + 5;
          end
          coef_rotor
        elsif (@flag1 == 6 || @flag1 == 8)
          if (@combobox4 == "400")
            @coefrotor = 44 + 5;
          else
            @coefrotor = 2 + 5;
          end
          coef_rotor
        elsif (@flag1 == 3)
          if (@combobox4 == "400")
            @coefrotor = 25 + 5;
          else
            @coefrotor = 3 + 5;
          end
          coef_rotor
        elsif (@flag1 == 5)
          if (@combobox4 == "400")
            @coefrotor = 19 + 5;
          else
            @coefrotor = 4 + 5;
          end
          coef_rotor
        elsif (@flagsgj == 3)
          @coefrotor = 16 + 5;
          coef_rotor
        else
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        end
      end

      if (@combobox3.to_s == "D-MAX 200cpsi" || @combobox3.to_s == "D-MAX 250cpsi" || @combobox3.to_s == "D-MAX 350cpsi" || @combobox3.to_s == "D-MAX 400cpsi")
        if (@flag1 == 2)
          if (@combobox4 == "400")
            @coefrotor = 24 + 5;
          else
            @coefrotor = 5 + 5;
          end
          coef_rotor
        elsif (@flag1 == 1 || @flag1 == 7)
          @coefrotor = 17 + 5;
          coef_rotor
        elsif (@flag1 == 4)
          if (@combobox4 == "400")
            @coefrotor = 18 + 5;
          else
            @coefrotor = 2 + 5;
          end
          coef_rotor
        elsif (@flag1 == 6 || @flag1 == 8)
          if (@combobox4 == "400")
            @coefrotor = 44 + 5;
          else
            @coefrotor = 2 + 5;
          end
          coef_rotor
        elsif (@flag1 == 3)
          if (@combobox4 == "400")
            @coefrotor = 25 + 5;
          else
            @coefrotor = 3 + 5;
          end
          coef_rotor
        elsif (@flag1 == 5)
          if (@combobox4 == "400")
            @coefrotor = 19 + 5;
          else
            @coefrotor = 4 + 5;
          end
          coef_rotor
        elsif (@flagsgj == 3)
          @coefrotor = 16 + 5;
          coef_rotor
        elsif (@combobox2 == "Consorb")
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        elsif (@combobox2 == "Recusorb 1" || @combobox2 == "Recusorb 2")
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        elsif (@combobox2 == "Others")
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        else
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        end
      end

      if (@combobox3.to_s == "D-MAX 300cpsi")
        if (@flag1 == 2)
          if (@combobox4 == "400")
            @coefrotor = 24 + 5;
          else
            @coefrotor = 5 + 5;
          end
          coef_rotor
        elsif (@flag1 == 1 || @flag1 == 7)
          @coefrotor = 17 + 5;
          coef_rotor
        elsif (@flag1 == 4)
          if (@combobox4 == "400")
            @coefrotor = 18 + 5;
          else
            @coefrotor = 2 + 5;
          end
          coef_rotor
        elsif (@flag1 == 6 || @flag1 == 8)
          if (@combobox4 == "400")
            @coefrotor = 44 + 5;
          else
            @coefrotor = 2 + 5;
          end
          coef_rotor
        elsif (@flag1 == 3)
          if (@combobox4 == "400")
            @coefrotor = 25 + 5;
          else
            @coefrotor = 3 + 5;
          end
          coef_rotor
        elsif (@flag1 == 5)
          if (@combobox4 == "400")
            @coefrotor = 19 + 5;
          else
            @coefrotor = 4 + 5;
          end
          coef_rotor
        elsif (@flagsgj == 3)
          @coefrotor = 16 + 5;
          coef_rotor
        elsif (@combobox2 == "Consorb")
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        elsif (@combobox2 == "Recusorb 1" || @combobox2 == "Recusorb 2")
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        elsif (@combobox2 == "Others")
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        else
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        end
      elsif (@combobox3.to_s == "SZCR AS-31")
        if (@flag1 == 2)
          if (@combobox4 == "400")
            @coefrotor = 24 + 5;
          else
            @coefrotor = 5 + 5;
          end
          coef_rotor
        elsif (@flag1 == 1 || @flag1 == 7)
          @coefrotor = 17 + 5;
          coef_rotor
        elsif (@flag1 == 4)
          if (@combobox4 == "400")
            @coefrotor = 18 + 5;
          else
            @coefrotor = 2 + 5;
          end
          coef_rotor
        elsif (@flag1 == 6 || @flag1 == 8)
          if (@combobox4 == "400")
            @coefrotor = 44 + 5;
          else
            @coefrotor = 2 + 5;
          end
          coef_rotor
        elsif (@flag1 == 3)
          if (@combobox4 == "400")
            @coefrotor = 25 + 5;
          else
            @coefrotor = 3 + 5;
          end
          coef_rotor
        elsif (@flag1 == 5)
          if (@combobox4 == "400")
            @coefrotor = 19 + 5;
          else
            @coefrotor = 4 + 5;
          end
          coef_rotor
        elsif (@flagsgj == 3)
          @coefrotor = 16 + 5;
          coef_rotor
        else
          @coefrotor = @cc[@dstunit][18] + 5;
          coef_rotor
        end
      end
    end
  end
end
