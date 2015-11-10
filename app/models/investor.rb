class Investor < ActiveRecord::Base
  belongs_to :contract
end




#   validates :user, presence: true
#   validates :annonce, presence: true
#   validates :start_at, presence: true
#   validates :finish_at, presence: true


#   validates :user_id, presence: true

#   geocoded_by :adresse
#   after_validation :geocode, if: :adresse_changed?
# t.string   "first_name"
# t.string   "last_name"
# t.string   "nationality"
# t.string   "address"
# t.integer  "amount_raised"
# t.datetime "created_at",    null: false
# t.datetime "updated_at",    null: false









