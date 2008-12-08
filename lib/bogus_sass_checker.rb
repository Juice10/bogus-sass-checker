require 'rubygems'
require 'open-uri'

unless system('which ack > /dev/null')
  puts "You must install ACK! http://petdance.com/ack/"
  exit 1
end

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