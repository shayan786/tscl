class Document < ApplicationRecord
	has_one_attached :pdf

	def doc_type_enum
		[
			['Constitution', 'constitution'],
			['By Laws', 'by_laws'], 
			['35 Overs Playing Conditions', '35_playing_conditions'],
			['T20 Playing Conditions', '20_playing_conditions'],
			['Laws of Cricket', 'laws_of_cricket'],
			['Meeting Minutes', 'meeting_minute'],
			['COC Violation', 'coc_violation']
		]
	end
end
