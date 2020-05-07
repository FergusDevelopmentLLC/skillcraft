Course.create("name"=>"English 101", "code"=>1111)
Course.create("name"=>"Math 101", "code"=>2222)
Course.create("name"=>"Science 101", "code"=>3333)
Course.create("name"=>"Art 101", "code"=>4444)

Person.create("type"=>"Teacher","user_name"=>"LarryTeacher", "password"=>"password", "first_name"=>"Larry", "last_name"=>"Teacher", "email"=>"larry@email.com")
Person.create("type"=>"Teacher","user_name"=>"MoeTeacher", "password"=>"password", "first_name"=>"Moe", "last_name"=>"Teacher", "email"=>"moe@email.com")
Person.create("type"=>"Teacher","user_name"=>"CurleyTeacher", "password"=>"password", "first_name"=>"Curley", "last_name"=>"Teacher", "email"=>"curley@email.com")

Person.create("type"=>"Student","user_name"=>"JimmyStudent", "password"=>"password", "first_name"=>"Jimmy", "last_name"=>"Student", "email"=>"jimmy@email.com")
Person.create("type"=>"Student","user_name"=>"BillyStudent", "password"=>"password", "first_name"=>"Billy", "last_name"=>"Student", "email"=>"billy@email.com")
Person.create("type"=>"Student","user_name"=>"KeatonStudent", "password"=>"password", "first_name"=>"Keaton", "last_name"=>"Student", "email"=>"keaton@email.com")

#Teachers
CoursePerson.create("person_id"=>1,"course_id"=>1)
CoursePerson.create("person_id"=>2,"course_id"=>2)
CoursePerson.create("person_id"=>3,"course_id"=>3)

#Students
CoursePerson.create("person_id"=>4,"course_id"=>1)
CoursePerson.create("person_id"=>5,"course_id"=>1)
CoursePerson.create("person_id"=>6,"course_id"=>1)

CoursePerson.create("person_id"=>4,"course_id"=>2)
CoursePerson.create("person_id"=>5,"course_id"=>2)
CoursePerson.create("person_id"=>6,"course_id"=>2)

CoursePerson.create("person_id"=>4,"course_id"=>3)
CoursePerson.create("person_id"=>5,"course_id"=>3)

Announcement.create("course_id"=>1, "person_id"=>1, "title"=>"First Announcement", "start_date"=>"Mon, 27 Apr 2020", "end_date"=>"Mon, 27 Apr 2020", "posted_date"=>"Mon, 27 Apr 2020", "due_date"=>"Mon, 27 Apr 2020", "graded"=>"true", "points"=>"100", "instructions"=>"Do it")
Announcement.create("course_id"=>2, "person_id"=>1, "title"=>"Second Announcement", "start_date"=>"Mon, 27 Apr 2020", "end_date"=>"Mon, 27 Apr 2020", "posted_date"=>"Mon, 27 Apr 2020", "due_date"=>"Mon, 27 Apr 2020", "graded"=>"true", "points"=>"100", "instructions"=>"Do it")
Assignment.create("course_id"=>3, "person_id"=>1, "title"=>"First Assignment", "start_date"=>"Mon, 27 Apr 2020", "end_date"=>"Mon, 27 Apr 2020", "posted_date"=>"Mon, 27 Apr 2020", "due_date"=>"Mon, 27 Apr 2020", "graded"=>"true", "points"=>"100", "instructions"=>"Do it")
Assignment.create("course_id"=>4, "person_id"=>1, "title"=>"Second Assignment", "start_date"=>"Mon, 27 Apr 2020", "end_date"=>"Mon, 27 Apr 2020", "posted_date"=>"Mon, 27 Apr 2020", "due_date"=>"Mon, 27 Apr 2020", "graded"=>"true", "points"=>"100", "instructions"=>"Do it")
Response.create("interaction_id"=>1, "person_id"=>4, "content"=>"bla, bla, bla", "score"=>92, "letter_grade"=>"A")
Response.create("interaction_id"=>1, "person_id"=>5, "content"=>"bla, bla, bla", "score"=>92, "letter_grade"=>"A")