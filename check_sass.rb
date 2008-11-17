require 'rubygems'
require 'open-uri'

PROJECT_PATH = '/Users/justin/Projects/Wakoopa/wakoopa/' # don't forget the last /
SASS_DIRECTORY_PATH = "#{PROJECT_PATH}public/stylesheets/sass/"

def search_contents_for(string = '')
  string = string.to_s
  search_string = string[1..(string.size)]
  search_query = case string[0...1]
  when '#'
    %{id="#{search_string.gsub(/"/, '\\"')}"|id='#{search_string.gsub(/'/, '\\\'')}'|:id\\s*=>\\s*"#{search_string.gsub(/"/, '\\"')}"|:id\\s*=>\\s*'#{search_string.gsub(/'/, '\\\'')}'}
  when '.'
    %{class="#{search_string.gsub(/"/, '\\"')}"|class='#{search_string.gsub(/'/, '\\\'')}'|:class\\s*=>\\s*"#{search_string.gsub(/"/, '\\"')}"|:class\\s*=>\\s*'#{search_string.gsub(/'/, '\\\'')}'}
  end
  # puts search_query
  `cd #{PROJECT_PATH}; ack "#{search_query.to_s.gsub(/"/, '\\"')}" --ignore-dir=log --ignore-dir=tmp --ignore-dir=doc --ignore-dir=vendor --ignore-dir=.git`
end

stylesheets = Dir.new(SASS_DIRECTORY_PATH).entries - ['.', '..']
stylesheets.each do |sass_file|
  stylesheet = open(SASS_DIRECTORY_PATH + sass_file).read
  stylesheet.scan(/^(?:[^:]*)([#\.](?:[\w]*))/).each do |match|
    result = search_contents_for(match)
    if result == ""
      puts match
    end
  end
end