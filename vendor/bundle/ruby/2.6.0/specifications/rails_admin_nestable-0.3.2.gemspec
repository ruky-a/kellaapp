# -*- encoding: utf-8 -*-
# stub: rails_admin_nestable 0.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rails_admin_nestable".freeze
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrea Dal Ponte".freeze]
  s.date = "2015-05-23"
  s.description = "RailsAdmin Drag and drop tree view for Ancestry gem with ActiveRecord and MongoID".freeze
  s.email = ["info@andreadalponte.com".freeze]
  s.homepage = "https://github.com/dalpo/rails_admin_nestable".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "RailsAdmin Drag and drop tree view for Ancestry gem".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails_admin>.freeze, [">= 0.6.6"])
      s.add_runtime_dependency(%q<haml-rails>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<coffee-rails>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<sass-rails>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails_admin>.freeze, [">= 0.6.6"])
      s.add_dependency(%q<haml-rails>.freeze, [">= 0"])
      s.add_dependency(%q<coffee-rails>.freeze, [">= 0"])
      s.add_dependency(%q<sass-rails>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails_admin>.freeze, [">= 0.6.6"])
    s.add_dependency(%q<haml-rails>.freeze, [">= 0"])
    s.add_dependency(%q<coffee-rails>.freeze, [">= 0"])
    s.add_dependency(%q<sass-rails>.freeze, [">= 0"])
  end
end
