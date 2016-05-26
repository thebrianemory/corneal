require_relative "spec_helper"
require_relative "../lib/extensions/string.rb"

describe String do
  it "should ignore an already camel cased string" do
    "MyApp".camel_case.must_equal "MyApp"
  end

  it "should capitalize an all lower case string" do
    "myapp".camel_case.must_equal "Myapp"
  end

  it "should camel case a lower case string with underscores" do
    "my_app".camel_case.must_equal "MyApp"
  end

  it "should camel case a lower case string with hyphens" do
    "my-app".camel_case.must_equal "MyApp"
  end

  it "should camel case an uppercase string with underscores" do
    "MY_APP".camel_case.must_equal "MyApp"
  end

  it "should camel case an uppercase string with hyphens" do
    "MY-APP".camel_case.must_equal "MyApp"
  end

  it "should camel case a string with a hyphen preceding a capital letter" do
    "my_App".camel_case.must_equal "MyApp"
  end

  it "should underscore a camel cased string" do
    "MyApp".file_name.must_equal "my_app"
  end

  it "should underscore a hypenated string" do
    "my-app".file_name.must_equal "my_app"
  end

  it "should ignore an already underscored string" do
    "my_app".file_name.must_equal "my_app"
  end

  it "should_underscore_a_string_with_a_hyphen_preceding_a_capital_letter" do
    "my_App".file_name.must_equal "my_app"
  end

  it "should allow dashes in directory names, but not in filenames" do
    "my-App".directory_name.must_equal "my-app"
    "my-App".file_name.must_equal "my_app"
  end
end
