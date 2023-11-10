module UnitSelection::Okrange
  def okrange
    @flagok = 0
    if (@okinput == 0)
      if (@flagok == 0)
        @datatexts[@jjjj.to_i] = ""
      else
        @datatexts[@jjjj.to_i] = "Estimate"
      end
    end
  end
end
