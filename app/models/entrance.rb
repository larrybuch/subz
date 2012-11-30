# == Schema Information
#
# Table name: entrances
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  lat        :float
#  long       :float
#  line       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entrance < ActiveRecord::Base
  def self.text_search(query)
   self.where("name @@ :q or line @@ :q", :q => query)
  end
end