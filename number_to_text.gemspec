# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{number_to_text}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Scott Barr"]
  s.date = %q{2009-03-08}
  s.description = %q{Convert a number into text}
  s.email = %q{scottjbarr@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["config.yml", "init.rb", "Rakefile", "README.rdoc", "test/test_helper.rb", "test/unit/number_to_text_test.rb", "Manifest", "number_to_text.gemspec", "test/unit/number_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/scottbarr/number-to-text/tree/master}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Number_to_text", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{number_to_text}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Convert a number into text}
  s.test_files = ["test/test_helper.rb", "test/unit/number_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
