class ReviewsController < ApplicationController
  def show
    @deck = Deck.find(params[deck_id])
    @cards = @deck.cards
  end
end
