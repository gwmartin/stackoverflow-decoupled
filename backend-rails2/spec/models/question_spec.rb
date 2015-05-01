require 'spec_helper'

describe Question do
  it "is valid with a title and content" do
    question = Question.new(
        title: "This is a new one",
        content: "this is my content")
    expect(question).to be_valid
  end
end
