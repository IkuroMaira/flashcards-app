class DecksController < ApplicationController
  def index
    @decks = Deck.includes(:cards)
  end

  def show
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
  end
end
