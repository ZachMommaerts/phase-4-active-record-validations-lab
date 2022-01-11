class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", 'Non-Fiction'] }

    CLICKBAIT_TITLES = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ] 

    def clickbait?
        if CLICKBAIT_TITLES.none? { |title| title.match title }
          errors.add(:title, "get them clicks boi")
        end
      end
end
