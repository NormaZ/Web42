class CreateSecurityQuestions < ActiveRecord::Migration
  def change
    create_table :security_questions do |t|
      t.string :locale, :null => false
      t.string :name, :null => false
    end

    SecurityQuestion.create! locale: :de, name: 'Wie lautet der Geburstname Ihrer Mutter?'
    SecurityQuestion.create! locale: :de, name: 'Wo sind sie geboren?'
    SecurityQuestion.create! locale: :de, name: 'Wie lautet der Name Ihres ersten Haustieres?'
    SecurityQuestion.create! locale: :de, name: 'Was ist Ihr Lieblingsfilm?'
    SecurityQuestion.create! locale: :de, name: 'Was ist Ihr Lieblingsbuch?'
    SecurityQuestion.create! locale: :de, name: 'Was ist Ihr Lieblingstier?'
    SecurityQuestion.create! locale: :de, name: 'Was ist Ihr Lieblings-Reiseland?'
    add_column :users, :security_question_id, :integer
    add_column :users, :security_question_answer, :string
  end
end
