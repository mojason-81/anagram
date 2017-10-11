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

  it 'responds with a redirect on a post to /' do
    post("/", { word: 'cat' })
    expect(last_response.redirect?).to be(true)
  end

  it 'does not include combinations which are not words following a get request to /anagrams/:word' do
    get("/anagrams/cat")
    expect(last_response.body).not_to include("cta", "atc", "tca", "tac")
  end

  it 'does include anagrams which are words following a get request to /anagrams/:word' do
    get("/anagrams/cat")
    expect(last_response.body).to include("act")
  end

  it 'should display an error if input does not exist' do
    post("/", { word: 'hoobidiha' })
    expect(last_response.body).to include("<p class='error'>")
  end

  it 'valid_input throws an exception when input cannot be found in db' do
    expect { valid_input?("hoobidiha") }.to raise_error(Exception)
  end

  it 'has letters of a word in alphabetical order' do
    word = Word.find_by_text("cat")
    expect(word.letters == "act").to be(true)
  end
end
