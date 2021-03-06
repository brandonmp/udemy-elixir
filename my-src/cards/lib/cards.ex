defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
      end
    end

  def shuffle(deck) do
    Enum.shuffle(deck)
    end

@doc """
  Divides a deck into a hand and the remainder of the deck.

    ## Examples

      iex> deck = Cards.create_deck
      iex> { hand, deck  } = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
"""
  def deal(deck, num_cards) do
    Enum.split(deck, num_cards)
    end

    @doc """
      Determines whether a deck contains a given card

    ## Examples

      iex> deck = Cards.create_deck
      iex>  Cards.contains?(deck, "Ace of Spades")
      true
    """

  def contains?(deck, card) do
    Enum.member?(deck, card)
    end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    { status, binary } = File.read(filename)
    case status do
      { :ok, _ } ->  :erlang.binary_to_term(binary)
      { :error, _ } -> "That file don't exist."
    end

  end

  def create_hand(hand_size) do
      Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(hand_size)
  end

end
