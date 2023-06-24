module ApplicationHelper
    def render_stars(rating)
        return '' unless rating.present?
        filled_stars = '★' * rating
        empty_stars = '☆' * (5 - rating)
        filled_stars + empty_stars
    end
end
