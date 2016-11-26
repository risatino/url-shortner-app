class Link < ApplicationRecord
  belongs_to :user
  has_many :visits

  validates :target_url, :presence => true
  validates :slug, :presence => true
  validates :slug, :uniqueness => true

  def standardize_target_url!
    target_url.gsub!("http://", "")
    target_url.gsub!("https://", "")
  end

  def generate_slug
    alph = ('a'..'z').to_a
    num = ('0'..'9').to_a
    range = alph.concat(num)
    new_slug = ""
    5.times do 
      new_slug += range.sample
    end
    self.slug = new_slug
  end

  def visit_count
    visits.count
  end
end
