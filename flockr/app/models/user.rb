class User < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  validates :email, presence: true, uniqueness: true
end
