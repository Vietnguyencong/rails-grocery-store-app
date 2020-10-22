class Store < ApplicationRecord
    has_many :departments
    has_many :reviews
    def count_reviews
        points = 0
        total_re = self.reviews.count
        self.reviews.all.each do |r|
            case r.note
            when  'awsome'
                points += 6
            when 'very good', 'awsome'
                points += 5
            when 'good'
                points += 4.5
            when 'alright'
                points += 3.5
            when 'whatever'
                points += 2.5
            when 'bad'
                points += 1
            when 'very bad'
                points += 0
            else
                points += 0
            end

        end
        return (points/total_re).round(2)
    end
end
