class Student < Person
    has_many :responses, dependent: :destroy
end
