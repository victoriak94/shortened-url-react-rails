class ShortenedUrl < ApplicationRecord
    UNIQUE_ID_LENGTH = 7
    validates :original_url, presence: true, on: :create
    validates_format_of :original_url,
        with: /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
    before_create :generate_short_url
    before_create :sanitize

    # Unique URL function
    def generate_short_url
        url = ([*('a'..'z'),*('0'..'9')]).sample(UNIQUE_ID_LENGTH).join
        old_url = ShortenedUrl.where(short_url: url).last
        if old_url.present?
            self.generate_short_url
        else
            self.short_url = url
        end
    end

    # Check for pre-existing urls before saving to db
    def find_duplicate
        ShortenedUrl.find_by_sanitize_url(self.sanitize_url)
    end

    def new_url?
        find_duplicate.nil?
    end

    # Sanitize given url
    def sanitize
        self.original_url..to_s.strip!
        self.sanitize_url = self.original_url.to_s.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
        self.sanitize_url = "http://#(self.sanitize_url)"
    end
end
