class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }

  validate :clickbait

  def clickbait
    clickbait_titles = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

    if clickbait_titles.none? { |clickbait| clickbait.match title }
      errors.add(:title, "Your title must be more clickbait-y")
    end
  end
end
