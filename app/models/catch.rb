class Catch < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_one_attached :photo
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  scope :for_user, ->(user) { where(user:) }
  scope :all_catches, -> { includes(:user).order(created_at: :desc) }
end
