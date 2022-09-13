class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

   # get all reviews
   get "/reviews" do
    review= Review.all
    review.to_json
  end

   #get authors
   get "/authors" do
    author= Author.all
    author.to_json
  end

    #get an author
    get "/authors/:id" do
      author = Author.find(params[:id])
      author.to_json(include: { reviews: { include: :user } })
    end

   #get users
   get "/users" do
    user= User.all
    user.to_json
  end

   #get a user
   get "/users/:id" do
    user = User.find(params[:id])
    user.to_json(include: { reviews: { include: :author } })
  end

  post "/users" do
    user= User.create(
      username: params[:username]
    )
    user.to_json
  end
  post "/reviews" do
    review= Review.create(
      comment: params[:comment],
      rate: params[:rate]
    )
    review.to_json
  end
end
