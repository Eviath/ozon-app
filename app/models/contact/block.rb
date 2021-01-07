class Contact::Block < ApplicationRecord
  enum position: { normal: 0, alarm: 1, form: 2, loyal: 3, priv: 4 }
end
