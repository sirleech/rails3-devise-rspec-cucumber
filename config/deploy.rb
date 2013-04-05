require 'rvm/capistrano'

set :application, "devise-test"
set :repository,  "git://github.com/sirleech/rails3-devise-rspec-cucumber.git"
set :domain,      "54.252.88.222"
set :deploy_to,   "/home/ubuntu/#{application}"
set :scm,         "git"
set :user,        "ubuntu"

role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

