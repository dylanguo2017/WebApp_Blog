class Article < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	has_many :comments , dependent: :destroy

	validates :title , presence: true,
				length: { minimum: 3}

	has_attached_file :article_img, :styles => { :article_index => "250x350>", :article_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :article_img, :content_type => /\Aimage\/.*\Z/
end
