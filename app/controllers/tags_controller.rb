class TagsController < ApplicationController
	before_filter :require_login, only: [:destroy, :edit, :update]
	def show
		@tag = Tag.find(params[:id])
	end

	def index
		@tags = Tag.all
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def update
		@tag = Tag.find(params[:id])
		@tag.update_attributes(params[:tag])
		flash.notice = "Tag '#{@tag.name}' Updated!"
		redirect_to tag_path(@tag)
	end
end
