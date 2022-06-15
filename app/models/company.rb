class Company < ActiveRecord::Base
	has_many :freebies
	has_many :devs, through: :freebies


	# Forgot how to test this method(what arguments to pass in test)
	def give_freebie(dev, item_name, value)
		self.freebies.create(devs: dev.id, item_name: item_name, value: value, company_id: id)
	end

	def self.oldest_company
		self.pluck(:founding_year).sort.last
	end

end
