# == Schema Information
#
# Table name: webcontents
#
#  id         :integer          not null, primary key
#  url        :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Webcontent, type: :model do
  subject { described_class.new(url: Faker::Internet.url) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a url' do
    subject.url = nil
    expect(subject).to_not be_valid
  end
end
