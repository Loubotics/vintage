# == Schema Information
#
# Table name: shops
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  logo        :string(255)
#  url         :string(255)
#  address     :string(255)
#  lat         :float
#  lon         :float
#  facebook    :string(255)
#  twitter     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Shop < ActiveRecord::Base
  #attr_accessible :address, :facebook, :lat, :lat, :logo, :lon, :name, :twitter, :url, :description
  belongs_to :merchant, dependent: :destroy

  has_many :items

 	before_validation :smart_add_url_protocol
 	before_save { url.downcase! }
 	before_save :shop_bucket


 	def shop_bucket
		self.shop_bucket = self.name.to_s.squish.downcase.tr(" ","_")
	end

protected

	

	def smart_add_url_protocol
	  unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
	    self.url = "http://#{self.url}"
	  end
	end
end
