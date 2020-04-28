Classroom.create("name"=>"Main")
Classroom.create("name"=>"Gym")
Classroom.create("name"=>"Art Studio")

Course.create("name"=>"English 101", "classroom_id"=>1)
Course.create("name"=>"Math 101", "classroom_id"=>1)
Course.create("name"=>"Science 101", "classroom_id"=>1)
Course.create("name"=>"Volleyball", "classroom_id"=>2)
Course.create("name"=>"Watercolors 101", "classroom_id"=>3)

Teacher.create("user_name"=>"LarryTeacher", "password_digest"=>"xxx", "first_name"=>"Larry", "last_name"=>"Teacher", "email"=>"larry@email.com")
Teacher.create("user_name"=>"MoeTeacher", "password_digest"=>"xxx", "first_name"=>"Moe", "last_name"=>"Teacher", "email"=>"moe@email.com")
Teacher.create("user_name"=>"CurleyTeacher", "password_digest"=>"xxx", "first_name"=>"Curley", "last_name"=>"Teacher", "email"=>"curley@email.com")

Student.create("user_name"=>"JimmyStudent", "password_digest"=>"xxx", "first_name"=>"Jimmy", "last_name"=>"Teacher", "email"=>"jimmy@email.com")
Student.create("user_name"=>"BillyStudent", "password_digest"=>"xxx", "first_name"=>"Billy", "last_name"=>"Teacher", "email"=>"billy@email.com")
Student.create("user_name"=>"KeatonStudent", "password_digest"=>"xxx", "first_name"=>"Keaton", "last_name"=>"Teacher", "email"=>"keaton@email.com")

Topic.create("classroom_id"=>"1", "course_id"=>"1", "name"=>"Shakespeare")
Topic.create("classroom_id"=>"1", "course_id"=>"2", "name"=>"Fractions")
Topic.create("classroom_id"=>"1", "course_id"=>"3", "name"=>"Physics")

Announcement.create("classroom_id"=>"1", "course_id"=>"1", "person_id"=>"1", "topic_id"=>"1", "title"=>"Larry's Announcement")
Announcement.create("classroom_id"=>"1", "course_id"=>"2", "person_id"=>"1", "topic_id"=>"2", "title"=>"Practice Fractions")

Assignment.create("classroom_id"=>"1", "course_id"=>"1", "person_id"=>"1", "topic_id"=>"3", "title"=>"Turtle Report")
Assignment.create("classroom_id"=>"1", "course_id"=>"2", "person_id"=>"1", "topic_id"=>"1" "title"=>"Romeo & Juliet Report")

Post.create("classroom_id"=>"1", "course_id"=>"1", "person_id"=>"1", "topic_id"=>"3", "title"=>"Postmania")
Post.create("classroom_id"=>"1", "course_id"=>"2", "person_id"=>"1", "topic_id"=>"1" "title"=>"Do math")

Question.create("classroom_id"=>"1", "course_id"=>"1", "person_id"=>"1", "topic_id"=>"1", "title"=>"How old is Shakespeare?")
Question.create("classroom_id"=>"1", "course_id"=>"2", "person_id"=>"1", "topic_id"=>"2", "title"=>"Who is the father of physics?")

Quiz.create("classroom_id"=>"1", "course_id"=>"1", "person_id"=>"1", "topic_id"=>"1", "title"=>"Quiz 1")
Quiz.create("classroom_id"=>"1", "course_id"=>"2", "person_id"=>"1", "topic_id"=>"2", "title"=>"Quiz 2")

Test.create("classroom_id"=>"1", "course_id"=>"1", "person_id"=>"1", "topic_id"=>"1", "title"=>"Test 1")
Test.create("classroom_id"=>"1", "course_id"=>"2", "person_id"=>"1", "topic_id"=>"2", "title"=>"Test 2")