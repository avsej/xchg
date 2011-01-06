module Paperclip
  module Interpolations
    def sha1(attachment, style_name)
      attachment.instance.generate_sha1_digest
    end
  end
end

