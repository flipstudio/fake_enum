require "fake_enum/version"

module FakeEnum
  def to_s enum
		self.constants[self.to_a.index(enum)].to_s
	end

	def to_sym enum
		self.constants[self.to_a.index(enum)].to_s.underscore.to_sym
	end

	def localize enum
		I18n.t(to_sym(enum), :scope => localization_scope)
	end

	def to_a
		self.constants.map { |c| self.const_get c }
	end

	def to_localized_hash
		Hash[self.to_a.map { |r| [localize(r), r.to_s] }]
	end

	def to_localized_a
		to_a.map { |r| localize r }
	end

	def from_s string
		self.const_get string
	end

	private
		def localization_scope
			[:activerecord, :fake_enums, self.name.underscore.to_sym]
		end
end
