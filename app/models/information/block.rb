class Information::Block < ApplicationRecord
    enum position: { articles1: 0, articles: 1, list: 2, main: 3 }
end
