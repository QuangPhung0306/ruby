module UnitSelection::Button3Click
  def button3_click
    @flagini = 1
    @coefa ||= M::Coefficient.pluck(:coefa).map!{|c| c.map(&:to_f)}
    if (@combobox8 == true)
      if (@combobox8 == "")
        @flagini = 0
        @specify_error = true
        raise "Select the unit"
      end
    end

    begin
      if (@combobox2 == "1:1" || @combobox2 == "1:3" || @combobox2 == "Consorb")
        if (@textbox41.to_f > 100 || @textbox45.to_f > 100)
          @textbox7 = ""
          @flagini = 0
          @specify_error = true
          raise "Relative Humidity is over 100%"
        end
      else
        if (@textbox41.to_f > 100 || @textbox39.to_f > 100)
          if (@flagsgj == 3)
            @textbox61 = ""
          else
            @textbox7 = ""
          end
          @flagini = 0
          @specify_error = true
          raise "Relative Humidity is over 100%"
        end
      end


      if (@radiobutton9 == true)
        if (@textbox50 == "")
          @flagini = 0
          @specify_error = true
          raise "Please fill in the Power HP"
        end
      end

      if (@radiobutton8 == true)
        if (@textbox2 == "-")
          @flagini = 0
          @specify_error = true
          raise "Input the heater temperature"
        end
      end

      if (@textbox7.to_f <= 0)
        @flagini = 0
        @specify_error = true
        raise "Inlet humidity is less than 0"
      end
      if (@textbox6.to_f <= 0)
        @flagini = 0
        @specify_error = true
        raise "Inlet humidity is less than 0"
      end
      if (@textbox19.to_f <= 0)
        @flagini = 0
        @specify_error = true
        raise "Inlet humidity is less than 0"
      end

      @p = @textbox9.to_f
      @r = @textbox11.to_f
      @uuu = @textbox15.to_f
      @sss = (@textbox71.to_f / 100 * 360).round(0)

      @iii = 1
      if (@p + @r + @uuu + @sss != 360.0)
        @flagini = 0
        @specify_error = true
        raise "Sum of each zone angle is not 360 degree. Input angle again"
      else
        @s = 1
        @ooo = 1

        (1..@textbox14.to_i).to_a.each do |ooo|
          @flagini = 1

          if (ooo != 1)
            @flagini = 0
            if (@w2[ooo] == 13)
              @combobox2.to_s = "1:3"
            elsif (@w2[ooo] == 11)
              @combobox2.to_s = "1:1"
            elsif (@w2[ooo] == 113)
              @combobox2.to_s = "1:1:3"
            elsif (@w2[ooo] == 116)
              @combobox2.to_s = "1:1:6"
            elsif (@w2[ooo] == 139)
              @combobox2.to_s = "1:3:9"
            elsif (@w2[ooo] == 1110)
              @combobox2.to_s = "1:1:10"
            end
            @flagini = 1

            if (@flagsgj == 1 || @flagsgj == 2 || @flagsgj == 3 || flagSGA == 1)
              @textbox1 = @a22[ooo].to_s
              @textbox60 = @a22[ooo].to_s
              @textbox2 = @b2[ooo].to_s
              @textbox4 = @c2[ooo].to_s
              @textbox5 = @d2[ooo].to_s
              @combobox1 = @f2[ooo].to_s
              @combobox4 = @g2[ooo].to_s
              @textboxc = @h2[ooo].to_s
              @textboxd = @i2[ooo].to_s
              @textboxe = @j2[ooo].to_s
              @textbox6 = @k2[ooo].to_s
              @textbox7 = @n2[ooo].to_s
              @textbox61 = @n2[ooo].to_s
              @textbox8 = @o2[ooo].to_s
              @textbox9 = @p2[ooo].to_s
              @textbox10 = @q21[ooo].to_s
              @textbox11 = @r2[ooo].to_s
              @textbox19 = @s21[ooo].to_s

              @textbox15 = @uuu2[ooo].to_s
              @textbox16 = @v2[ooo].to_s
              @label161 = @x2[ooo].to_s
            elsif (@flagdst ==1)
              if (@combobox2.to_s == "Consorb")
                if (@combobox8.to_s == "CS-5" || @combobox8.to_s == "CS-5L")
                  @textbox60 = @ccpara[ooo + 1][0].to_s
                  @textbox61 = @ccpara[ooo + 1][1].round(1).to_s
                  @textbox81 = @ccpara[ooo + 1][2].to_s
                  @textbox82 = @ccpara[ooo + 1][3].round(1).to_s
                else
                  @textbox1 = @ccpara[ooo + 1][0].to_s
                  @textbox7 = @ccpara[ooo + 1][1].round(1).to_s
                  @textbox10 = @ccpara[ooo + 1][2].to_s
                  @textbox19 = @ccpara[ooo + 1][3].round(1).to_s
                end
              else
                if (@combobox8.to_s == "DR-010 B" || @combobox8.to_s == "DR-20B" || @combobox8.to_s == "DR-30D" || @combobox8.to_s == "DR-40-T10" || @combobox8.to_s == "DR-40-T16" || @combobox8.to_s == "DR-50 R" || @combobox2.to_s == "Recusorb 2")
                  @textbox60 = @ccpara[ooo + 1][0].to_s
                  @textbox61 = @ccpara[ooo + 1][1].round(1).to_s
                  @textbox81 = @ccpara[ooo + 1][2].to_s
                  @textbox82 = @ccpara[ooo + 1][3].round(1).to_s
                else
                  @textbox1 = @ccpara[ooo + 1][0].to_s
                  @textbox4 = @ccpara[ooo + 1][2].to_s
                  @textbox5 = @ccpara[ooo + 1][3].round(1).to_s
                  @textbox6 = @ccpara[ooo + 1][3].to_s
                  @textbox7 = @ccpara[ooo + 1][1].round(1).to_s
                end
              end
            end
          end

          initial_calc
          @flagini = 1
          if (@flagsgj == 3)
            if (@textboxd.to_f < 1.0 || @textboxe.to_f < 1.0 || @textbox16.to_f < 1.0)
              @flagini = 0
              @specify_error = true
              raise "Velocity is too low"
            elsif (@textboxd.to_f > 4.0 || @textboxe.to_f > 4.0 || @textbox16.to_f > 4.0)
              @flagini = 0
              @specify_error = true
              raise "Velocity is too high"
            end
          end
           if (@checkbox7 == true)

             @flag1 = 1
             if (@checkbox13 == true)

               selectdiameter
               (0..18).to_a.each do |bbbb|

                 if (@flagd[bbbb] != 0)
                   if (@checkbox17 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 50
                     calculation
                   elsif (@checkbox14 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 100
                     calculation
                   elsif (@checkbox15 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 200
                     calculation
                   elsif (@checkbox16 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 400
                     calculation
                   end
                 end

               end

             elsif (@checkbox13 == false)

               if (@checkbox17 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 50
                 calculation
               elsif (@checkbox14 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 100
                 calculation
               elsif (@checkbox15 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 200
                 calculation
               elsif (@checkbox16 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 400
                 calculation
               end
             end

           elsif (@checkbox8 == true)

             @flag1 = 2
             if (@checkbox13 == true)

               selectdiameter

               (0..18).to_a.each do |bbbb|

                 if (@flagd[bbbb] != 0)
                   if (@checkbox17 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(1)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 50
                     calculation
                   elsif (@checkbox14 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 100
                     calculation
                   elsif (@checkbox15 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 200
                     calculation
                   elsif (@checkbox16 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 400
                     calculation
                   end
                 end
               end

             elsif (@checkbox13 == false)

               if (@checkbox17 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 50
                 calculation
               elsif (@checkbox14 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 100
                 calculation
               elsif (@checkbox15 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 200
                 calculation
               elsif (@checkbox16 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 400
                 calculation
               end
             end


           elsif (@checkbox9 == true)

             @flag1 = 3
             if (@checkbox13 == true)

               selectdiameter

               (0..18).to_a.each do |bbbb|

                 if (@flagd[bbbb] != 0)
                   if (@checkbox17 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 50
                     calculation
                   elsif (@checkbox14 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 100
                     calculation
                   elsif (@checkbox15 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 200
                     calculation
                   elsif (@checkbox16 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 400
                     calculation
                   end
                 end
               end

             elsif (@checkbox13 == false)

               if (@checkbox17 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 50
                 calculation
               elsif (@checkbox14 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 100
                 calculation
               elsif (@checkbox15 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 200
                 calculation
               elsif (@checkbox16 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 400
                 calculation
               end
             end

           elsif (@checkbox10 == true)

             @flag1 = 4
             if (@checkbox13 == true)

               selectdiameter

               (0..18).to_a.each do |bbbb|

                 if (@flagd[bbbb] != 0)
                   if (@checkbox17 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 50
                     calculation
                   elsif (@checkbox14 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 100
                     calculation
                   elsif (@checkbox15 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 200
                     calculation
                   elsif (@checkbox16 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 400
                     calculation
                   end
                 end
               end

             elsif (@checkbox13 == false)

               if (@checkbox17 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 50
                 calculation
               elsif (@checkbox14 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 100
                 calculation
               elsif (@checkbox15 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 200
                 calculation
               elsif (@checkbox16 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 400
                 calculation
               end
             end


           elsif (@checkbox11 == true)

             @flag1 = 5
             if (@checkbox13 == true)

               selectdiameter

               (0..18).to_a.each do |bbbb|

                 if (@flagd[bbbb] != 0)
                   if (@checkbox17 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 50
                     calculation
                   elsif (@checkbox14 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 100
                     calculation
                   elsif (@checkbox15 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 200
                     calculation
                   elsif (@checkbox16 == true)
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = 400
                     calculation
                   else
                     @combobox1 = @flagd[bbbb].to_s
                     if (@radiobutton1 == true)
                       if (@textbox23 != "")
                         @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                       end
                       if (@checkbox5 == false)
                         @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                       end
                       if (@checkbox2 == false)
                         if (@textbox38 != "")
                           @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                         end
                       end
                     end
                     initial_calc
                     @flagini = 1
                     if (@checkbox18 == true)
                       optimal_rotation
                     end
                     @flagw = @combobox4.round(0)
                     calculation
                   end
                 end
               end

             elsif (@checkbox13 == false)

               if (@checkbox17 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 50
                 calculation
               elsif (@checkbox14 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 100
                 calculation
               elsif (@checkbox15 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 200
                 calculation
               elsif (@checkbox16 == true)
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = 400
                 calculation
               else
                 if (@radiobutton1 == true)
                   if (@textbox23 != "")
                     @textboxd = ((@textbox23.to_f) / @csa / 3600).round(1)
                   end
                   if (@checkbox5 == false)
                     @textbox16 = (@textbox22.to_f / @csp / 3600).round(3)
                   end
                   if (@checkbox2 == false)
                     if (@textbox38 != "")
                       @textboxe = (@textbox38.to_f / @csh / 3600).round(1)
                     end
                   end
                 end
                 initial_calc
                 @flagini = 1
                 if (@checkbox18 == true)
                   optimal_rotation
                 end
                 @flagw = @combobox4.round(0).to_s
                 calculation
               end
             end

           elsif (@flagsgj == 3)

             @flagw = 200
             calculation


           elsif (@combobox2 == "Consorb")

             @flag1 = 11
             (1..500).each do |ijk|

               if (@combobox8 == @aaaa[ijk][1].to_s)

                 @dstunit = ijk
               end
             end
             @flagw = @cc[@dstunit][12]
             calculation

           elsif (@combobox2 == "Recusorb 1" || @combobox2 == "Recusorb 2")

             @flag1 = 12
             (1..500).each do |ijk|

               if (@combobox8 == @aaaa[ijk][1].to_s)

                 @dstunit = ijk
               end
             end
             @flagw = @cc[@dstunit][12]
             calculation
           end
        end

        # fclose(fpa3)

        # UnitSelection::Result.perform
      end

      @flag = 1
      @flagini = 1
      @textbox14 = "1"
      if (@flagsgj == 3 || @flag1 == 5)
      else
        if (@checkbox20 == true)
        else
          @textbox5 = (@xx[@maxi - 1] * 1000).round(1)
        end
      end
      if (@radiobutton5 == true)
        if (@textbox5 != "")
          @textbox33 = (@textbox5.to_f * 7).round(1)
        end
      end
    rescue StandardError => exception
      @flagini = 0
      if @specify_error
        @specify_error = nil
        raise exception.message
      else
        raise "Please check textboxes. Input the numerical Value"
      end
    end
    @checkbox13 = false
    @flagini = 0
    return @datavalue.first
  end
end
