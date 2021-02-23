require_relative "spec_helper"
require_relative "../lib/extensions/string.rb"

describe String do
  it "returns the same camel cased string" do
    expect("MyApp".camel_case).to eq "MyApp"
  end

  it "returns the first letter capitalized" do
    expect("myapp".camel_case).to eq "Myapp"
  end

  it "returns a camel cased string when receives an string with underscores" do
    expect("my_app".camel_case).to eq "MyApp"
  end

  it "returns a camel cased string when receives an string with hyphens" do
    expect("my-app".camel_case).to eq "MyApp"
  end

  it "returns a camel cased string when receives an uppercase string with underscores" do
    expect("MY_APP".camel_case).to eq "MyApp"
  end

  it "returns a camel cased string when receives an uppercase string with hyphens" do
    expect("MY-APP".camel_case).to eq "MyApp"
  end

  it "returns a camel cased string when receives an hyphen preceding a capital letter" do
    expect("my_App".camel_case).to eq "MyApp"
  end

  it "returns an underscore string when receives a camel cased string" do
    expect("MyApp".file_name).to eq "my_app"
  end

  it "returns an underscore string when receives a hypenated string" do
    expect("my-app".file_name).to eq "my_app"
  end

  it "returns the same underscored string" do
    expect("my_app".file_name).to eq "my_app"
  end

  it "returns an underscore string when receives a hyphen preceding a capital letter" do
    expect("my_App".file_name).to eq "my_app"
  end

  it "allows dashes in directory names but not in filenames" do
    expect("my-App".directory_name).to eq "my-app"
    expect("my-App".file_name).to eq "my_app"
  end
end
