
class Group < ApplicationRecord
  belongs_to :user 
  has_many :user_groups , :class_name => 'UserGroup' , dependent: :destroy
  has_many :expenses , dependent: :destroy
#  has_many :users , uniqueness: {scope: :user_id}
  validates :groupname, presence: true 
end
