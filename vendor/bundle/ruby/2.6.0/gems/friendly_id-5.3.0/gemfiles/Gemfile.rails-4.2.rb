source 'https://rubygems.org'

gemspec path: '../'

gem 'activerecord', '~> 4.2.1'
gem 'railties', '~> 4.2.1'
gem 'i18n', '~> 0.7.0'

# Database Configuration
group :development, :test do
  platforms :jruby do
    gem 'activerecord-jdbcmysql-adapter', '~> 1.3.14'
    gem 'activerecord-jdbcpostgresql-adapter', '~> 1.3.14'
    gem 'kramdown'
  end

  platforms :ruby, :rbx do
    gem 'sqlite3'
    gem 'mysql2', '~> 0.4.10'
    gem 'pg', '~> 0.15'
    gem 'redcarpet'
  end

  platforms :rbx do
    gem 'rubysl', '~> 2.0'
    gem 'rubinius-developer_tools'
  end
end
