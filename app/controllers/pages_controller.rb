class PagesController < ApplicationController
  def search # this is the worst. N + 1 query. Ask about on Monday.
    redirect_to :root if params[:query].empty?

    search_terms = params[:query].split(/ |,/).reject{ |el| el.empty? }

    @deviations = []

    search_terms.each do |term|
      @deviations += PgSearch.multisearch(term).map do |result|
        r = result.searchable
        r.class == Tag ? r.taggable : r
      end
    end

    @deviations.uniq!
    @deviations.sort! { |a, b| b.created_at <=> a.created_at }
  end
end
