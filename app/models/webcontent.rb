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

class Webcontent < ApplicationRecord
  validates :url, presence: true
end
