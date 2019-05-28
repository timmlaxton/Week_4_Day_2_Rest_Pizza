require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/pizza_order')
also_reload('./models/*')

# INDEX - SHOW ALL PIZZAS

get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end


# NEW - DISPLAY A FORM TO MAKE A NEW PIZZA ORDER

get '/pizza-orders/new' do
  erb(:new)
end


# CREATE - CREATE A DATABASE ENTRY FOR THE NEW PIZZA ORDER

post '/pizza-orders' do
@order = PizzaOrder.new(params)
@order.save()
erb(:create)
end



# SHOW - DISPLAY ONE PIZZA

get '/pizza-orders/:id' do
@order = PizzaOrder.find(params[:id])
erb(:show)
end



# EDIT - DISPLAY A FORM TO EDIT A PIZZA ORDERS DETAILS

get '/pizza-order/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# UPDATE - UPDATES A DATABASE ENTRY FOR THE EDITED PIZZA ORDER

get '/pizza-order/:id' do
  @order = PizzaOrder.new(params)
  @order.update
  erb(:update)
end

# DELETE - DELTES A PIZZA ORDER FROM THE DATABASE


post '/pizza-orders/delete/:id' do
order = PizzaOrder.find(params[:id])
order.delete()
erb(:delete)
end
