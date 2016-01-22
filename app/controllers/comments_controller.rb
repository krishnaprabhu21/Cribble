class CommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		#find post
		@post = Post.find(params[:post_id])

		#create comments using comment content
		@comment = Comment.create(params[:comment].permit(:content))

		#assign comment to signed in user
		@comment.user_id = current_user.id

		#comments post to commented post
		@comment.post_id = @post.id

		if @comment.save
			redirect_to @post
		else
			render 'new'
		end
	end

end
