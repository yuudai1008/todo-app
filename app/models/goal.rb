class Goal < ApplicationRecord
  belongs_to :user
  has_many :todos, -> { order("done ASC, position ASC").includes(:goal) }, dependent: :destroy

 validates :title, presence: true
 
 enum status: { public: 0, private: 1 }, _prefix: true
 
end
