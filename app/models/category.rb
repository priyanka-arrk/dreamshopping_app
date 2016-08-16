class Category < ActiveRecord::Base
	has_many :products
	validates :name, presence: true
	before_destroy :delete_products

	def delete_products
		products = Product.where(category_id: self.id)
		if products.present?
			products.destroy_all
		end
	end
end
