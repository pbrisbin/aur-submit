require "bundler/gem_tasks"

task :submit do
  system("makepkg --source --clean") or raise $?
  system("bundle exec ./bin/aur-submit aur-submit-git-*.src.tar.gz") or raise $?
  system("rm -v aur-submit-git-*.src.tar.gz") or raise $?
end
