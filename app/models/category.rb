class Category < ActiveRecord::Base
  has_many :article, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5}
end
