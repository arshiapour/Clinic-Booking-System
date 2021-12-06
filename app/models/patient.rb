class Patient < ApplicationRecord
    has_one :appointment
end