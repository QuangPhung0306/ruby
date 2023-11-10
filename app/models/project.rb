class Project < ApplicationRecord
  before_validation :remove_white_space

  has_many :unit_selection_results, dependent: :destroy
  has_many :air_mixture_inputs, dependent: :nullify
  has_one :room_calculation_input, dependent: :destroy
  has_one :room_calculation_result, dependent: :destroy

  belongs_to :user

  enum calculation_type: {room_calculation: 1, air_mixture: 2, unit_selection: 3}

  validates :name, :date_of_project, presence: true
  validates :name, uniqueness: {case_sensitive: false, scope: [:user, :calculation_type]}

  def array_for_load_data
    room_calculation_result.chart_datas.map{|a| [a.elapsed_time.round(2).to_s + "h", a.moisture_content.round(2)]}
  end

  private
  def remove_white_space
    name.strip!
  end
end
