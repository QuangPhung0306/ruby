module UnitSelection
  class Base
    include UnitSelection::LoadDefaultData
    include UnitSelection::MyFormLoad
    include UnitSelection::Checkbox19CheckedChanged
    include UnitSelection::InitialCalc
    include UnitSelection::InitialInput
    include UnitSelection::AreaSgp
    include UnitSelection::Combobox2SelectedIndexChanged
    include UnitSelection::Radiobutton9Checkedchanged
    include UnitSelection::Combobox8SelectedIndexChanged
    include UnitSelection::Button3Click
    include UnitSelection::Calculation
    include UnitSelection::CoefRotor
    include UnitSelection::DetCoef
    include UnitSelection::DstLayout
    include UnitSelection::ForwardCalc
    include UnitSelection::Okrange
    include UnitSelection::OptimalRotation
    include UnitSelection::PressureDropCalc
    include UnitSelection::RegenOutCalc
    include UnitSelection::ReverseCalc
    include UnitSelection::Selectdiameter
    include UnitSelection::TextboxTextChanged
    include UnitSelection::CheckboxCheckedChanged
    include UnitSelection::Radiobutton5CheckedChanged
    include UnitSelection::Radiobutton6CheckedChanged
    include UnitSelection::Radiobutton8Checkedchanged
    include UnitSelection::Radiobutton9Checkedchanged
    include UnitSelection::Button4Click
    include UnitSelection::CalcExtra
    include UnitSelection::Checkbox5CheckedChanged
    include UnitSelection::Combobox1SelectedIndexChanged
    include UnitSelection::Combobox4SelectedIndexChanged
    include UnitSelection::DataGridView1RowHeaderMouseClick


    def initialize user, model_type = nil
      @user = user
      load_default_data
      my_form_load user, model_type
    end

    def perform combobox2, combobox8
      combobox2_selected_index_changed combobox2
      combobox8_selected_index_changed combobox8
      button3_click
    end

    def get_form_element_values
      instance_variables.map do |attribute|
        next unless attribute.match /^@(textbox|checkbox|radiobutton|label|combobox)(([0-9]|[a-z])+)|(warning_messages)$/
        key = attribute.to_s.gsub("@", "")
        [key, self.instance_variable_get(attribute)]
      end.compact.to_h
    end
  end
end
