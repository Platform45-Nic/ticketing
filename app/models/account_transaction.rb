class AccountTransaction < ApplicationRecord
  belongs_to :account

  validates_presence_of :note
  # validates :note_only_options

  # def note_only_options
  #   if note.present? && note == "initialization"
  #     errors.add(:note, "Must be one of the following: initialization, ticket purchase or market selling")
  #   elsif note.present? && note == "ticket purchase"
  #     errors.add(:note, "Must be one of the following: initialization, ticket purchase or market selling")
  #   elsif note.present? && note == "market selling"
  #     errors.add(:note, "Must be one of the following: initialization, ticket purchase or market selling")
  #   end
  # end

end
