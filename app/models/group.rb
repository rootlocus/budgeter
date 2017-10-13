
class Group < ApplicationRecord
  belongs_to :user 
#  has_many :usergroup
  has_many :expenses , dependent: :destroy
#  has_many :users , uniqueness: {scope: :user_id}
  validates :groupname, presence: true 
end
