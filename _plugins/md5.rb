require 'digest/md5'

module MDhash
  def md5(input)
    Digest::MD5.hexdigest input.strip
  end
end

Liquid::Template.register_filter(MDhash)
