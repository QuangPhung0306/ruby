module UnitSelection::DstLayout
  def dst_layout
     @flagsgj = 0
     @flagdst = 1
     @flagsga = 0

     @picturebox2_visible = true
     @picturebox3_visible = false

     @picturebox2 = "DST logo.jpg"
     @label16 = "Category"

     @combobox3_enabled = false


     @label117_visible = true
     @label128_visible = true
     @label129_visible = true
     @label35 = "m /h"
     @label33 = "m /h"
     @label59 = "m /h"

     @checkbox1_visible = false
     @checkbox7_visible = false
     @checkbox8_visible = false
     @checkbox9_visible = false
     @checkbox10_visible = false
     @checkbox11_visible = false

     @checkbox1 = false
     @textbox5_enabled = false

     @checkbox13_visible = false

     @checkbox14_visible = false
     @checkbox15_visible = false
     @checkbox16_visible = false
     @checkbox17_visible = false

     @label127_visible = true
     @combobox8_visible = true
     @label97_visible = false

     @checkbox18_visible = false
     @checkbox18 = false
     @label121_visible = true

     @groupbox1 = "C'.Regen Air Inlet"
     @groupbox6 = "D.Purge Air"
     @groupbox7 = "E.Regen Air Inlet"
     @groupbox3 = "F.Regen Air"
     @groupbox8 = "G.Wet Air Outlet"
     @groupbox4 = "B.Dry Air Outlet"

     @groupbox14_visible = true

     if (@dstreptoolstripmenuitem == "-Rep")
       @textbox3_visible = false
       @textbox14_visible = false
       @textbox62_visible = false
       @label3_visible = false
       @label21_visible = false
       @label95_visible = false
       @label96_visible = false
     else
       @textbox3_visible = true
       @textbox14_visible = true
       @textbox62_visible = true
       @label3_visible = true
       @label21_visible = true
       @label95_visible = true
       @label96_visible = true
     end
  end
end