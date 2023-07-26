require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end


get("/howdy")  do

  erb(:hello) 

end

get("/goodbye") do

  erb(:goodbye)

end


get ("/square/new") do 
  erb (:new_square_calc)
end

get ("/square/results") do 
  @the_num = params.fetch("users_number").to_f 

  @the_result = @the_num ** 2 
  erb (:square_results) 
end


get ("/square_root/new") do 
  erb (:square_root)
end

get ("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = Math.sqrt(@the_num)
  erb(:square_root_results)
end


get ("/payment/new") do
  erb(:payment)
end

get ("/payment/results") do
  @the_apr = params.fetch("users_apr").to_f/100

  @the_years = params.fetch("users_years").to_f

  @the_principal = params.fetch("users_principal").to_f

  @the_payment = @the_principal*((@the_apr*(1+@the_apr)**(@the_years*12))/((1+@the_apr)**(@the_years*12)-1))

  erb(:payment_results)
end


get ("/random/new") do 
  erb (:random_new)
end

get ("/random/results") do
  @the_max = params.fetch("users_max").to_f

  @the_min = params.fetch("users_min").to_f


  @random_number = rand(@the_min..@the_max).to_f

  erb(:random_results)
end
