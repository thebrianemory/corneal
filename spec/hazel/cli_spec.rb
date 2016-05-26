require 'fakefs'
require_relative "../spec_helper"
require_relative "../../lib/hazel/cli"

describe Hazel::VERSION do
  subject { Hazel::CLI }

  describe "source_root" do
    it "should return with a full path" do
      pwd           = File.dirname(__FILE__)
      template_path = pwd.sub 'spec/hazel', 'lib/templates'
      subject.source_root.must_equal template_path
    end
  end
end
