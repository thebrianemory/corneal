require_relative "../spec_helper"
require_relative "../../lib/corneal/version"

describe Corneal::VERSION do
  subject { Corneal::VERSION }

  let(:major)  { subject::MAJOR  }
  let(:minor)  { subject::MINOR  }
  let(:tiny)   { subject::TINY   }
  let(:string) { subject::STRING }

  it "should have a major version" do
    major.must_be_kind_of Fixnum
  end

  it "should have a minor version" do
    minor.must_be_kind_of Fixnum
  end

  it "should have a tiny version" do
    tiny.must_be_kind_of Fixnum
  end

  it "should have a string representation of the version number" do
    string.must_equal "#{major}.#{minor}.#{tiny}"
  end
end
