require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

# ATTENTION
# In default, Serverspec uses the context specified environment variables are clear.
# Ref(Serverspec). https://github.com/mizzy/specinfra/blob/master/lib/specinfra/backend/exec.rb#L128
# And, GEM_PATH is clear when path option is passed to bundle command.
# Ref(Bundler). https://github.com/bundler/bundler/blob/master/lib/bundler/cli/check.rb#L11
# Ref(TravisCI). https://docs.travis-ci.com/user/caching/#Determining-the-bundle-path
#
# We may set GEM_PATH to Specinfra settings as follows if we want to use custom RubyGems/Bundler settings.
# Ref(CustomSetting) https://github.com/docker-library/ruby/blob/4a3fdc3eed98346362a62b5d53e56f7f4e4e6d63/2.3/alpine/Dockerfile
if os[:family] == 'darwin' then
  set :env, :GEM_PATH => ENV['BUNDLE_PATH'] if ENV['BUNDLE_PATH']
end

describe package('ruby'), :if => os[:family] == 'darwin' do
  it { should be_installed.by('homebrew') }
end

describe package('ruby'), :if => ['debian', 'alpine'].include?(os[:family]) do
  it { should be_installed }
end

describe package('ruby') do
  its(:version) { should >= '2.0' }
end

describe command('which ruby') do
  its(:exit_status) { should eq 0 }
end

describe command('which gem') do
  its(:exit_status) { should eq 0 }
end

describe package('bundler') do
  it { should be_installed.by('gem') }
end

describe command('which bundle') do
  its(:exit_status) { should eq 0 }
end
