class Provider < ActiveRecord::Base
  enum name: [ :facebook ]
  belongs_to :user
end
