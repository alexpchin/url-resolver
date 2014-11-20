require "url-resolver/version"
require "uri"

module UrlResolver
  
  def self.resolve(page_url, href)
    raise ArgumentError, "You need to provide a root url." if url.nil?
    raise ArgumentError, "You need to provide a path to resolve." if path_to_resolve.nil?

    if !path_to_resolve.include?("http")     
      if path_to_resolve.include?("//")
        URI.join(url, "http:#{path_to_resolve}").to_s
      else 
        URI.join(url, path_to_resolve).to_s
      end
    else
      path_to_resolve
    end
  end

end