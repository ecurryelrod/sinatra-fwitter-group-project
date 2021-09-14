class User < ActiveRecord::Base
  has_many :tweets

  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

  def slug
    self.username.parameterize
  end

  def self.find_by_slug(slug)
    self.all.find {|x| x.slug == slug}
  end
end
