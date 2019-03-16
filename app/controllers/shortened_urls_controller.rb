class ShortenedUrlsController < ApplicationController

    def index
        @url = ShortenedUrl.new
    end

    def show
        redirect_to @url.sanitize_url
    end


end
