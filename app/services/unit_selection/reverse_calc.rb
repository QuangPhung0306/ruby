module UnitSelection::ReverseCalc
  def reverse_calc
    @premaxi = @maxi - 1;
    (1..@maxi.pred).to_a.reverse.each do |i|
      @rhowyy = @rhowy + @q[i] * @pm;
      @rhowz = @rhow + @q[i] * @rhow ;

      @cpg[i] = @cw + @q[i] * 4.179 * 1000;

      @pr = 0.717;

      @h = 0.03*(@wm**0.4)*9*1E-4 / @af*@cf*((@cf*18.57*1E-06 / 0.0241)**((2 / 3)*(-1)))

      if (@flagdst == 1)
        if (@rph / @optrot > 1)
          @kmassr = @h / @dens1 / @cf / (1**0.6666)*(5 - @coef16.to_f * @xb) * ((2 / @u)**@coef18.to_f)*(@coef19.to_f + @coef20.to_f*(@tg[@premaxi] - 273.15)) * @coef17.to_f;
        else
          @kmassr = @h / @dens1 / @cf / (1**0.6666)*(5 - @coef16.to_f * @xb) * ((2 / @u)**@coef18.to_f)*(@coef19.to_f + @coef20.to_f*(@tg[@premaxi] - 273.15)) * @coef17.to_f;
        end
      else
        @kmassr = @h / @dens1 / @cf / (1**0.6666)*(5 - @coef16.to_f * @xb) * ((2 / @u)**@coef18.to_f)*(@coef19.to_f + @coef20.to_f*(@tg[@premaxi] - 273.15)) * @coef17.to_f;
      end

      @c1 = -0.58002206 * 10000;
      @c2 = 1.3913993;
      @c3 = -0.04860239;
      @c4 = 0.41764768*0.0001;
      @c5 = -0.14452093*0.0000001;
      @c6 = 6.5459673;

      begin
        @pvs = Math.exp(@c1 / @tm[i] + @c2 + @c3* @tm[i] + @c4* (@tm[i]**2.0) + @c5* (@tm[i]**3.0) + @c6*Math.log(@tm[i]));
      rescue
      end
      @phi = (@a0 + @a1*@q[i] + @a2 * (@q[i]**2) + @a3* (@q[i]**3) + @a4* (@q[i]**4) + @a5* (@q[i]**5) + @a6* (@q[i]**6));
      if (@flagdst == 1)
        @xs[i] = 0.62198*@pvs * @phi / (101325 - @pvs * @phi)*(@coef12.to_f + @coef13.to_f*((@itg - 273.15) + (@ptg - 273.15)) / 2.0 + @coef14.to_f*@xb * 1000)*@coef11.to_f;

        @xx[i - 1] = @xx[i] + (2 * @dz * @kmassr) * (@xs[i] - @xx[i]) / @cellh / @u * (@coef1.to_f*@xb * 1000 + @coef2.to_f)*@coef15.to_f;
      else
        @xs[i] = 0.62198*@pvs * @phi / (101325 - @pvs * @phi)*(@coef12.to_f + @coef13.to_f*((@itg - 273.15) + (@ptg - 273.15)) / 2.0 + @coef14.to_f*@xb * 1000)*@coef11.to_f;

        @xx[i - 1] = @xx[i] + (2 * @dz * @kmassr) * (@xs[i] - @xx[i]) / @cellh / @u * (@coef1.to_f*@xb * 1000 + @coef2.to_f)*@coef15.to_f;
      end
      
      @tg[i - 1] = @tg[i] - (2 * @kmassr * @qad * @dz) * (@xs[i] - @xx[i]) / @cf / @cellh / @u * @coef3.to_f + (2 * @h * @dz) *(@tm[i] - @tg[i]) / @cf / @cellh / @u / @rhof * @coef4.to_f;
      @qpt[i] = @q[i] + (2 * @kmassr * @rhof * @dt) * (@xx[i] - @xs[i]) / @sheetw / @pm * @coef5.to_f;
      @q[i] = @qpt[i];

      @tmpt[i] = @tm[i] + (2 * @kmassr * @qad *@rhof * @dt) * (@xx[i] - @xs[i]) / @sheetw / @rhowyy / @cpg[i] * @coef6.to_f + (2 * @h * @dt) *(@tg[i] - @tm[i]) / @sheetw / @rhowyy / @cpg[i] * @coef7.to_f;
      @tm[i] = @tmpt[i];
    end
  end
end
