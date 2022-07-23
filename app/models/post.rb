class Post < ApplicationRecord
   
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate  :clickbait?

    Clickbait_array = [
       /Won't Believe/,
       /Secret/,
       /Top [number]/,
       /Guess/
      ]
    
      def clickbait?
        
        if Clickbait_array.none? { |arr| arr.match title }
          errors.add(:title, "must be clickbait")
        end
      end

end
