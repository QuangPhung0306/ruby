module UnitSelection::CalcExtra
  def calc_extra
    if (@combobox2.to_s == "Consorb")
      @flag1 = 11
      (1..500).to_a.each do |ijk|
        if (@comboBox8.to_s == @aaaa[ijk][1].to_s)
          @dstunit = ijk
        end
      end
      @flagw = @cc[@dstunit][12]
      calculation
    elsif (@combobox2.to_s == "Recusorb 1" || @combobox2.to_s == "Recusorb 2")
      @flag1 = 12
      (1..500).to_a.each do |ijk|
        if (@comboBox8.to_s == @aaaa[ijk][1].to_s)
          @dstunit = ijk
        end
       end
      @flagw = @cc[@dstunit][12]
      calculation
    else
      @flag1 = 14
      (1..500).to_a.each do |ijk|
        if (@comboBox8.to_s == @aaaa[ijk][1].to_s)
          @dstunit = ijk
        end
      end
      if (@dstunit != 500)
        @flagw = @cc[@dstunit][12]
        calculation
      end
    end
  end
end
