require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

describe package('ruby'), :if => os[:family] == 'darwin' do
  it { should be_installed.by('homebrew') }
end

describe package('ruby'), :if => os[:family] == 'debian' do
  it { should be_installed.by('apt') }
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
