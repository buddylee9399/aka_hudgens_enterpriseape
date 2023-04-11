# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  manager    :string
#  name       :string
#  status     :string
#  terms      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Company.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << column_names

      all.each do |company|
        csv << company.attributes.values_at(*column_names)
      end
    end
  end    
end
