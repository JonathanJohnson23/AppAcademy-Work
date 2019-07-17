class Enrollment < ApplicationRecord

    has_many :course,
        class_name: "Course",
        primary_key: :course_id,
        foreign_key: :id

    has_many :user,
        class_name: "User",
        primary_key: :student_id,
        foreign_key: :id


    # belongs_to :courses
    #     class_name: "Course",
    #     primary_key: :id,
    #     foreign_key: :student_id

    # belongs_to :users,
    #     class_name: "User",
    #     primary_key: :id,
    #     foreign_key: :student_id


end


