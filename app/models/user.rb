class User < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable, :trackable

  has_many :user_models, dependent: :nullify
  has_many :m_models, through: :user_models, class_name: M::Model.name
  has_many :projects, dependent: :destroy
  has_many :sender_email_histories, class_name: EmailHistory.name, foreign_key: :sender_id
  has_many :receiver_email_histories, class_name: EmailHistory.name, foreign_key: :receiver_id
  belongs_to :agency, optional: :normal?

  enum area: {other: 0, asia: 1}
  enum role: {admin: 1, normal: 2}

  accepts_nested_attributes_for :agency

  delegate :name, to: :agency, allow_nil: true, prefix: true

  scope :by_ids, -> (ids){where id: ids}
  scope :order_by_agency_name, ->{includes(:agency).order "agencies.name asc"}

  validates :password, presence: true, format: {with: Settings.regex.user_password}, allow_nil: true,
    length: {minimum: Settings.user_validate.password_length, maximum: Settings.user_validate.password_length}
  validate :agency_name_presence, if: :normal?

  def active_for_authentication?
    super && self.is_active
  end

  def can_access_room_calculation?
    m_models.pluck(:key_name).include? Settings.model_key.room_calculation
  end

  def can_access_unit_selection?
    m_models.pluck(:key_name).include? Settings.model_key.unit_selection
  end

  def can_access_air_mixture?
    m_models.pluck(:key_name).include? Settings.model_key.air_mixture_and_capacity
  end

  private
  def agency_name_presence
    errors.add :agency_name, I18n.t(".is_required") if agency_name.blank?
  end
end
