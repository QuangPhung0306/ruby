module UnitSelection::Calculation
  def calculation
    @flagcoef = 0 unless @flagcoefcalc == 1
    @itmc = 20.0
    @itm = @itmc + 273.15
    @cf = 1040.0
    @qad = 2430.0 * 1000
    @cw = 800.0
    @rhof = 1.152
    @cwt = 4186
    @ptgoutavemix = @ptg
    @diameter = @combobox1.to_f / 1000.0
    @cs =  @diameter * @diameter * 3.14159 / 4.0
    @de = 0.0017
    @dens1 = (28.0*0.8 + 32.0*0.2) / 22.4
    @cpco2 = 5020.0
    @cpm = 0.15 * 1000 * 4.19
    @rheight = @flagw.to_f / 1000.0
    @warning_messages = []

    case
    when @combobox3.to_s == "SSCR AS-31"
      @pitch = 0.0034
      @cellh = 0.0018
      @sheetw = 0.00019
      @pm = 100.0
      @pm = @textboxc.to_f if @checkbox3 == true
      @rhowx = 1365.0
      @rhow = @pm / (@rhowx*@sheetw)
      @rhowy =  @pm + 110.0
      @a0 = -0.000
      @a1 = 0.0824
      @a2 = 4.1656
      @a3 = 0.0
      @a4 = 0.0
      @a5 = 0.0
      @a6 = 0.0
    when @combobox3 == "D-MAX 200cpsi"
      @pitch = 0.0030
      @cellh = 0.0021
      @sheetw = 0.00019
      @pm = 140.0
      @pm = @textboxc.to_f if @checkbox3 == true
      @rhowx = 1295.0
      @rhow = @pm / (@rhowx * @sheetw * 1.0)
      @rhowy = @pm + 60.0
      @a0 = 0.00
      @a1 = 0.4098
      @a2 = 4.3957
      @a3 = 0.0
      @a4 = 0.0
      @a5 = 0.0
      @a6 = 0.0
    when @combobox3 == "D-MAX 250cpsi"
      @pitch = 0.0028
      @cellh = 0.00185
      @sheetw = 0.00019
      @pm = 140.0
      @pm = @textboxc.to_f if @checkbox3 == true
      @rhowx = 1436.0
      @rhow = @pm / (@rhowx * @sheetw / 2.0)
      @rhowy = @pm + 65.0
      @a0 = 0.00
      @a1 = 0.4098
      @a2 = 4.3957
      @a3 = 0.0
      @a4 = 0.0
      @a5 = 0.0
      @a6 = 0.0
    when @combobox3 == "D-MAX 300cpsi"
      @pitch = 0.0026
      @cellh = 0.00165
      @sheetw = 0.00019
      @pm = 140.0
      @pm = @textboxc.to_f if @checkbox3 == true
      @rhowx = 1585.0
      @rhow = @pm / (@rhowx * @sheetw / 2.0)
      @rhowy = @pm + 75.0
      @a0 = 0.00
      @a1 = 0.4098
      @a2 = 4.3957
      @a3 = 0.0
      @a4 = 0.0
      @a5 = 0.0
    when @combobox3 == "D-MAX 350cpsi"
      @pitch = 0.0024
      @cellh = 0.00154
      @sheetw = 0.00019
      @pm = 140.0
      @pm = @textboxc.to_f if @checkbox3 == true
      @rhowx = 1706.0
      @rhow = @pm / (@rhowx * @sheetw / 2.0)
      @rhowy = @pm + 80.0
      @a0 = 0.00
      @a1 = 0.4098
      @a2 = 4.3957
      @a3 = 0.0
      @a4 = 0.0
      @a5 = 0.0
      @a6 = 0.0
    when @combobox3 == "D-MAX 400cpsi"
      @pitch = 0.0022
      @cellh = 0.00146
      @sheetw = 0.00019
      @pm = 140.0
      @pm = @textboxc.to_f if @checkbox3 == true

      @rhowx = 1823.0
      @rhow = @pm / (@rhowx * @sheetw / 2.0)
      @rhowy = @pm + 90.0

      @a0 = 0.00
      @a1 = 0.4098
      @a2 = 4.3957
      @a3 = 0.0
      @a4 = 0.0
      @a5 = 0.0
      @a6 = 0.0
    when @combobox3 == "DLR AS-31"
      @pitch = 0.0034
      @cellh = 0.0018
      @sheetw = 0.00017
      @pm = 100
      @pm = @textboxc.to_f if @checkbox3 == true
      @rhowx = 1365.0
      @rhow = @pm / (@rhowx * @sheetw / 2.0)
      @rhowy = @pm + 110.0 + 60.0
      @a0 = -0.000
      @a1 = -0.0794
      @a2 = 9.0139
      @a3 = -10.756
      @a4 = 0.0
      @a5 = 0.0
      @a6 = 0.0
    when @combobox3 == "SZCR AS-31"
      @pitch = 0.0034
      @cellh = 0.0018
      @sheetw = 0.00019
      @pm = 100.0
      @pm = @textboxc.to_f if @heckbox3 == true
      @rhowx = 1365.0
      @rhow = @pm / (@rhowx * @sheetw / 2.0)
      @rhowy = @pm + 110.0 + 60.0
      @a0 = -0.000
      @a1 = -0.0794
      @a2 = 9.0139
      @a3 = -10.756
      @a4 = 0.0
      @a5 = 0.0
      @a6 = 0.0
    when @combobox3 == "SSCR-XL"
      @pitch = 0.0030
      @cellh = 0.0017
      @sheetw = 0.00019
      @pm = 100.0
      @pm = @textboxc.to_f if @checkbox3 == true
      @rhowx = 1365.0
      @rhow = @pm / (@rhowx * @sheetw / 2.0)
      @rhowy = (@pm + 110.0)
      @a0 = 0.000
      @a1 = 0.8443
      @a2 = 5.6744
      @a3 = -14.566
      @a4 = 11.199
      @a5 = 0.0
      @a6 = 0.0
    end

    @se = (@pitch + 2.0 * Math.sqrt(@pitch / 2.0 * @pitch / 2.0 + @cellh * @cellh))

    @af = @pitch * @cellh / 2.0
    @aw = @se*@sheetw
    @dm = 4 * @af / @se
    @eee = 1 - (@pitch + 2 * Math.sqrt((@pitch*@pitch) / 4 + @cellh*@cellh))*25.4*25.4 / @pitch / @cellh*@sheetw / 25.4 / 25.4

    @dz = 0.005
    @dt = 0.05
    @maxi = (@rheight / @dz).to_i + 1
    if @flagdst == 1
      optimal_rotation
    else
      optimal_rotation
      @textbox8 = @rph.to_s
    end

    @iuu = @iu / @eee*@label139.to_f / 10 * 273.15 / 101.32 / (273.15 + 20.0)
    @v = 4.555*(0.622 + @xb)*@itg * 101.32 / (1000 * @label139.to_f / 10)
    @faair = @iu * @itg / (273.15 + 20.0) / @eee* @af / @v
    @fawater = @xb*@faair
    @fa = (1 + @xb)*@faair

    @uuh = @uh / @eee*@label139.to_f / 10 * 273.15 / 101.32 / (273.15 + 20.0)
    @vh = 4.555*(0.622 + @xbh)*@htg * 101.32 / (1000 * @label139.to_f / 10)
    @fhair = @uh * @htg / (273.15 + 20.0) / @eee* @af / @vh
    @fhwater = @xbh*@fhair
    @fh = (1 + @xbh)*@fhair

    @uup = @up / @eee*@label139.to_f / 10 * 273.15 / 101.32 / (273.15 + 20.0)
    @vp = 4.555*(0.622 + @xbp)*@ptg * 101.32 / (1000 * @label139.to_f / 10)
    @fpair = @up * @ptg / (273.15 + 20.0) / @eee* @af / @vp
    @fpwater = @xbp*@fpair
    @fp = (1 + @xbp)*@fpair

    @uup2 = @up2 / @eee*@label139.to_f / 10 * 273.15 / 101.32 / (273.15 + 20.0)
    @vp2 = 4.555*(0.622 + @xbp2)*@p2tg * 101.32 / (1000 * @label139.to_f / 10)
    @fp2air = @up2 * @p2tg / (273.15 + 20.0) / @eee* @af / @vp2
    @fp2water = @xbp2*@fp2air
    @fp2 = (1 + @xbp2)*@fp2air
    det_coef if @flagcoefcalc != 1
    @coef21 = 0.0 if @optrot <= 0
    @ta = 3600 / @rph*@adiv / 360.0 * (@rph / @optrot)**@coef21 rescue Float::INFINITY
    @th = 3600 / @rph*@hdiv / 360.0 * (@rph / @optrot)**@coef21 rescue Float::INFINITY
    @tp = 3600 / @rph*@pdiv / 360.0 * (@rph / @optrot)**@coef21 rescue Float::INFINITY
    @tp2 = 3600 / @rph*@p2div / 360.0 * (@rph / @optrot)**@coef21 rescue Float::INFINITY
    (1..@maxi).to_a.each do |i|
      @tm[i] = @itm
      @tmpt[i] = @itm
      @ntm[i] = @itm
      @tg[i] = @itg
      @q[i] = 0.1
      @qpt[i] = 0.1
      @nq[i] = 0.1
      @cpg[i] = 0.0
    end

    @fleak = 0.0
    @ptgoutave = 0.0
    @p2tgoutave = 0.0
    @energyh = 0.0
    @axoutave = 0.0
    @hxoutave = 0.0
    @pxoutave = @xbp
    @p2xoutave = @xbp
    @pxoutavemix = @xbp
    @ptgoutavemix = 370

    @etpjudge = 1.0
    @roop = 0

    (1..10).to_a.each do |s|

      (0..@maxi).to_a.each do |i|
        @tgpt[i] = 0.0
        @tg[i] = 0.0
        @xpt[i] = 0.0
        @xx[i] = 0.0
      end
      @atgout = 0.0
      @axout = 0.0
      @v = 4.555*(0.622 + @xb)*@itg * 101.32 / (1000 * @label139.to_f / 10)
      if (@flagdst == 1)
        @v = 4.555*(0.622 + @xb)*@itg * 101.32 / (1000 * 101.32)
      end

      @faair = @iu / @eee* @af / @v
      @fawater = @xb*@faair
      @fa = (1 + @xb)*@faair

      @tgpt[1] = @itg
      @tg[1] = @itg
      @xpt[1] = @xb
      @xx[1] = @xb

      @wmair = @faair
      @wm = @fa
      @u = @iuu

      @coef1 = @coef1a
      @coef2 = @coef2a
      @coef3 = @coef3a

      @coef4 = @coef4a
      @coef5 = @coef5a
      @coef6 = @coef6a
      @coef7 = @coef7a
      @coef11 = @coef11a
      @coef12 = @coef12a
      @coef13 = @coef13a
      @coef14 = @coef14a
      @coef15 = @coef15a
      @coef16 = @coef16a
      unless @ta == Float::INFINITY
        (1..(1 * @ta / @dt).to_i).to_a.each do |k|
          forward_calc
          @atgout = @atgout + @tg[@maxi]
          @axout = @axout + @xx[@maxi]
        end
      end
      if (1 * @ta / @dt) == Float::INFINITY
        @atgoutave = Float::NAN
        @axoutave = Float::NAN
      else
        @atgoutave = @atgout / (1 * @ta / @dt)
        @axoutave = @axout / (1 * @ta / @dt)
      end
      @kmassfa = @kmassf

      @v = 4.555*(0.622 + @xb)*@itg * 101.32 / (1000 * @label139.to_f / 10)
      @vaout = 4.555*(0.622 + @axoutave)*@atgoutave * 101.32 / (1000 * @label139.to_f / 10) rescue Float::INFINITY
      @sorp = (@xb - @axoutave) *@iu*@csa*@itg / (273.15 + 20) / @v * 3600 rescue Float::INFINITY
      if @combobox2.to_s == "Recusorb 2"
        (0..@maxi).to_a.each do |i|
          @tgpt[i] = 0.0
          @tg[i] = 0.0
          @xpt[i] = 0.0
          @xx[i] = 0.0
        end

        @p2tgout = 0.0
        @p2xout = 0.0
        @vp2 = 4.555*(0.622 + @xbp2)*@p2tg * 101.32 / (1000 * @label139.to_f / 10)
        if @flagdst == 1
          @vp2 = 4.555*(0.622 + @xbp2)*@p2tg * 101.32 / (1000 * 101.32)
        end

        @fp2air = @up2 / @eee* @af / @vp2
        @fp2water = @xbp2*@fp2air
        @fp2 = (1 + @xbp2)*@fp2air

        @tgpt[1] = @p2tg
        @tg[1] = @p2tg
        @xpt[1] = @xbp2
        @xx[1] = @xbp2

        @wmair = @fp2air
        @wm = @fp2
        @u = @uup2

        @coef1 = @coef1p
        @coef2 = @coef2p
        @coef3 = @coef3p
        @coef4 = @coef4p
        @coef5 = @coef5p
        @coef6 = @coef6p
        @coef7 = @coef7p
        @coef11 = @coef11p
        @coef12 = @coef12p
        @coef13 = @coef13p
        @coef14 = @coef14p
        @coef15 = @coef15p
        @coef16 = @coef16p

        unless @tp2 == Float::INFINITY
          (1..(@tp2 / @dt).to_i).to_a.each do |k|
            forward_calc

            @p2tgout = @p2tgout + @tg[@maxi]
            @p2xout = @p2xout + @xx[@maxi]
          end
        end
        if @tp2 == Float::INFINITY
          @p2tgoutave = Float::NAN
          @p2xoutave = Float::NAN
        else
          @p2tgoutave = @p2tgout / (@tp2 / @dt)
          @p2xoutave = @p2xout / (@tp2 / @dt)
        end

        @vp2 = 4.555*(0.622 + @xbp2)*@p2tg * 101.32 / (1000 * @label139.to_f / 10)
        @vp2out = 4.555*(0.622 + @p2xoutave)*@p2tgoutave * 101.32 / (1000 * @label139.to_f / 10)
        @p2sorp = (@xbp2 - @p2xoutave) *@up2*@csp2*@p2tg / (273.15 + 20) / @vp2 * 3600
      end

      (0..@maxi).to_a.each do |i|
        @tgpt[i] = 0.0
        @tg[i] = 0.0
        @xpt[i] = 0.0
        @xx[i] = 0.0
      end

      @vh = 4.555*(0.622 + @xbh)*@htg * 101.32 / (1000 * @label139.to_f / 10)

      if @flagdst == 1
        @vh = 4.555*(0.622 + @xbh)*@htg * 101.32 / (1000 * 101.32)
      end
      case
      when [3, 4, 6, 8].include?(@flag1)
        @flagini = 1
        if @checkbox20 == false
          @xbh = @pxoutavemix
          @textbox5 = (@xbh * 1000).round(1).to_s
          @textbox33 = (@textbox5.to_f * 7).round(1).to_s
        end

        if (@radiobutton9 == true)
          @energyh = @textbox50.to_f
          @uh = @textboxe.to_f
          @htg = (@ptgoutavemix + @energyh*(273.15 + 20)*(4.555*(0.622 + @pxoutavemix)) * 101.32 / (1000 * 101.32) * 1000 / @cf / @uh / @csh)
          @textbox2 = (@htg - 273.15).round(1).to_s
          @textbox34 = (@textbox2.to_f * 1.8 + 32).round(1).to_s
        end
        @flagini = 0
      when (@combobox2 == "Recusorb 1" || @combobox2 == "Recusorb 2")
        @flagini = 1
        if @checkbox20 == false
          @xbh = @pxoutavemix
          @textbox5 = (@xbh * 1000).round(1).to_s
          @textbox33 = (@textbox5.to_f * 7).round(1).to_s
        end
        if (@radiobutton9 == true)
          @energyh = @textbox50.to_f
          @uh = @textboxe.to_f
          @htg = 273.15 + (3000 * @energyh / @textbox79.to_f + (@ptgoutavemix - 273.15) * (1 + @pxoutavemix * 1.86)) / (1 + @pxoutavemix * 1.86)
          @textbox2 = (@htg - 273.15).round(1).to_s
          @textbox34 = (@textbox2.to_f * 1.8 + 32).round(1).to_s
        end
        @flagini = 0
      when @flag1 == 5
        if (@checkbox20 == false)
          @pxmix = (@pxoutavemix*@textbox22.to_f + @xboa*@textbox65.to_f) / (@textbox22.to_f + @textbox65.to_f)
          @xbh = @pxmix

          @flagini = 1
          @textbox5 = (@xbh * 1000).round(1).to_s
          @textbox33 = (@textbox5.to_f * 7).round(1).to_s
        end

        @ptgmix = ((@ptgoutavemix*@textbox22.to_f) + @oatg*@textbox65.to_f) / (@textbox22.to_f + @textbox65.to_f)

        if (@radiobutton9 == true)
          @energyh = @textbox50.to_f
          @uh = @textboxe.to_f
          @htg = (@ptgmix + @energyh*(273.15 + 20)*(4.555*(0.622 + @pxmix)) * 101.32 / (1000 * @label139.to_f / 10) * 1000 / @cf / @uh / @csh)
          @flagini = 1
          @textbox2 = (@htg - 273.15).round(1).to_s
          @textbox34 = (@textbox2.to_f * 1.8 + 32).round(1).to_s
        end
        @flagini = 0
      when @flagsgj == 3
        @flagini = 1
        @energyh = @textbox50.to_f
        if (@checkbox20 == false)
          @pxmix = (pxoutavemix*@textbox22.to_f + @xboa*(@textbox65.to_f - @textbox22.to_f)) / (@textbox65.to_f)
          @xbh = @pxmix
          @textbox5 = (@xbh * 1000).round(1).to_s
          @textbox33 = (@textbox5.to_f * 7).round(1).to_s
        end

        @ptgmix = (@ptgoutavemix*@textbox22.to_f + @heatertg*(@textbox65.to_f - @textbox22.to_f)) / (@textbox65.to_f)
        @htg = @ptgmix
        @textbox2 = (@htg - 273.15).round(1).to_s
        @textbox34 = ((@textbox2.to_f) * 1.8 + 32).round(1).to_s
        @flagini = 0
      end

      @fhair = @uh / @eee* @af / @vh
      @fhwater = @xbh*@fhair
      @fh = (1 + @xbh)*@fhair

      @tgpt[@maxi - 1] = @htg
      @tg[@maxi - 1] = @htg
      @xpt[@maxi - 1] = @xbh
      @xx[@maxi - 1] = @xbh

      @htgout = 0.0
      @hxout = 0.0

      @wmair = @fhair
      @wm = @fh

      @u = @uuh

      @coef1 = @coef1h
      @coef2 = @coef2h
      @coef3 = @coef3h
      @coef4 = @coef4h
      @coef5 = @coef5h
      @coef6 = @coef6h
      @coef7 = @coef7h
      @coef11 = @coef11h
      @coef12 = @coef12h
      @coef13 = @coef13h
      @coef14 = @coef14h
      @coef15 = @coef15h
      @coef16 = @coef16h

      if (s == 3 || s==6)
        if (@flagcoefcalc != 1)
          det_coef
        end
      end
      unless @th == Float::INFINITY
        (1..(1 *@th / @dt).to_i).to_a.each do |k|
          reverse_calc

          @htgout = @htgout + @tg[1]
          @hxout = @hxout + @xx[1]
        end
      end
      @htgoutave = @htgout / (1 * @th / @dt) rescue Float::INFINITY
      @hxoutave = @hxout / (1 * @th / @dt) rescue Float::INFINITY

      @vh = 4.555*(0.622 + @xbh)*@htg * 101.32 / (1000 * @label139.to_f / 10)
      @vhout = 4.555*(0.622 + @hxoutave)*@htgoutave * 101.32 / (1000 * @label139.to_f / 10) rescue Float::INFINITY
      @desorp = (@hxoutave - @xx[@maxi - 1]) *@uh*@csh*@htg / (273.15 + 20) / @vh * 3600 rescue Float::INFINITY


      if (@flag1 == 4 || @flag1 == 3 || @flag1 == 5 || @flag1 == 6 || @flag1 == 8 || @flagsgj == 3 || @combobox2 == "Recusorb 1" || @combobox2 == "Recusorb 2")
        (0..@maxi).to_a.each do |i|
          @tgpt[i] = 0.0
          @tg[i] = 0.0
          @xpt[i] = 0.0
          @xx[i] = 0.0
        end
        @ptgout = 0.0
        @pxout = 0.0
        @vp = 4.555*(0.622 + @xb) * @ptg * 101.32 / (1000 * @label139.to_f / 10)
        if(@flagdst == 1)
          @vp = 4.555*(0.622 + @xb) * @ptg * 101.32 / (1000 * 101.32)
        end
        @fpair = @up  / @eee* @af / @vp
        @fpwater = @xbp*@fpair
        @fp = (1 + @xbp)*@fpair

        @tgpt[1] = @ptg
        @tg[1] = @ptg
        @xpt[1] = @xbp
        @xx[1] = @xbp

        @wmair = @fpair
        @wm = @fp

        @u = @uup

        @coef1 = @coef1p
        @coef2 = @coef2p
        @coef3 = @coef3p

        @coef4 = @coef4p
        @coef5 = @coef5p
        @coef6 = @coef6p
        @coef7 = @coef7p
        @coef11 = @coef11p
        @coef12 = @coef12p
        @coef13 = @coef13p
        @coef14 = @coef14p
        @coef15 = @coef15p
        @coef16 = @coef16p

        pnum = 0

        unless @tp == Float::INFINITY
          (1..(@coef22 * @tp / @dt).to_i).to_a.each do |k|
            forward_calc

            if ((k % 20).zero?)
              @ptgout = @ptgout + @tg[@maxi]
              @pxout = @pxout + @xx[@maxi]
              pnum = pnum + 1
            end
          end
        end
        @ptgoutave = @ptgout / (pnum) rescue Float::INFINITY
        @pxoutave = @pxout / (pnum) rescue Float::INFINITY
        @kmassfp = @kmassf
      end

      @vp = 4.555*(0.622 + @xb) * @ptg * 101.32 / (1000 * @label139.to_f / 10)
      @psorp = (@pxoutave - @xbp) *@up*@csp*@ptg / (273.15 + 20) / @vp * 3600 rescue Float::INFINITY
      case
      when (@flag1 == 1)
        @atgoutave = @atgoutave + (@htg - @atgoutave)*0.1*@coefa[@coefrotor][10] + @coefa[@coefrotor][8]
      when (@flag1 == 2)
        @atgoutave = @atgoutave + (@htg - @atgoutave)*0.03*@coefa[@coefrotor][10] + @coefa[@coefrotor][8]

      when (@flag1 == 3)
        @atgoutave = @atgoutave + @coefa[@coefrotor][8]
        @ptgoutave = @ptgoutave + @coefa[@coefrotor][9]
      when (@flag1 == 4)
        @atgoutave = @atgoutave + @coefa[@coefrotor][8]
        @ptgoutave = @ptgoutave + @coefa[@coefrotor][9]
      when (@flag1 == 5)
        @atgoutave = @atgoutave + @coefa[@coefrotor][8]
        @ptgoutave = @ptgoutave + @coefa[@coefrotor][9]
      when (@flag1 == 6 || @flag1 == 8)
        @atgoutave = @atgoutave + @coefa[@coefrotor][8]
        @ptgoutave = @ptgoutave + @coefa[@coefrotor][9]
      when (@combobox2 == "Consorb")
        @atgoutave = @atgoutave + (@htg - @atgoutave)*@coefa[@coefrotor][10] + @coefa[@coefrotor][8]
      when (@combobox2 == "Recusorb 1" || @combobox2 == "Recusorb 2")
        @atgoutave = @atgoutave + @coefa[@coefrotor][8] + (@htg - @atgoutave)*@coefa[@coefrotor][10]
        @ptgoutave = @ptgoutave + @coefa[@coefrotor][9]
      when (@flagsgj == 3)
        @atgoutave = @atgoutave + @coefa[@coefrotor][8]
        @ptgoutave = @ptgoutave + @coefa[@coefrotor][9]
      end

      if (@combobox2 == "1:1" || @combobox2 == "1:3")
      else
        @vpout = 4.555*(0.622 + @pxoutave) * @ptgoutave * 101.32 / (1000 * @label139.to_f / 10)
        raise "textbox66 is not number" if @textbox66.to_s == "" || !@textbox66.match(Settings.regex.float_number)
        @ptgoutavemix = (@ptgoutave * @textbox22.to_f + @ptg * @textbox79.to_f * (@textbox66.to_f / 100) + @p2tgoutave * @textbox79.to_f * (@textbox67.to_f / 100)) / (@textbox79.to_f)
        @pxoutavemix = (@pxoutave * @textbox22.to_f + @xbp * @textbox79.to_f * (@textbox66.to_f / 100) + @p2xoutave *  @textbox79.to_f * (@textbox67.to_f / 100)) / (@textbox79.to_f)
        @vpoutmix = 4.555*(0.622 + @pxoutavemix) * @ptgoutavemix * 101.32 / (1000 * @label139.to_f / 10)
      end

      if (@radiobutton8 == true)
        case
        when (@flag1 == 4 || @flag1 == 3 || @flag1 == 6 || @flag1 == 8)
          @vh = 4.555*(0.622 + @xbh)*@htg * 101.32 / (1000 * 101.32)
          @energyh = @textbox79.to_f / 3000 * ((@htg - @ptgoutavemix) + @xbh * 1.86 *(@htg - @ptgoutavemix))
        when (@flag1 == 5)
          @vh = 4.555*(0.622 + @xbh)*@htg * 101.32 / (1000 * 101.32)
          @energyh = @cf / 1000.0 * @uh * @csh * @htg / (273.15 + 20) / @vh *(@htg - @ptgmix)
        when (@combobox2 == "Recusorb 1" || @combobox2 == "Recusorb 2")
          @vh = 4.555*(0.622 + @xbh)*@htg * 101.32 / (1000 * 101.32)
          @energyh = @cf / 1000.0 * @uh * @csh * @htg / (273.15 + 20) / @vh *(@htg - @ptgoutavemix)
        when (@combobox2 == "Consorb")
          @vh = 4.555*(0.622 + @xbh)*@htg * 101.32 / (1000 * 101.32)
          @energyh = @textbox65.to_f / 3000 * ((@htg - @oatg) + @xbh * 1.86 * (@htg - @oatg))
        else
          @vh = 4.555*(0.622 + @xbh)*@htg * 101.32 / (1000 * 101.32)
          @energyh = @cf / 1000.0 * @fekg / 3600 *(@htg - @oatg)
        end
      end

      if (@radiobutton9 == true)
        if (@flag1 == 1 || @flag1 == 2)
          @energyh = @textbox50.to_f
        end

        if (@flagdst == 1)
          if (@aaaa[@dstunit][0] == "Consorb")
            @energyh = @textbox50.to_f
          end
        end
      end


      @flagini = 1

      @textbox50 = @energyh.round(2).to_s
      @textbox49 = (@energyh * 1000 / 0.29307107).round(0).to_s
      @textbox52 = ((@xb - @axoutave) * (1.0 - @textbox62.to_f / 100) *@iu*@csa*@itg / (273.15 + 20) / @v * 3600).round(1).to_s
      if (@flagdst == 1)
        @textbox52 = (@sorp* (1.0 - @textbox62.to_f / 100)).round(1).to_s
      end
      @textbox51 = (@textbox52.to_f*2.204623).round(1).to_s
      @flagini = 0

    end

    # OUT
    @xbhwbpp = (@xbh)*@label139.to_f / 10 / ((@xbh)+0.622)

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

    @textbox46 = @xbhdp.round(1).to_s
    @textbox45 = @xbhrh.round(1).to_s
    regen_out_calc
    pressure_drop_calc
    if (@iiii >= @datamax)
      @flagini = 0
      @specify_error = true
      raise "Clear the table. Data capasity is full"
    end
    case
    when (@flag1==1)
      @datatext[@iiii] = "1:1"
    when (@flag1 == 2)
      @datatext[@iiii] = "1:3"
    when (@flag1 == 3)
      @datatext[@iiii]= "1:1:3"
    when (@flag1 == 4)
      @datatext[@iiii] = "1:1:6"
    when (@flag1 == 5)
      @datatext[@iiii] = "1:3:9"
    when (@flag1 == 6)
      @datatext[@iiii] = "1:1:12"
    when (@flag1 == 7)
      @datatext[@iiii] = "1:2"
    when (@flag1 == 8)
      @datatext[@iiii] = "1:1:10"
    when (@flagsgj == 3)
      case
      when (@combobox2 == "SGP-330-2E")
         @datatext[@iiii] = "SGP-330-2E"
      when (@combobox2 == "SGP-660-2E")
         @datatext[@iiii] = "SGP-660-2E"
      when (@combobox2 == "SGP-1100-2E")
         @datatext[@iiii] = "SGP-1100-2E"
      end
    else
      @datatext[@iiii] = @aaaa[@dstunit][0]
      @datatextu[@iiii] = @aaaa[@dstunit][1]
    end
    case
    when (@combobox3 == "SSCR AS-31")
      @datatextr[@iiii] = "SSCR AS-31"
    when (@combobox3 == "D-MAX 200cpsi")
      @datatextr[@iiii] = "D-MAX 200cpsi"
    when (@combobox3 == "D-MAX 250cpsi")
      @datatextr[@iiii] = "D-MAX 250cpsi"
    when (@combobox3 == "D-MAX 300cpsi")
      @datatextr[@iiii] = "D-MAX 300cpsi"
    when (@combobox3 == "D-MAX 350cpsi")
      @datatextr[@iiii] = "D-MAX 350cpsi"
    when (@combobox3 == "D-MAX 400cpsi")
      @datatextr[@iiii] = "D-MAX 400cpsi"
    when (@combobox3 == "DLR AS-31")
      @datatextr[@iiii] = "DLR AS-31"
    when (@combobox3 == "SZCR AS-31")
      @datatextr[@iiii] = "SZCR AS-31"
    when (@combobox3 == "SSCR-XL")
      @datatextr[@iiii] = "SSCR-XL"
    end

    @textbox17 = (@atgoutave - 273.15).round(1).to_s
    @textbox37 = ((@atgoutave - 273.15) * 1.8 + 32).round(1).to_s
    if (@checkbox21 == true)
      if (@flag1 == 1 || @flag1 == 7)
        if ((0.4377 - 0.0042 * (@htg - 273.15) - 0.0066 * (@xb * 1000)) > 0)
          @axoutave = (@axoutave * 1000 + (@xb * 1000 - @axoutave * 1000) * ((0.4377 - 0.0042 * (@htg - 273.15) - 0.0066 * (@xb * 1000)))) / 1000
        end
      end
      if (@flag1 == 2)
        if ((0.37711 - 0.0018 * (@htg - 273.15) - 0.0194 * (@xb * 1000)) > 0)
          @axoutave = (@axoutave * 1000 + (@xb * 1000 - @axoutave * 1000) * ((0.37711 - 0.0018 * (@htg - 273.15) - 0.0194 * (@xb * 1000)))) / 1000
        end
      end
      if (@flag1 == 4 || @flag1 == 6 || @flag1 == 8)
        if (@combobox4.to_s == "400")
          if ((-0.3235 + 0.02357* (@xb * 1000) + 0.07 * @iu) > 0)
            @axoutave = (@axoutave * 1000 + (@xb * 1000 - @axoutave * 1000) * ((-0.3235 + 0.02357* (@xb * 1000) + 0.07 * @iu))) / 1000
          end
        else
          if ((0.1204*Math.log(@xb * 1000) - 0.0676) > 0)
            @axoutave = (@axoutave * 1000 + (@xb * 1000 - @axoutave * 1000) * (0.1204*Math.log(@xb * 1000) - 0.0676)) / 1000
          end
        end
      elsif (@flag1 == 5)
        if ((0.0428*Math.log(@xb * 1000) - 0.0317) > 0)
          @axoutave = (@axoutave * 1000 + (@xb * 1000 - @axoutave * 1000) * (0.0428*Math.log(@xb * 1000) - 0.0317)) / 1000
        end
      end
    end
    if (@flagdst == 1 || @flagsga == 1)
      @textbox12 = (@axoutave * 1000 * (1.0 + @textbox62.to_f) / 100).round(2).to_s
    end
    @textbox12 = (@xb * 1000 - (@xb - @axoutave) * 1000 * (1.0 - @textbox62.to_f) / 100).round(5).to_s

    if (@flagdst == 1)
      @textbox12 = ((@xb - @sorp * (1.0 - @textbox62.to_f / 100) / @iu / @csa / @itg*(273.15 + 20)*@v / 3600) * 1000).round(2).to_s
    end
    @textbox36 = (@textbox12.to_f * 7).round(2).to_s

    @axoutavesvp = (98066.5 / 1000) * (10**(-7.90298*(373.15 / @atgoutave - 1) + 5.02808*Math.log10(373.15 / @atgoutave) - 0.00000013816*((10**(11.344*(1 - @atgoutave))) - 1) + 0.0081328*((10**(-3.49149*(373.15 / @atgoutave - 1))) - 1) + Math.log10(1.03323)))
    @axoutavewbpp = (@textbox12.to_f / 1000)*@label139.to_f / 10 / ((@textbox12.to_f / 1000) + 0.622)
    @axoutaverh = @axoutavewbpp / @axoutavesvp * 100

    if (265.3*Math.log10((@axoutavewbpp * 1000) / 611) / (9.5 - Math.log10((@axoutavewbpp * 1000) / 611))>0)
      @axoutavedp = 265.3*Math.log10((@axoutavewbpp * 1000) / 611) / (9.5 - Math.log10((@axoutavewbpp * 1000) / 611)) + 2.5685647*Math.log((@axoutavewbpp * 1000)) - 16.999402
    else
      if (265.3*Math.log10((@axoutavewbpp * 1000) / 611) / (9.5 - Math.log10((@axoutavewbpp * 1000) / 611))<-15)
          @axoutavedp = 265.3*Math.log10((@axoutavewbpp * 1000) / 611) / (9.5 - Math.log10((@axoutavewbpp * 1000) / 611)) + 0.10186604*Math.log((@axoutavewbpp * 1000)) - 0.47448632
      else
        @axoutavedp = 265.3*Math.log10((@axoutavewbpp * 1000) / 611) / (9.5 - Math.log10((@axoutavewbpp * 1000) / 611))
      end
    end

    if (@flagdst == 1)
      if (@axoutavedp <= -30)
        @warning_messages.push("The Dry Air Outlet humidity is less than -30℃DP (0.225g/kg)")
      end
    end
    @textbox44 = @axoutavedp.round(1).to_s
    @textbox43 = @axoutaverh.round(1).to_s

    @textbox21 = (@htgoutave - 273.15).round(1).to_s
    @textbox25 = ((@htgoutave - 273.15) * 1.8 + 32).round(1).to_s

    @textbox20 = (@hxoutave * 1000).round(1).to_s
    @textbox24 = (@hxoutave * 1000 * 7).round(1).to_s
    @houtsvp = (98066.5 / 1000) * (10**(-7.90298*(373.15 / @htgoutave - 1) + 5.02808*Math.log10(373.15 / @htgoutave) - 0.00000013816*((10**(11.344*(1 - @htgoutave))) - 1) + 0.0081328*((10**(-3.49149*(373.15 / @htgoutave - 1))) - 1) + Math.log10(1.03323)))
    @xbhoutwbpp = (@hxoutave)*@label139.to_f / 10 / ((@hxoutave)+0.622)

    @xbhoutrh = @xbhoutwbpp / @houtsvp * 100
    if (265.3*Math.log10((@xbhwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhwbpp * 1000) / 611))>0)
      @xbhoutdp = 265.3*Math.log10((@xbhoutwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhoutwbpp * 1000) / 611)) + 2.5685647*Math.log((@xbhoutwbpp * 1000)) - 16.999402
    else
      if (265.3*Math.log10((@xbhoutwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhoutwbpp * 1000) / 611))<-15)
        @xbhoutdp = 265.3*Math.log10((@xbhoutwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhoutwbpp * 1000) / 611)) + 0.10186604*Math.log((@xbhoutwbpp * 1000)) - 0.47448632
      else
        @xbhoutdp = 265.3*Math.log10((@xbhoutwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhoutwbpp * 1000) / 611))
      end
    end
    @textbox74 = @xbhoutdp.round(1).to_s
    @textbox75 = @xbhoutrh.round(1).to_s
    if (@textbox14.to_i == 1)
      if (@opq == 0)
        if (@flagdst == 1)
          if @htg >= 433.15
            @specify_error = true
            raise "The Regen Air Temperature exceeds 160℃"
          end
          if (@htg >= 418.15)
            @warning_messages.push("The Regen Air Temperature exceeds 145℃")
          end
        end
        if (@flagsgj == 3)
          if (@htg >= 418.15)
            if (@sgpsalestoolstripmenuitem.to_s == "-Sales")
              @specify_error = true
              raise "The Regen Air Temperature exceeds 145℃"
            else
              if @htg >= 433.15
                @specify_error = true
                raise "The Regen Air Temperature exceeds 160℃"
              end
              @warning_messages.push("The Regen Air Temperature exceeds 145℃")
            end
           end
        end

        if (@xbhoutrh >= 100)
          if (@flagcoefcalc != 1)
            @warning_messages.push("Regeneration outlet humidity is over 100%")
            @flagini = 0
          end
        end
      end
    end

    if (@flag1 == 4 || @flag1 == 3 || @flag1 == 5 || @flag1 == 6 || @flag1 == 8 || @flagsgj == 3 || @combobox2 == "Recusorb 1" || @combobox2 == "Recusorb 2")
      @textbox18 = (@ptgoutavemix - 273.15).round(1).to_s
      @textbox35 = ((@ptgoutavemix - 273.15) * 1.8 + 32).round(1).to_s
     else
      @textbox18 = "-"
    end
    @label154 = (@coefrotor-5).round(0).to_s
    @label157 = @kmassfa.round(3).to_s
    @label158 = @kmassr.round(3).to_s
    if (@flagcoefcalc != 1)
      @datavalue[@iiii][0] = @rph
      @datavalue[@iiii][1] = @diameter * 1000
      @datavalue[@iiii][2] = @rheight * 1000
      @datavalue[@iiii][3] = @itgc
      @datavalue[@iiii][4] = @xb * 1000
      @datavalue[@iiii][5] = @textbox23
      @datavalue[@iiii][6] = @htg - 273.15
      @datavalue[@iiii][7] = @xbh * 1000
      @datavalue[@iiii][8] = @textbox38
      @datavalue[@iiii][9] = @atgoutave - 273.15

      @datavalue[@iiii][10] = (@xb * 1000 - (@xb - @axoutave) * 1000 * (1.0 - @textbox62.to_f / 100))
      @datavalue[@iiii][20] = (@xb - @axoutave) * (1.0 - @textbox62.to_f / 100) *@iu*@csa*@itg / (273.15 + 20) / @v * 3600
      if (@flagdst == 1)
         @datavalue[@iiii][10] = (@xb - @sorp * (1.0 - @textbox62.to_f / 100) / @iu / @csa / @itg*(273.15 + 20)*@v / 3600) * 1000
         @datavalue[@iiii][20] = @sorp* (1.0 - @textbox62.to_f / 100)
      end
      @datavalue[@iiii][11] = @ptgoutave - 273.15
      @datavalue[@iiii][12] = @htgoutave - 273.15
      @datavalue[@iiii][13] = @hxoutave * 1000
      @datavalue[@iiii][14] = @energyh
      @datavalue[@iiii][15] = @textbox55
      @datavalue[@iiii][16] = @textbox56
      if (@textbox73 != "-")
        @datavalue[@iiii][17] = @textbox73
      end
      @datavalue[@iiii][18] = @iu
      @datavalue[@iiii][19] = @uh
      @datavalue[@iiii][21] = @textbox62.to_f

      @datavalue[@iiii][22] = @textbox68
      @datavalue[@iiii][23] = @textbox69
      @datavalue[@iiii][24] = @textbox70
      @datavalue[@iiii][25] = @textbox71
      @datavalue[@iiii][26] = @textbox66
      @datavalue[@iiii][27] = @textbox67

      @datavalue[@iiii][28] = @axoutave * 1000

      @datavalue[@iiii][29] = @pxoutave * 1000
      @datavalue[@iiii][30] = @ptgoutavemix - 273.15
      @datavalue[@iiii][31] = @pxoutavemix * 1000
      @datavalue[@iiii][32] = @textbox10
      @datavalue[@iiii][33] = @textbox19
      @datavalue[@iiii][34] = @ptgmix.to_f - 273.15
      @datavalue[@iiii][35] = @pxmix.to_f * 1000
      @datavalue[@iiii][36] = @textbox60
      @datavalue[@iiii][37] = @textbox61
      @datavalue[@iiii][38] = @textbox81
      @datavalue[@iiii][39] = @textbox82
      @datavalue[@iiii][40] = @textbox4
      @datavalue[@iiii][41] = @textbox6
      @datavalue[@iiii][42] = @textbox79

      @datavalue[@iiii][43] = @xbhrh
      @datavalue[@iiii][44] = @xbhdp
      @datavalue[@iiii][45] = @p2tg - 273.15
      @datavalue[@iiii][46] = @xbp2 * 1000
      @datavalue[@iiii][47] = @p2tgoutave - 273.15
      @datavalue[@iiii][48] = @p2xoutave * 1000
      @datavalue[@iiii][49] = @axoutaverh
      @datavalue[@iiii][50] = @axoutavedp
      @datavalue[@iiii][51] = @xbhoutrh
      @datavalue[@iiii][52] = @xbhoutdp
      @datavalue[@iiii][53] = @up
      @datavalue[@iiii][54] = @up2
      @datavalue[@iiii][55] = @etpain
      @datavalue[@iiii][56] = @etpaout
      @datavalue[@iiii][57] = @etphin
      @datavalue[@iiii][58] = @etphout
      @datavalue[@iiii][59] = @etppin
      @datavalue[@iiii][60] = @etppout
      @datavalue[@iiii][61] = @etpp2in
      @datavalue[@iiii][62] = @etpp2out
      @datavalue[@iiii][63] = @etppoutmix
      @vaout = 4.555*(0.622 + @axoutave)*@atgoutave * 101.32 / (1000 * @label139.to_f / 10)
      @datavalue[@iiii][64] = @datavalue[@iiii][5]
      @datavalue[@iiii][65] = @textbox22.to_f / @vp * @vpout * (273.15 + 20) / @ptgoutave
      @datavalue[@iiii][66] = @textbox79.to_f / @vp * @vpoutmix * (273.15 + 20) / @ptgoutavemix
      @datavalue[@iiii][67] = @textbox38.to_f / @vh * @vhout * (273.15 + 20) / @htgoutave
      @datavalue[@iiii][68] = @textbox77.to_f

      @datavalue[@iiii][69] = @xbrh
      @datavalue[@iiii][70] = @xbdp
      @datavalue[@iiii][71] = @xbprh
      @datavalue[@iiii][72] = @xbpdp

      @datavalue[@iiii][73] = @textbox80.to_f
      @datavalue[@iiii][74] = @textbox65.to_f
      @datavalue[@iiii][75] = @textbox22.to_f

      if (@radiobutton6 == true)
        @datavalue[@iiii][3] = @itgc * 1.8 + 32
        @datavalue[@iiii][4] = @xb * 1000 * 7
        @datavalue[@iiii][5] = @textbox29.to_f
        @datavalue[@iiii][6] = (@htg - 273.15) * 1.8 + 32
        @datavalue[@iiii][7] = @xbh * 1000 * 7
        @datavalue[@iiii][8] = @textbox32.to_f
        @datavalue[@iiii][9] = (@atgoutave - 273.15) * 1.8 + 32
        @datavalue[@iiii][10] = @datavalue[@iiii][10] * 7
        @datavalue[@iiii][11] = (@ptgoutave - 273.15) * 1.8 + 32
        @datavalue[@iiii][12] = (@htgoutave - 273.15) * 1.8 + 32
        @datavalue[@iiii][13] = @hxoutave * 1000 * 7
        @datavalue[@iiii][14] = @energyh * 1000 / 0.29307107
        @datavalue[@iiii][15] = 0.004015*@textbox55.to_f
        @datavalue[@iiii][16] = 0.004015*@textbox56.to_f
        if (@textbox73.to_s != "-")
          @datavalue[@iiii][17] = 0.004015*@textbox73.to_f
        end
        @datavalue[@iiii][18] = @iu / 0.00508
        @datavalue[@iiii][19] = @uh / 0.00508
        @datavalue[@iiii][20] = @datavalue[@iiii][20] * 2.204623
        @datavalue[@iiii][28] = @axoutave * 1000 * 7
        @datavalue[@iiii][29] = @pxoutave * 1000 * 7
        @datavalue[@iiii][30] = (@ptgoutavemix - 273.15) * 1.8 + 32
        @datavalue[@iiii][31] = @pxoutavemix * 1000 * 7
        @datavalue[@iiii][32] = @textbox10.to_f * 1.8 + 32
        @datavalue[@iiii][33] = @textbox19.to_f * 7
        @datavalue[@iiii][34] = (@ptgmix.to_f - 273.15) * 1.8 + 32
        @datavalue[@iiii][35] = @pxmix.to_f * 1000 * 7
        @datavalue[@iiii][36] = @textbox60.to_f * 1.8 + 32
        @datavalue[@iiii][37] = @textbox61.to_f * 7


        @datavalue[@iiii][38] = @textbox81.to_f * 1.8 + 32
        @datavalue[@iiii][39] = @textbox82.to_f * 7
        @datavalue[@iiii][40] = @textbox4.to_f* 1.8 + 32
        @datavalue[@iiii][41] = @textbox6.to_f * 7
        @datavalue[@iiii][42] = @textbox79.to_f / 1.699
        @datavalue[@iiii][45] = (@p2tg - 273.15)* 1.8 + 32
        @datavalue[@iiii][46] = @xbp2 * 1000 * 7
        @datavalue[@iiii][47] = (@p2tgoutave - 273.15)* 1.8 + 32
        @datavalue[@iiii][48] = @p2xoutave * 1000 * 7
        @datavalue[@iiii][53] = @up / 0.00508
        @datavalue[@iiii][54] = @up2 / 0.00508
        @vaout = 4.555*(0.622 + @axoutave)*@atgoutave * 101.32 / (1000 * @label139.to_f / 10)
        @datavalue[@iiii][64] = @datavalue[@iiii][5] / 1.699
        @datavalue[@iiii][65] = @textbox22.to_f / @vp * @vpout * (273.15 + 20) / @ptgoutave / 1.699
        @datavalue[@iiii][66] = @textbox79.to_f / @vp * @vpoutmix * (273.15 + 20) / @ptgoutavemix / 1.699
        @datavalue[@iiii][67] = @textbox38.to_f / @vh * @vhout * (273.15 + 20) / @htgoutave / 1.699
      end
      @jjjj = @iiii
      okrange
      begin
        @textbox64 = @datavalue[@iiii][5].to_f.round(0).to_s
        @textbox84 = (@textbox64.to_f / 1.699).round(0).to_s


        @iiii = @iiii + 1
      rescue
        @flagini = 0
        @specify_error = true
        raise "Close the excel file"
      end
    end
  end
end
