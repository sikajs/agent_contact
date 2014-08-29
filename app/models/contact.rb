class Contact < ActiveRecord::Base
  belongs_to :agent

  validates :name, :presence => true
end
