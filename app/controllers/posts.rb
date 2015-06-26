require 'byebug'

# index page show all pages
get '/posts' do
  @posts = Post.all
  erb :"/post/post_all"
end

# create new page
get '/posts/new' do
	erb :"/post/post_new"
end

# show specific page
get '/posts/:id' do
	@post = Post.find(params[:id])
	erb :"/post/post_show"
end

post '/posts/create' do
	@tag = params[:tags]
	@newtag = @tag.split(' ')
	@post = Post.create(params[:post])

	if @newtag.empty?
		redirect to "/posts/#{@post.id}"
	else
		@newtag.each do |tag|
			@post.tags << Tag.find_or_create_by(name:"#{tag}")
			redirect to "/posts/#{@post.id}"
		end	
	end	
end

get '/posts/:id/edit' do
	@post = Post.find(params[:id])
	erb :"/post/post_edit"
end

patch '/posts/:id/edit' do
	@tag = params[:tags]
	# @post = Post.create(params[:post])
	@post = Post.find(params[:id])
	@post.update(params[:post])
	
	redirect to "/posts/#{@post.id}"
end

post '/posts/:id/delete' do
	@post = Post.find(params[:id])
	@post.destroy

	redirect to '/posts'
end

=begin
post = Post.create(title:"title")
post.tags.create(name:"newtag")

post.tags #return the tag information related to post

#another way

tag = Tag.create(name:"another tag")
post.tags << tag #like up there
post.tags #until here tags has 2 tags
=end