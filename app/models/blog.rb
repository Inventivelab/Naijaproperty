class Blog < ApplicationRecord
  belongs_to :user
  enum blog_feature: { Non_Featured: 0, Featured: 1 }
  enum blog_pro: { basic: 0, pro: 1 }
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 100}

  has_attached_file :image, styles: { large: "600x500>", medium: "300x300>", thumb: "170x75>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :slug_blogs, use: :slugged_blog

   def slug_blogs
     [
       :title,
       [:title, :created_at]
     ]
   end

   def self.recent
    order("created_at DESC")
   end

end
