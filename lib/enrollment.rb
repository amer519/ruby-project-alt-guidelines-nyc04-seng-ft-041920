class Enrollment < ActiveRecord::Base

    belongs_to :child
    belongs_to :daycare
end