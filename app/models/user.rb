class User < ActiveRecord::Base
  validates :email, :presence => true, :email => true
  has_many :items, :order => 'attachment_updated_at desc'

  before_create :generate_public_token

  def generate_public_token
    self.public_token ||= Digest::SHA1.hexdigest("#{email}-#{rand}")[0..10]
  end
end
