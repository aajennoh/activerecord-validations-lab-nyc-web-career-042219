class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :sufficiently_clickbaity
  
  def sufficiently_clickbaity
    if self.title
      if !self.title.include?("Won't Believe" || "Secret" || "Guess" || "Top [number]")
      errors.add(:title, "Not clickbait-y enough")
      end
    end  
  end

end