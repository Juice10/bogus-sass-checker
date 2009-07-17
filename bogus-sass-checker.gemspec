Gem::Specification.new do |s|
  # Project
  s.name         = 'bogus_sass_checker'
  s.summary      = "Checks your rails projects Sass files for #ids and .classes and checks if you are using them in the rest of your rails project."
  s.description  = "Checks your rails projects Sass files for #ids and .classes and checks if you are using them in the rest of your rails project. (Depends on ack)"
  s.version      = '0.1.1'
  s.date         = '2008-12-08'
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Justin Halsall"]
  s.email        = "zero200@gmail.com"
  s.homepage     = "http://www.github.com/Juice10/bogus-sass-checker"

  # Files
  root_files     = %w[MIT-LICENSE README Rakefile bogus-sass-checker.gemspec]
  bin_files      = %w[checksass]
  lib_files      = %w[bogus_sass_checker]
  test_files     = %w[]
  spec_files     = %w[]
  other_files    = %w[]
  s.bindir       = "bin"
  s.require_path = "lib"
  s.executables  = bin_files
  s.test_files   = test_files.map {|f| 'test/%s_test.rb' % f} + spec_files.map {|f| 'spec/%s_spec.rb' % f}
  s.files        = root_files + s.test_files + other_files + bin_files.map {|f| 'bin/%s' % f} + lib_files.map {|f| 'lib/%s.rb' % f}

  # rdoc
  s.has_rdoc         = true
  s.extra_rdoc_files = %w[ README MIT-LICENSE]
  s.rdoc_options << '--inline-source' << '--line-numbers' << '--main' << 'README'

  # Dependencies
  # s.add_dependency 'rspec', "> 0.0.0"

  # Requirements
  s.required_ruby_version = ">= 1.8.0"
end
