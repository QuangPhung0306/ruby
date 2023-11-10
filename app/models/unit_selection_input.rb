class UnitSelectionInput < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :m_unit, ->{where model_type: 2}, class_name: M::Unit.name
  belongs_to :m_category, class_name: M::Category.name

  serialize :unit_selection_object

  has_one :unit_selection_result, dependent: :destroy

  delegate :name, to: :m_category, prefix: true
  delegate :name, to: :m_unit, prefix: true

  def project_id
    self.unit_selection_result.project.id
  end

  def project_name
    self.unit_selection_result.project.name
  end

  def format_created_at
    self.project.created_at.strftime Settings.data_time_format.project
  end

  def format_updated_at
    self.project.updated_at.strftime Settings.data_time_format.project
  end
end
