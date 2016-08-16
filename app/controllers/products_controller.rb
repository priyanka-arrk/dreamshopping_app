class ProductsController < ApplicationController

	def index
		if params[:category_id].present?
			@products = Product.where(category_id: params[:category_id]).paginate(page: params[:page], per_page: 12)
		else
			 @products = Product.all.paginate(page: params[:page], per_page: 12)
		end
	end

	def new
		@product = Product.new
	end

	def create
	  @product = Product.new(product_params)
	  if @product.save
		redirect_to @product, notice: 'successfully created the product'
	  else
		render :new
	  end
	end

	def edit
		@categories = Category.all
		@product = Product.find(params[:id])
	end

	def update
	  @product = Product.find(params[:id])
	  if @product.update(product_params)
   		redirect_to @product
      else
    	render 'edit'
  	  end
  	end

	def show
		@product = Product.find(params[:id])
		authorize! :read, @product
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		redirect_to products_path
	end

	# def get_product(category)
	# 	@product = Product.where(category_id: category)
	# end


	private
	def product_params
		params.require(:product).permit(:name, :product_type, :brand, :color, :price, :warranty_in_months, :image, :category_id)
	end


end
