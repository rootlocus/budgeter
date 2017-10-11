class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group
#  validates_uniqueness_of :user_group_id, :scope => [ :user_id, :group_id]
end
