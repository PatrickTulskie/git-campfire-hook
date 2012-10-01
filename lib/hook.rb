#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), 'notification')

if ARGV.length != 3
  puts "Usage:  #{$0} ref oldrev newrev"
  exit
end

campfire_config = YAML.load_file(File.expand_path("~/.git_campfire.yml"))

GitCampfireNotification.new(:ref_name        => ARGV[0],
                            :old_revision    => `git rev-parse #{ARGV[1]}`.strip,
                            :new_revision    => `git rev-parse #{ARGV[2]}`.strip,
                            :campfire_config => campfire_config)
