class Company < ActiveRecord::Base
	has_many :freebies
	has_many :devs, through: :freebies

	def give_freebie(dev, item_name, value)
		self.freebies.create(dev_id: dev.id, item_name: item_name, value: value, company_id: id)
	end

	def self.oldest_company
		self.pluck(:founding_year).sort.last
	end

end
