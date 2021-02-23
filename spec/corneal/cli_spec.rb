require_relative "../../lib/corneal"

describe Corneal::VERSION do
  subject { Corneal::Generators::AppGenerator }

  describe "source_root" do
    let(:pwd) { File.dirname(__FILE__) }
    let(:template_path) do
      pwd.sub "spec/corneal", "lib/corneal/generators/app/templates"
    end

    it "should return with a full path" do
      expect(subject.source_root).to eq template_path
    end
  end
end
