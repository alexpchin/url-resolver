require "url-resolver/version"
require "uri"

module UrlResolver
  
  def self.resolve(page_url, href)
    raise ArgumentError, "You need to provide a root url." if page_url.nil?
    raise ArgumentError, "You need to provide a path to resolve." if href.nil?

    if !href.include?("http")     
      if href.include?("//")
        URI.join(page_url, "http:#{href}").to_s
      else 
        URI.join(page_url, href).to_s
      end
    else
      href
    end
  end

end