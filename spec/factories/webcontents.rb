# == Schema Information
#
# Table name: webcontents
#
#  id             :integer          not null, primary key
#  url            :string
#  content        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  status_code    :string
#  status_message :string
#  headers        :string
#  total_time     :string
#

FactoryGirl.define do
  factory :webcontent do
    url Faker::Internet.url('example.com', '/foobar.html')
    content Faker::Internet.slug('foo bar')
  end
end
