module UnitSelection
  class BaseResult < Base
    def execute combobox8:, textbox1:, textbox4:, textbox7:, textbox6:, textbox23:, textbox79:
      selected_unit = M::Unit.send(@user.area).find_by_name combobox8
      return {} unless selected_unit
      selected_category = selected_unit.m_category
      combobox2_selected_index_changed selected_category.name
      combobox8_selected_index_changed combobox8

      if checkbox4_and_checkbox6_enable?(selected_category, selected_unit)
        if @checkbox4
          @checkbox4 = false
          checkbox4_checked_changed
        end

        if @checkbox6
          @checkbox6 = false
          checkbox6_checked_changed
        end
      end

      @textbox1 = textbox1
      textbox1_text_changed

      @textbox4 = textbox4
      textbox4_text_changed

      @textbox7 = textbox7
      textbox7_text_changed

      @textbox6 = textbox6
      textbox6_text_changed

      @textbox23 = textbox23
      textbox23_text_changed

      @textbox79 = textbox79
      textbox79_text_changed

      button3_click
      result
    end

    private
    def result
      {}
    end

    def checkbox4_and_checkbox6_enable? selected_category, selected_unit
      (selected_category.name == "Recusorb 1" && Settings.unit_groups.recusorb1_group.exclude?(selected_unit.name) ||
        selected_category.name == "Recusorb 2")
    end

    def trigger_change_checkbox
      if @checkbox4
        @checkbox4 = false
        checkbox4_checked_changed
      end

      if @checkbox6
        @checkbox6 = false
        checkbox6_checked_changed
      end
    end

    def change_textbox name, value
      self.instance_variable_set("@#{name}", value)
      return if name == "textbox59"
      if @flagini == 0
        if value != ""
          initial_calc
        end
      end
    end

    def change_textbox_value_by_mode input_name, value
      if @radiobutton5
        # instance_variable_set("@#{input_name}", value)
        change_textbox input_name, value
      else
        if Settings.unit_selection.si_input.include?(input_name)
          input_name_ip = Settings.unit_selection.ip_input[Settings.unit_selection.si_input.find_index(input_name)]
          # instance_variable_set("@#{input_name_ip}", value)
          change_textbox(input_name_ip, value)
        else
          # instance_variable_set("@#{input_name}", value)
          change_textbox input_name, value
        end
      end
    end
  end
end
