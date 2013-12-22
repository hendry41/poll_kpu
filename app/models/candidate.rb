class Candidate < ActiveRecord::Base
	has_and_belongs_to_many :round_elections, :join_table => :candidates_round_elections

	accepts_nested_attributes_for :round_elections

	validates :election_year, :sequence_number, :name_kp, :name_wkp, :image, presence: true

	mount_uploader :image, ImageUploader
end
