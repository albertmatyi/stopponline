class Route < ActiveRecord::Base
  belongs_to :locations, foreign_key: 'src_location_id'
  belongs_to :locations, foreign_key: 'dst_location_id'

end
