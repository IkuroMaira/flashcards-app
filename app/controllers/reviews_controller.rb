class ReviewsController < ApplicationController
  def show
    @deck = Deck.find(params[:deck_id])
    @cards = @deck.cards
    position = (params[:position] || 0).to_i
    # Dans Rails, params est un hash (l'équivalent d'un objet JS), et ses clés sont des symboles.
    # Donc pour accéder à la valeur, on doit utiliser la bonne clé — `:position` et pas `position` (qui serait une variable).
    @position = position.clamp(0, @cards.count - 1)
    @card = @cards[@position]

    if params[:reveal]
      @answer = @card.answer
    end
  end
end
