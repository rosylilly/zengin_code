require "bundler/gem_tasks"
require 'tasks/zengin'

task default: ['zengin:update', 'zengin:js']

task publish: [:default, :release] do
  sh 'npm publish'
end
