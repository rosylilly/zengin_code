require "bundler/gem_tasks"
require 'tasks/zengin'

task default: ['zengin:update', 'zengin:js']

task publish: [:default, :build] do
  sh "git commit --allow-empty -a -m '[publish] v#{ZenginCode.version}'"
  sh "gem push pkg/zengin_code-#{ZenginCode.version.sub('-p', '.')}.gem"
  sh "git tag v#{ZenginCode.version}"
  sh 'git push --tags'
  sh 'npm publish'
  sh 'bower register zengin-code git://github.com/rosylilly/zengin_code.git -f -q -s'
end
