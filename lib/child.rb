class Child < ActiveRecord::Base

    has_many :enrollments
    has_many :daycares, through: :enrollments
end