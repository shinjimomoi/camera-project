module ApplicationHelper
    def render_stars(rating)
        return '' unless rating.present?
        filled_stars = '★' * rating
        empty_stars = '☆' * (5 - rating)
        filled_stars + empty_stars

        # return '' unless rating.present?

        # filled_stars = content_tag(:span, '', class: 'fas fa-star') * rating
        # empty_stars = content_tag(:span, '', class: 'far fa-star') * (5 - rating)
        # filled_stars + empty_stars
    end
end
