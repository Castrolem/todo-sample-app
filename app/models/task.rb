class Task < ActiveRecord::Base
  attr_accessor :content

  validates :user_id, presence: true

  belongs_to :user
end
