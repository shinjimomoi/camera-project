module ApplicationHelper
    def render_stars(rating)
        filled_stars = '★' * rating
        empty_stars = '☆' * (5 - rating)
        filled_stars + empty_stars
    end
end
