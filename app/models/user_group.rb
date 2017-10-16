class UserGroup < ApplicationRecord
#  belongs_to :user
  belongs_to :group
#  validates_uniqueness_of :user_group , :scope => [ :user_id, :group_id ]
  validates :user_id , uniqueness: { scope: :group_id }
end
