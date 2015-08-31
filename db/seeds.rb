# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Survey.create(name: "Simple Survey")

Question.create(question: "What is your gender?"
    input_type: "radio"
    survey_id: 1)

Question.create(question: "What is your relationship status?"
    input_type: "radio"
    survey_id: 1)

Question.create(question: "What countries did you visit in??"
    input_type: "check"
    survey_id: 1)

Question.create(question: "What is your favorite sport?"
    input_type: "radio"
    survey_id: 1)

Question.create(question: "Which programming languages do you know?"
    input_type: "check"
    survey_id: 1)

Answer.create(option: "Male"
    question_id: 1
    survey_id: 1)

Answer.create(option: "Female"
    question_id: 1
    survey_id: 1)

Answer.create(option: "Married"
    question_id: 2
    survey_id: 1)

Answer.create(option: "Single"
    question_id: 2
    survey_id: 1)

Answer.create(option: "Divorced"
    question_id: 2
    survey_id: 1)

Answer.create(option: "Widowed"
    question_id: 2
    survey_id: 1)

Answer.create(option: "Separated"
    question_id: 2
    survey_id: 1)

Answer.create(option: "In a Relationship"
    question_id: 2
    survey_id: 1)

Answer.create(option: "Canada"
    question_id: 3
    survey_id: 1)

Answer.create(option: "Italy"
    question_id: 3
    survey_id: 1)

Answer.create(option: "Australia"
    question_id: 3
    survey_id: 1)

Answer.create(option: "Hong Kong"
    question_id: 3
    survey_id: 1)

Answer.create(option: "Russia"
    question_id: 3
    survey_id: 1)

Answer.create(option: "Belgium"
    question_id: 3
    survey_id: 1)

Answer.create(option: "Football"
    question_id: 4
    survey_id: 1)

Answer.create(option: "Basketball"
    question_id: 4
    survey_id: 1)

Answer.create(option: "Baseball"
    question_id: 4
    survey_id: 1)

Answer.create(option: "Hockey"
    question_id: 4
    survey_id: 1)

Answer.create(option: "None"
    question_id: 4
    survey_id: 1)

Answer.create(option: "PHP"
    question_id: 5
    survey_id: 1)

Answer.create(option: "Ruby"
    question_id: 5
    survey_id: 1)

Answer.create(option: "Python"
    question_id: 5
    survey_id: 1)

Answer.create(option: "Java Script"
    question_id: 5
    survey_id: 1)