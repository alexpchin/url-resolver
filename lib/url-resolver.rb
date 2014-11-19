require "url-resolver/version"
require "pathname"

module UrlResolver
  
  def self.resolve(url=nil, path_to_resolve=nil)
    raise ArgumentError, "You need to provide a root url." if url.nil?
    raise ArgumentError, "You need to provide a path to resolve." if path_to_resolve.nil?

    if !path_to_resolve.include?("http")     
      if path_to_resolve.include?("//")
        "http:#{path_to_resolve}"
      else 
        File.expand_path(path_to_resolve, url)
      end
    else
      path_to_resolve
    end
  end

end

# Note to self
# Could use Regex at some point
# [/^http/], [/^\/\//]