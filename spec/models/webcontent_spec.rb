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
  pending "add some examples to (or delete) #{__FILE__}"
end
