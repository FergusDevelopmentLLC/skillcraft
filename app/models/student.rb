class Student < Person
    has_many :responses, dependent: :destroy
    has_many :interactions, through: :responses
end
