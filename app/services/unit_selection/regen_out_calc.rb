module UnitSelection::RegenOutCalc
  def regen_out_calc
    if (@flag1 == 1 || @flag1 == 2 || @flag1 == 7 || @combobox2.to_s == "Consorb")
      @hxoutave = @sorp / @uh / @csh / @htg * (273.15 + 20) * @vh / 3600 + @xbh
      @htgoutave = @htg

      @cpadain = 0.000000000456067*((@itg - 273.15)**3) + 0.000000233002*((@itg - 273.15)**2) + 0.0000366954*(@itg - 273.15) + 1.00384
      @cpah2oin = 0.00000000073338*((@itg - 273.15)**3) + 0.000000819159*((@itg - 273.15)**2) + 0.00019252*(@itg - 273.15) + 1.86036
      @etpain = @cpadain*(@itg - 273.15) + (@cpah2oin*(@itg - 273.15) + 2501)*(@xb)

      @cpadaout = 0.000000000456067*((@atgoutave - 273.15)**3) + 0.000000233002*((@atgoutave - 273.15)**2) + 0.0000366954*(@atgoutave - 273.15) + 1.00384
      @cpah2oout = 0.00000000073338*((@atgoutave - 273.15)**3) + 0.000000819159*((@atgoutave - 273.15)**2) + 0.00019252*(@atgoutave - 273.15) + 1.86036
      @etpaout = @cpadaout*(@atgoutave - 273.15) + (@cpah2oout*(@atgoutave - 273.15) + 2501)*(@axoutave)

      while (@etpjudge>0.1 || @etpjudge<-0.1)
        @cphdain = 0.000000000456067*((@htg - 273.15)**3) + 0.000000233002*((@htg - 273.15)**2) + 0.0000366954*(@htg - 273.15) + 1.00384
        @cphh2oin = 0.00000000073338*((@htg - 273.15)**3) + 0.000000819159*((@htg - 273.15)**2) + 0.00019252*(@htg - 273.15) + 1.86036
        @etphin = @cphdain*(@htg - 273.15) + (@cphh2oin*(@htg - 273.15) + 2501)*(@xbh)

        @cphdaout = 0.000000000456067*((@htgoutave - 273.15)**3) + 0.000000233002*((@htgoutave - 273.15)**2) + 0.0000366954*(@htgoutave - 273.15) + 1.00384
        @cphh2oout = 0.00000000073338*((@htgoutave - 273.15)**3) + 0.000000819159*((@htgoutave - 273.15)**2) + 0.00019252*(@htgoutave - 273.15) + 1.86036
        @etphout = @cphdaout*(@htgoutave - 273.15) + (@cphh2oout*(@htgoutave - 273.15) + 2501)*(@hxoutave)

        @etpjudge = (@etpaout - @etpain) *@iu*@csa * @itg / (273.15 + 20) / @v * 3600 - (@etphin - @etphout) * @uh * @csh * @htg / (273.15 + 20) / @vh * 3600
        if (@etpjudge > 0)
          @htgoutave = @htgoutave - 0.00001*@etpjudge
        else
          @htgoutave = @htgoutave + 0.00001*@etpjudge
        end
        if (@roop>100000)
          break
        end
        @roop = @roop + 1
      end
      @roop = 0
    elsif (@flag1 == 3 || @flag1 == 4 || @flag1 == 6 || @flag1 == 8 || @flagsgj == 3 || @combobox2.to_s == "Recusorb 1" || @combobox2.to_s == "Recusorb 2")
      @hxoutave = (@sorp - @psorp) / @uh / @csh / @htg * (273.15 + 20) * @vh / 3600 + @xbh
      @htgoutave = @htg

      @cpadain = 0.000000000456067*((@itg - 273.15)**3) + 0.000000233002*((@itg - 273.15)**2) + 0.0000366954*(@itg - 273.15) + 1.00384
      @cpah2oin = 0.00000000073338*((@itg - 273.15)**3) + 0.000000819159*((@itg - 273.15)**2) + 0.00019252*(@itg - 273.15) + 1.86036
      @etpain = @cpadain*(@itg - 273.15) + (@cpah2oin*(@itg - 273.15) + 2501)*(@xb)

      @cpadaout = 0.000000000456067*((@atgoutave - 273.15)**3) + 0.000000233002*((@atgoutave - 273.15)**2) + 0.0000366954*(@atgoutave - 273.15) + 1.00384
      @cpah2oout = 0.00000000073338*((@atgoutave - 273.15)**3) + 0.000000819159*((@atgoutave - 273.15)**2) + 0.00019252*(@atgoutave - 273.15) + 1.86036
      @etpaout = @cpadaout*(@atgoutave - 273.15) + (@cpah2oout*(@atgoutave - 273.15) + 2501)*(@axoutave)

      @cppdain = 0.000000000456067*((@ptg - 273.15)**3) + 0.000000233002*((@ptg - 273.15)**2) + 0.0000366954*(@ptg - 273.15) + 1.00384
      @cpph2oin = 0.00000000073338*((@ptg - 273.15)**3) + 0.000000819159*((@ptg - 273.15)**2) + 0.00019252*(@ptg - 273.15) + 1.86036
      @etppin = @cppdain*(@ptg - 273.15) + (@cpph2oin*(@ptg - 273.15) + 2501)*(@xbp)

      @cppdaout = 0.000000000456067*((@ptgoutave - 273.15)**3) + 0.000000233002*((@ptgoutave - 273.15)**2) + 0.0000366954*(@ptgoutave - 273.15) + 1.00384
      @cpph2oout = 0.00000000073338*((@ptgoutave - 273.15)**3) + 0.000000819159*((@ptgoutave - 273.15)**2) + 0.00019252*(@ptgoutave - 273.15) + 1.86036
      @etppout = @cppdaout*(@ptgoutave - 273.15) + (@cpph2oout*(@ptgoutave - 273.15) + 2501)*(@pxoutave)

      @cpp2dain = 0.000000000456067*((@p2tg - 273.15)**3) + 0.000000233002*((@p2tg - 273.15)**2) + 0.0000366954*(@p2tg - 273.15) + 1.00384
      @cpp2h2oin = 0.00000000073338*((@p2tg - 273.15)**3) + 0.000000819159*((@p2tg - 273.15)**2) + 0.00019252*(@p2tg - 273.15) + 1.86036
      @etpp2in = @cpp2dain*(@p2tg - 273.15) + (@cpp2h2oin*(@p2tg - 273.15) + 2501)*(@xbp2)

      @cpp2daout = 0.000000000456067*((@p2tgoutave - 273.15)**3) + 0.000000233002*((@p2tgoutave - 273.15)**2) + 0.0000366954*(@p2tgoutave - 273.15) + 1.00384
      @cpp2h2oout = 0.00000000073338*((@p2tgoutave - 273.15)**3) + 0.000000819159*((@p2tgoutave - 273.15)**2) + 0.00019252*(@p2tgoutave - 273.15) + 1.86036
      @etpp2out = @cpp2daout*(@p2tgoutave - 273.15) + (@cpp2h2oout*(@p2tgoutave - 273.15) + 2501)*(@p2xoutave)

      @cppdaoutmix = 0.000000000456067*((@ptgoutavemix - 273.15)**3) + 0.000000233002*((@ptgoutavemix - 273.15)**2) + 0.0000366954*(@ptgoutavemix - 273.15) + 1.00384
      @cpph2ooutmix = 0.00000000073338*((@ptgoutavemix - 273.15)**3) + 0.000000819159*((@ptgoutavemix - 273.15)**2) + 0.00019252*(@ptgoutavemix - 273.15) + 1.86036
      @etppoutmix = @cppdaoutmix*(@ptgoutavemix - 273.15) + (@cpph2ooutmix*(@ptgoutavemix - 273.15) + 2501)*(@pxoutavemix)

      while (@etpjudge>0.1 || @etpjudge<-0.1)
        @cphdain = 0.000000000456067*((@htg - 273.15)**3) + 0.000000233002*((@htg - 273.15)**2) + 0.0000366954*(@htg - 273.15) + 1.00384
        @cphh2oin = 0.00000000073338*((@htg - 273.15)**3) + 0.000000819159*((@htg - 273.15)**2) + 0.00019252*(@htg - 273.15) + 1.86036
        @etphin = @cphdain*(@htg - 273.15) + (@cphh2oin*(@htg - 273.15) + 2501)*(@xbh)

        @cphdaout = 0.000000000456067*((@htgoutave - 273.15)**3) + 0.000000233002*((@htgoutave - 273.15)**2) + 0.0000366954*(@htgoutave - 273.15) + 1.00384
        @cphh2oout = 0.00000000073338*((@htgoutave - 273.15)**3) + 0.000000819159*((@htgoutave - 273.15)**2) + 0.00019252*(@htgoutave - 273.15) + 1.86036
        @etphout = @cphdaout*(@htgoutave - 273.15) + (@cphh2oout*(@htgoutave - 273.15) + 2501)*(@hxoutave)

        if (@flagsgj == 3)
          @etpjudge = (@etpaout - @etpain) *@iu*@csa * @itg / (273.15 + 20) / @v * 3600 - (@etphin - @etphout) * @uh * @csh * @htg / (273.15 + 20) / @vh * 3600 - (@etppin - @etppout) * @up * @csp * @ptg / (273.15 + 20) / @vp * 3600
        else
          @etpjudge = (@etpaout - @etpain) *@iu*@csa * @itg / (273.15 + 20) / @v * 3600 - (@etphin - @etphout) * @uh * @csh * @htg / (273.15 + 20) / @vh * 3600 - (@etppin - @etppoutmix) * @uh * @csh * @htg / (273.15 + 20) / @vh * 3600
        end

        if (@etpjudge > 0)
          @htgoutave = @htgoutave - 0.00001*@etpjudge
        else
          @htgoutave = @htgoutave + 0.00001*@etpjudge
        end

        if (@roop>100000)
          break
        end
        @roop = @roop + 1
      end
      @roop = 0
    elsif (@flag1 == 5)
      @hxoutave = (@sorp - @psorp) / @uh / @csh / @htg * (273.15 + 20) * @vh / 3600 + @xbh
      @htgoutave = @htg

      @cpadain = 0.000000000456067*((@itg - 273.15)**3) + 0.000000233002*((@itg - 273.15)**2) + 0.0000366954*(@itg - 273.15) + 1.00384
      @cpah2oin = 0.00000000073338*((@itg - 273.15)**3) + 0.000000819159*((@itg - 273.15)**2) + 0.00019252*(@itg - 273.15) + 1.86036
      @etpain = @cpadain*(@itg - 273.15) + (@cpah2oin*(@itg - 273.15) + 2501)*(xb)

      @cpadaout = 0.000000000456067*((@atgoutave - 273.15)**3) + 0.000000233002*((@atgoutave - 273.15)**2) + 0.0000366954*(@atgoutave - 273.15) + 1.00384
      @cpah2oout = 0.00000000073338*((@atgoutave - 273.15)**3) + 0.000000819159*((@atgoutave - 273.15)**2) + 0.00019252*(@atgoutave - 273.15) + 1.86036
      @etpaout = @cpadaout*(@atgoutave - 273.15) + (@cpah2oout*(@atgoutave - 273.15) + 2501)*(@axoutave)

      @cppdain = 0.000000000456067*((@ptg - 273.15)**3) + 0.000000233002*((@ptg - 273.15)**2) + 0.0000366954*(@ptg - 273.15) + 1.00384
      @cpph2oin = 0.00000000073338*((@ptg - 273.15)**3) + 0.000000819159*((@ptg - 273.15)**2) + 0.00019252*(@ptg - 273.15) + 1.86036
      @etppin = @cppdain*(@ptg - 273.15) + (@cpph2oin*(@ptg - 273.15) + 2501)*(@xbp)

      @cppdaout = 0.000000000456067*((@ptgoutave - 273.15)**3) + 0.000000233002*((@ptgoutave - 273.15)**2) + 0.0000366954*(@ptgoutave - 273.15) + 1.00384
      @cpph2oout = 0.00000000073338*((@ptgoutave - 273.15)**3) + 0.000000819159*((@ptgoutave - 273.15)**2) + 0.00019252*(@ptgoutave - 273.15) + 1.86036
      @etppout = @cppdaout*(@ptgoutave - 273.15) + (@cpph2oout*(@ptgoutave - 273.15) + 2501)*(@pxoutave)

      @cpp2dain = 0.000000000456067*((@p2tg - 273.15)**3) + 0.000000233002*((@p2tg - 273.15)**2) + 0.0000366954*(@p2tg - 273.15) + 1.00384
      @cpp2h2oin = 0.00000000073338*((@p2tg - 273.15)**3) + 0.000000819159*((@p2tg - 273.15)**2) + 0.00019252*(@p2tg - 273.15) + 1.86036
      @etpp2in = @cpp2dain*(@p2tg - 273.15) + (@cpp2h2oin*(@p2tg - 273.15) + 2501)*(@xbp2)

      @cpp2daout = 0.000000000456067*((@p2tgoutave - 273.15)**3) + 0.000000233002*((@p2tgoutave - 273.15)**2) + 0.0000366954*(@p2tgoutave - 273.15) + 1.00384
      @cpp2h2oout = 0.00000000073338*((@p2tgoutave - 273.15)**3) + 0.000000819159*((@p2tgoutave - 273.15)**2) + 0.00019252*(@p2tgoutave - 273.15) + 1.86036
      @etpp2out = @cpp2daout*(@p2tgoutave - 273.15) + (@cpp2h2oout*(@p2tgoutave - 273.15) + 2501)*(@p2xoutave)

      @cppdaoutmix = 0.000000000456067*((@ptgoutavemix - 273.15)**3) + 0.000000233002*((@ptgoutavemix - 273.15)**2) + 0.0000366954*(@ptgoutavemix - 273.15) + 1.00384
      @cpph2ooutmix = 0.00000000073338*((@ptgoutavemix - 273.15)**3) + 0.000000819159*((@ptgoutavemix - 273.15)**2) + 0.00019252*(@ptgoutavemix - 273.15) + 1.86036
      @etppoutmix = @cppdaoutmix*(@ptgoutavemix - 273.15) + (@cpph2ooutmix*(@ptgoutavemix - 273.15) + 2501)*(@pxoutavemix)

      while (@etpjudge>0.1 || @etpjudge<-0.1)
        @cphdain = 0.000000000456067*((@htg - 273.15)**3) + 0.000000233002*((@htg - 273.15)**2) + 0.0000366954*(@htg - 273.15) + 1.00384
        @cphh2oin = 0.00000000073338*((@htg - 273.15)**3) + 0.000000819159*((@htg - 273.15)**2) + 0.00019252*(@htg - 273.15) + 1.86036
        @etphin = @cphdain*(@htg - 273.15) + (@cphh2oin*(@htg - 273.15) + 2501)*(@xbh)

        @cphdaout = 0.000000000456067*((@htgoutave - 273.15)**3) + 0.000000233002*((@htgoutave - 273.15)**2) + 0.0000366954*(@htgoutave - 273.15) + 1.00384
        @cphh2oout = 0.00000000073338*((@htgoutave - 273.15)**3) + 0.000000819159*((@htgoutave - 273.15)**2) + 0.00019252*(@htgoutave - 273.15) + 1.86036
        @etphout = @cphdaout*(@htgoutave - 273.15) + (@cphh2oout*(@htgoutave - 273.15) + 2501)*(@hxoutave)

        @etpjudge = (@etpaout - @etpain) *@iu*@csa * @itg / (273.15 + 20) / @v * 3600 - (@etphin - @etphout) * @uh * @csh * @htg / (273.15 + 20) / @vh * 3600 - (@etppin - @etppoutmix) * @up * @csp * @ptg / (273.15 + 20) / @vp * 3600

        if (@etpjudge > 0)
          @htgoutave = @htgoutave - 0.00001*@etpjudge
        else
          @htgoutave = @htgoutave + 0.00001*@etpjudge
        end

        if (@roop>100000)
          break
        end
        @roop = @roop + 1
      end
      @roop = 0
    end
  end
end
