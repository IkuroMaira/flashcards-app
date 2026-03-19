class ReviewsController < ApplicationController
  def show
    @deck = Deck.find(params[deck_id])
    @cards = @deck.cards
    # position = params[position]
    @card = @deck.cards.where(card_id: position)
    @position =
  end
end
