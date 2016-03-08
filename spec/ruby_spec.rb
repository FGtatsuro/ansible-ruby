require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

describe command('which ruby') do
  its(:exit_status) { should eq 0 }
end

describe command('which gem') do
  its(:exit_status) { should eq 0 }
end

describe command('which bundle') do
  its(:exit_status) { should eq 0 }
end
