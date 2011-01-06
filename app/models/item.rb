class Item < ActiveRecord::Base
  validates_attachment_presence :attachment
  has_attached_file :attachment, :storage => :s3,
                    :url => ":s3_alias_url", :path => "/xchg/:sha1/:filename",
                    :bucket => ENV['S3_BUCKET'],
                    :s3_headers => { 'Expires' => 1.year.from_now.httpdate },
                    :s3_host_alias => ENV['S3_CNAME'],
                    :s3_credentials => {:access_key_id => ENV['S3_ID'], :secret_access_key => ENV['S3_KEY']}

  before_create :generate_sha1_digest

  def generate_sha1_digest
    self.sha1_digest ||= Digest::SHA1.hexdigest("#{attachment_file_name}-#{attachment_file_size}-#{rand}")
  end
end
