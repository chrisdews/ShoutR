class Hate < ApplicationRecord
  belongs_to :hateable, polymorphic: true
end
