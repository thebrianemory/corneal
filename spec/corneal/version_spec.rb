require_relative "../spec_helper"
require_relative "../../lib/corneal/version"

describe Corneal::VERSION do
  subject { Corneal::VERSION }

  let(:major)  { subject::MAJOR  }
  let(:minor)  { subject::MINOR  }
  let(:tiny)   { subject::TINY   }
  let(:string) { subject::STRING }

  it "should have a major version" do
    expect(major).to be_a_kind_of Fixnum
  end

  it "should have a minor version" do
    expect(minor).to be_a_kind_of Fixnum
  end

  it "should have a tiny version" do
    expect(tiny).to be_a_kind_of Fixnum
  end

  it "should have a string representation of the version number" do
    expect(string).to eq "#{major}.#{minor}.#{tiny}"
  end
end
