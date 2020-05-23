class Daycare < ActiveRecord::Base

    has_many :enrollments
    has_many :children, through: :enrollments

end