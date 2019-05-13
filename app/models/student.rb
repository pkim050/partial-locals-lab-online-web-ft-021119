# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(name)
    unless name == nil || name.empty?
      students = Student.all.order(:name).select {|student| student if student.name.downcase.include?(name.downcase)}
    else
      Student.all
    end
  end
end
