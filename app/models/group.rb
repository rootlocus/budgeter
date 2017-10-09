
class Group < ApplicationRecord
  has_many :expenses , dependent: :destroy
#  has_many :users , uniqueness: {scope: :user_id}
  validates :groupname, presence: true 
end
