require 'fakefs'
require_relative "../spec_helper"
require_relative "../../lib/corneal/cli"

describe Corneal::VERSION do
  subject { Corneal::CLI }

  describe "source_root" do
    it "should return with a full path" do
      pwd           = File.dirname(__FILE__)
      template_path = pwd.sub 'spec/corneal', 'lib/templates'
      subject.source_root.must_equal template_path
    end
  end
end
