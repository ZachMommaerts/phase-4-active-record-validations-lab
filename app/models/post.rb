class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", 'Non-Fiction'] }

    clickbait_titles = [
        
    ] 
    def no_clickbait_titles
        if title == 'True Facts'
            errors.add(:title, 'No clickbait ya dingus')
        end
    end
end
