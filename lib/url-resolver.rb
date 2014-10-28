require "url-resolver/version"

module UrlResolver
  
  def self.resolve(url=nil, short_url=nil)
    raise ArgumentError, "You need to provide a root url." if url.nil?
    raise ArgumentError, "You need to provide a short url to resolve." if short_url.nil?

    if !short_url.include?("http")     
      if short_url.include?("//")
        "http:#{short_url}"
      else 
        "#{url}#{short_url}"
      end
    else
      short_url
    end
  end

end

# Note to self
# Could use Regex at some point
# [/^http/], [/^\/\//]