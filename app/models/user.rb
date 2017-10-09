class User < ApplicationRecord
#  belongs_to :group
  has_many :group , uniqueness: {scope: user_id}
  has_many :expense
#  belongs_to :expense
end
