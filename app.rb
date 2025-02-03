require "sinatra"
require "sinatra/reloader"

get "/" do
  erb :home
end

# Route for square form
get "/square/new" do
  erb :square_form
end

# Route for square result
get "/square/results" do
  @number = params["number"].to_f
  @result = @number ** 2
  erb :square_result
end

# Route for square root form
get "/square_root/new" do
  erb :square_root_form
end

# Route for square root result
get "/square_root/results" do
  @number = params["user_number"].to_f
  @result = Math.sqrt(@number)
  erb :square_root_result
end

# Route for random number form
get "/random/new" do
  erb :random_form
end

# Route for random number result
get "/random/results" do
  @min = params["user_min"].to_f
  @max = params["user_max"].to_f
  @random_number = rand(@min..@max)
  erb :random_result
end

# Route for payment form
get "/payment/new" do
  erb :payment_form
end

# Route for payment result
get "/payment/results" do
  @apr = params["user_apr"]  
  @apr_monthly_rate = @apr.to_f / 100 / 12 # Convert APR to monthly rate
  @years = params["user_years"].to_i
  @principal = params["user_pv"].to_f

  n = @years * 12  # Total number of payments (months)
  @monthly_payment = (@apr_monthly_rate * @principal) / (1 - (1 + @apr_monthly_rate) ** -n)

  erb :payment_result
end
