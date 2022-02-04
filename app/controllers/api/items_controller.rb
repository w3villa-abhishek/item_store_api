class Api::ItemsController < Api::ApplicationController


	def listing
		items = Item.all
		render json: {
			success: true,
			items: items
		}
	end

	def update_price
		item = Item.find(params[:id])
		if item.update(params.require(:item).permit(:price))
			render json: {
			success: true,
			updated_item: item
		}
		else
			render json: {
				success: false,
				errors: item.errors.full_messages.flatten.join(',')
			}
		end
	end

	def check_price
		# params[:quantity] = {MUG: 1, TSHIRT: 1, HOODIE: 1 }
		price = calculate_total_price(params[:quantity])
		render json: {
			success: true,
			price: price 
		}
	end


	private

	def get_item_price_by_code(code)
		Item.find_by(code: code).price
	end

	def calculate_total_price(hash)
		hash.keys.map { |key| get_item_price_by_code(key) * hash[key].to_i }.sum
	end


end
