# frozen_string_literal: true
require File.expand_path("../lib/don-pages/assets", __FILE__)
require File.expand_path("../lib/don-pages/gems", __FILE__)
require File.expand_path("../lib/don-pages/version", __FILE__)

Gem::Specification.new do |s|
  s.name          = "don-pages"
  s.version       = DonPages::VERSION
  s.summary       = "Jekyll + our standard dependencies."
  s.description   = "For standardised CI build."

  s.license       = "GPL-3.0"
  s.homepage      = "http://github.com/abemedia/don-pages/"
  s.authors       = ["Adam Bouqdib"]
  s.email         = ["adam@abemedia.co.uk"]

  all_files       = `git ls-files -z`.split("\x0")
  s.files         = all_files.grep(%r{^(bin|lib)/|^.rubocop.yml$})
  s.executables   = all_files.grep(%r{^bin/}) { |f| File.basename(f) }

  DonPages::GEMS.each do |gem, version|
    s.add_dependency(gem, "= #{version}")
  end

  DonPages::ASSETS.each do |asset, version|
    s.add_dependency("rails-assets-#{asset}", "= #{version}")
  end

  s.add_development_dependency("rubocop", "~> 0.46")
end
