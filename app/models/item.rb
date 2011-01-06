class Item < ActiveRecord::Base
  has_attached_file :attachment, :storage => :s3, :path => "xchg/:sha1/:filename",
                    :s3_credentials => {:bucket => ENV['S3_BUCKET'],
                                        :access_key_id => ENV['S3_ID'],
                                        :secret_access_key => ENV['S3_KEY']}
  validates_attachment_presence :attachment

  before_create :generate_sha1_digest

  def generate_sha1_digest
    self.sha1_digest ||= Digest::SHA1.hexdigest("#{attachment_file_name}-#{attachment_file_size}-#{rand}")
  end
end
