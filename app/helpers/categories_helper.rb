module CategoriesHelper
	def get_category
		categories = Category.all
  #       categories.each do |category|
		# 	puts "category id is========================"
		# 	puts category
		# 	@category_id = category.id
		# 	@category_name = category.name
		# end
		# render "/products_controller/get_product(category)"
	end
end
