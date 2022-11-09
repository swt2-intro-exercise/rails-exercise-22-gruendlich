class Author < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  has_and_belongs_to_many :paper
  def name
    "#{first_name} #{last_name}"
  end
end
