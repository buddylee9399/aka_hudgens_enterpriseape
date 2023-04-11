# == Schema Information
#
# Table name: invoices
#
#  id          :integer          not null, primary key
#  company     :string
#  date        :datetime
#  status_type :string
#  tax         :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :integer          not null
#
# Indexes
#
#  index_invoices_on_employee_id  (employee_id)
#
# Foreign Keys
#
#  employee_id  (employee_id => employees.id)
#
class Invoice < ApplicationRecord
  belongs_to :employee
  has_many :purchases, dependent: :destroy
end
