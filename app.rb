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
  apr = params.fetch("user_apr").to_f.round(4)/100

  monthlyapr= apr/12

  @the_apr = (apr*100).round(4).to_s(:percentage)

  @the_years = params.fetch("user_years").to_i

  @the_principal = params.fetch("user_pv").to_f

  installments = (@the_principal*(monthlyapr)*(((1+monthlyapr)**(@the_years*12))/(((1+monthlyapr)**(@the_years*12))-1))).to_f

  @the_payment = installments.round(2).to_s(:currency)


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
