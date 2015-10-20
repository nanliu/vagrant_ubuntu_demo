require_relative 'spec_helper'

describe package('collectd') do
  it { should be_installed.with_version('5.4.0-3ubuntu2') }
end

describe service('collectd') do
  it { should be_enabled }
  it { should be_running }
end
