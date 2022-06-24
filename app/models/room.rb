class Room < ApplicationRecord
    validates :type, :occupancy, :beds, presence: true

    belongs_to :hotel,
        foreign_key: :building_id,
        class_name: :Hotel,
        primary_key: :id

end