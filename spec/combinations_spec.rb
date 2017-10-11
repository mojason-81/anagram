require 'spec_helper'

describe 'Our Anagrams App' do
  include SpecHelper

  before(:all) do
    Word.create(text: 'cat')
    Word.create(text: 'act')
  end

  after(:all) do
    Word.find_by_text('cat').destroy
    Word.find_by_text('act').destroy
  end


  it 'responds with a redirect on a post to /anagrams/:word' do
    post("/", { word: 'cat' })
    expect(last_response.redirect?).to be(true)
  end

  it 'displays combinations for a word on a get to /anagrams/:word' do
    get("/anagrams/cat")
    expect(last_response.body).to include("cat", "act")
  end
end
