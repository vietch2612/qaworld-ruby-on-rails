class Article < ActiveRecord::Base
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :tag
  validates :title, presence: true, length: { minimum: 5 }
  has_attached_file :img_url, styles: { medium: "900x300>", thumb: "300x100>" }
  validates_attachment_content_type :img_url, content_type: /\Aimage\/.*\Z/
end
