# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Route.create(route: 'Traditional')
Route.create(route: 'Agile')
Route.create(route: 'Hibryd')

QuestionRelation.create(question_relation: 'Team')
QuestionRelation.create(question_relation: 'Process')
QuestionRelation.create(question_relation: 'Projetct')

traditional = Route.where(route: 'Traditional').first
agile = Route.where(route: 'Agile').first

team = QuestionRelation.where(question_relation: 'Team').first
process = QuestionRelation.where(question_relation: 'Process').first
project = QuestionRelation.where(question_relation: 'Project').first

# Each block initialize on the db the question and the practices
# related to that question as shown below
#------------------------------------------
# 1-
# Populating the question
question1 = Question.create(
  question_text: 'Will your development team change on the development process?',
  route: traditional,
  question_relation: team
)

# Populating the Practices
practiceTraditional1 = Practice.create(
  practice_name: 'Traditional requirements',
  practice_description: 'Use of problem, needs, features, functional requirements and use cases',
  route: traditional,
  question: question1
)

practiceAgile1 = Practice.create(
  practice_name: 'Agile requirements',
  practice_description: 'Use of investment theme, epics, features and user story',
  route: agile,
  question: question1
)

# Making the relation of each pratice
practiceTraditional1.equivalent = practiceAgile1
practiceAgile1.equivalent = practiceTraditional1
#-------------------------------------------

#------------------------------------------
# 2-
# Populating the question
question = Question.create(
  question_text: 'Will your client be present during the whole process and will he help to make the requirements?',
  route: agile,
  question_relation: team
)

# Populating the Practices
practiceTraditional = Practice.create(
  practice_name: 'nome da pratica tradicional',
  practice_description: 'Developtment team write down all the requirements on the begining of the project',
  route: traditional,
  question: question
)

practiceAgile = Practice.create(
  practice_name: 'nome da pratica agil',
  practice_description: 'Client writes down the requirements as the project progresses',
  route: agile,
  question: question
)

# Making the relation of each pratice
practiceTraditional.equivalent = practiceAgile
practiceAgile.equivalent = practiceTraditional
#-------------------------------------------

#------------------------------------------
# 3-
# Populating the question
question = Question.create(
  question_text: 'The development team is knit?',
  route: agile,
  question_relation: team
)

# Populating the Practices
practiceTraditional = Practice.create(
  practice_name: 'nome da pratica tradicional',
  practice_description: 'Team can`t modify the process',
  route: traditional,
  question: question
)

practiceAgile = Practice.create(
  practice_name: 'nome da pratica agil',
  practice_description: 'Team can modify process by testing and daily meetings',
  route: agile,
  question: question
)

# Making the relation of each pratice
practiceTraditional.equivalent = practiceAgile
practiceAgile.equivalent = practiceTraditional

# Populating the Practices
practiceTraditional = Practice.create(
  practice_name: 'nome da pratica tradicional',
  practice_description: 'Manager assining tasks',
  route: traditional,
  question: question
)

practiceAgile = Practice.create(
  practice_name: 'nome da pratica agil',
  practice_description: 'Team choosing what task to do, as long they are in the spring scope',
  route: agile,
  question: question
)

practiceTraditional.equivalent = practiceAgile
practiceAgile.equivalent = practiceTraditional
#-------------------------------------------

#------------------------------------------
# 4-
# Populating the question
question = Question.create(
  question_text: 'Does your team quickly responds to changes?',
  route: agile,
  question_relation: team
)

# Populating the Practices
practiceTraditional = Practice.create(
  practice_name: 'nome da pratica tradicional',
  practice_description: 'Requirements stablishied by contract',
  route: traditional,
  question: question
)

practiceAgile = Practice.create(
  practice_name: 'nome da pratica agil',
  practice_description: 'Client is able to change requirements more often',
  route: agile,
  question: question
)

# Making the relation of each pratice
practiceTraditional.equivalent = practiceAgile
practiceAgile.equivalent = practiceTraditional
#-------------------------------------------

#------------------------------------------
# 5-
# Populating the question
question = Question.create(
  question_text: 'Does your team have experience?',
  route: agile,
  question_relation: team
)

practiceAgile = Practice.create(
  practice_name: 'nome da pratica agil',
  practice_description: 'Pair programing',
  route: agile,
  question: question
)

#------------------------------------------- 

#------------------------------------------
# 6-
# Populating the question
question = Question.create(
  question_text: 'Does your client requires lots of documentation?',
  route: traditional,
  question_relation: team
)

# Populating the Practices
practiceTraditional = Practice.create(
  practice_name: 'nome da pratica tradicional',
  practice_description: 'Documentation above code',
  route: traditional,
  question: question
)

practiceAgile = Practice.create(
  practice_name: 'nome da pratica agil',
  practice_description: 'Code above documentation',
  route: agile,
  question: question
)

# Making the relation of each pratice
practiceTraditional.equivalent = practiceAgile
practiceAgile.equivalent = practiceTraditional
#-------------------------------------------

#------------------------------------------
# 7-
# Populating the question
question = Question.create(
  question_text: 'Does your client requires continuous software delivery?',
  route: agile,
  question_relation: team
)

# Populating the Practices
practiceTraditional = Practice.create(
  practice_name: 'nome da pratica tradicional',
  practice_description: 'Long iterations with lots of things to delivery',
  route: traditional,
  question: question
)

practiceAgile = Practice.create(
  practice_name: 'nome da pratica agil',
  practice_description: 'One to four week sprints, with value delivery to the Client',
  route: agile,
  question: question
)

# Making the relation of each pratice
practiceTraditional.equivalent = practiceAgile
practiceAgile.equivalent = practiceTraditional
#-------------------------------------------

#------------------------------------------
# 8-
# Populating the question
question = Question.create(
  question_text: 'Is your project a critcal project?',
  route: traditional,
  question_relation: team
)

# Populating the Practices
practiceTraditional = Practice.create(
  practice_name: 'nome da pratica tradicional',
  practice_description: 'Formal methods',
  route: traditional,
  question: question
)

#-------------------------------------------

#------------------------------------------
# 9-
# Populating the question
question = Question.create(
  question_text: 'Will the requirements of the project change often?',
  route: agile,
  question_relation: team
)

# Populating the Practices
practiceTraditional = Practice.create(
  practice_name: 'nome da pratica tradicional',
  practice_description: 'Detailing the requirements all in the begining of the project',
  route: traditional,
  question: question
)

practiceAgile = Practice.create(
  practice_name: 'nome da pratica agil',
  practice_description: 'Only detail requirements before implementation',
  route: agile,
  question: question
)

# Making the relation of each pratice
practiceTraditional.equivalent = practiceAgile
practiceAgile.equivalent = practiceTraditional
#-------------------------------------------