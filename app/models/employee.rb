# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  job_type   :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Employee < ApplicationRecord
  has_many :invoices  
end
