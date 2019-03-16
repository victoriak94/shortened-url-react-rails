class ShortenedUrlsController < ApplicationController

    def index
        @url = ShortenedUrl.new
    end

    def show
        redirect_to @url.sanitize_url
    end

    def create
        @url = ShortenedUrl.new
        @url.original_url = params[:original_url]
        @url.sanitize
        if @url.new_url?
            if @url.save
                redirect_to shortened_path(@url.short_url)
            else
                flash[:error] = "Check the error below:"
                render 'index'
            end
        else
            flash[:notice] = "A Short link for this URL already exists"
            redirect_to shortened_path(@url.find_duplicate.short_url)
        end
    end

end
