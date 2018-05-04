class Logo < ApplicationRecord
  belongs_to :user
  has_attached_file :banner, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/
end
