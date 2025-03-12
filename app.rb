require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end


get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do

  @users_number = params.fetch("users_number")

  @result = params.fetch("users_number").to_f ** 2

  erb(:square_results)
  end

  

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  
    @users_number = params.fetch("users_number")
  
    @result = @users_number.to_f ** 0.5
  
    erb(:square_root_results)
end


get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  
    @apr = params.fetch("apr").to_i.to_fs(:percentage, {:precision => 4}) 
    @years = params.fetch("years").to_i
    @principal = params.fetch("principal").to_i.to_fs(:currency, {:precision => 2}) 

    
    @r = params.fetch("apr").to_f / 100 / 12
    @n = @years.to_f * 12
    @numerator = (@r) * params.fetch("principal").to_f
    @denominator = 1 - ((1 + @r) ** (-@n))

    @result = @numerator / @denominator

    erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  
    @minimum_num = params.fetch("user_min").to_f
    @maximum_num = params.fetch("user_max").to_f
    @random = rand(@minimum_num..@maximum_num)

    erb(:random_results)
end
