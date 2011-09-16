# Intermediate model to maintain a many to many relationship between folders and
# keys.
class KeyedFolder < ActiveRecord::Base
  belongs_to :access_key
  belongs_to :folder
end
