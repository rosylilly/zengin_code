require "bundler/gem_tasks"
require 'tasks/zengin'

task default: ['zengin:update', 'zengin:js']

task publish: [:default, :build] do
  require 'zengin_code'
  sh "git commit -a -m 'v#{ZenginCode::VERSION}'"
  sh "gem push pkg/zengin_code-#{ZenginCode::VERSION.sub('-p', '.')}.pkg"
  sh "git tag v#{ZenginCode::VERSION}"
  sh 'git push --tags'
  sh 'npm publish'
end
