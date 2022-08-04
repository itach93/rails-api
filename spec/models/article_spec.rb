require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'tests that the factory is valid' do
    expect(build(:article)).to be_valid
  end

  it 'validates the presence of the title' do
    article = build :article, title: ''
    expect(article).not_to be_valid
    expect(article.errors.messages[:title]).to include("cant't be blank")
  end

  it 'validates the presence of the content' do
    article = build :article, content: ''
    expect(article).not_to be_valid
    expect(article.errors.messages[:content]).to include("cant't be blank")
  end

  it 'validates the presence of the slug' do
    article = build :article, slug: ''
    expect(article).not_to be_valid
    expect(article.errors.messages[:slug]).to include("cant't be blank")
  end

  it 'validates uniqueness of the slug' do
    article = create :article
    invalid_article = build :article, slug: article.slug
    expect(invalid_article).not_to be_valid
  end
end
