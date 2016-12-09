require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

if ENV['TARGET_HOST'].include?('container') then
  command_base = "su -l -s /bin/bash -c '%s' #{ENV['ANYENV_OWNER']}"
else
  command_base = "/bin/bash -lc '%s'"
end


describe command(command_base % 'rbenv versions') do
  its(:stdout) { should contain('2.3.2') }
  its(:stdout) { should contain('2.3.3') }
end

describe command(command_base % 'rbenv global') do
  its(:stdout) { should_not contain('2.3.2') }
  its(:stdout) { should contain('2.3.3') }
end

describe command(command_base % 'ruby --version') do
  its(:stdout) { should_not contain('2.3.2') }
  its(:stdout) { should contain('2.3.3') }
end

# Check whether variables of 'FGtatsuro.anyenv' affects the behavior of this role properly.
describe file("#{ENV['ANYENV_HOME']}/.anyenv/envs/rbenv/bin/rbenv") do
  it { should exist }
end
