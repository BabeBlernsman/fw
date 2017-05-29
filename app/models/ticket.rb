class Ticket < ActiveRecord::Base
  belongs_to :user
  has_many :answers,        dependent: :destroy
  enum assign_status: [:not_assigned, :assigned]
  enum access: [:open, :closed]
end
