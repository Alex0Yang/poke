require 'poke'
require 'game'

describe "Game" do
  # 黑桃 spade, 红桃 heard, 梅花 club, 方块 diamond
  it "return 0 if Royal Flush" do
    royal_flush = [["spade", "A"], ["spade","K"], ["spade", "Q"], ["spade", "J"], ["spade", "10"]]
    royal_flash_cards = convert_to_cards(royal_flush)
    expect(game(royal_flash_cards)).to eq 0
  end

  it "return 1 if Straight Flush" do
    straight_flush = [["club", "Q"], ["club","J"], ["club", "10"], ["club", "9"], ["club", "8"]]
    straight_flash_cards = convert_to_cards(straight_flush)
    expect(game(straight_flash_cards)).to eq 1
  end

  it "return 2 if Four of a Kind" do
    cards_array = [["heard", "A"], ["club","A"], ["diamond", "A"], ["club", "A"], ["spade", "10"]]
    cards = convert_to_cards(cards_array)
    expect(game(cards)).to eq 2
  end

  it "return 3 if Full House" do
    cards_array = [["diamond", "10"], ["spade","10"], ["heard", "10"], ["club", "7"], ["spade", "7"]]
    cards = convert_to_cards(cards_array)
    expect(game(cards)).to eq 3
  end

  it "return 4 if Flush" do
    cards_array = [["heard", "A"], ["heard","Q"], ["heard", "8"], ["heard", "7"], ["heard", "5"]]
    cards = convert_to_cards(cards_array)
    expect(game(cards)).to eq 4
  end

  it "return 5 if Straight" do
    cards_array = [["spade", "J"], ["heard","10"], ["diamond", "9"], ["heard", "8"], ["club", "7"]]
    cards = convert_to_cards(cards_array)
    expect(game(cards)).to eq 5
  end

  it "return 6 if Three of a Kind" do
    cards_array = [["diamond", "7"], ["heard","7"], ["club", "7"], ["diamond", "A"], ["club", "J"]]
    cards = convert_to_cards(cards_array)
    expect(game(cards)).to eq 6
  end

  it "return 7 if Two Pairs" do
    cards_array = [["diamond", "10"], ["spade","10"], ["heard", "A"], ["club", "A"], ["diamond", "J"]]
    cards = convert_to_cards(cards_array)
    expect(game(cards)).to eq 7
  end

  it "return 8 if One Pair" do
    cards_array = [["club", "K"], ["heard","K"], ["heard", "J"], ["heard", "10"], ["diamond", "5"]]
    cards = convert_to_cards(cards_array)
    expect(game(cards)).to eq 8
  end

  it "return 9 if Single" do
    cards_array = [["diamond", "A"], ["heard","Q"], ["spade", "10"], ["spade", "8"], ["heard", "5"]]
    cards = convert_to_cards(cards_array)
    expect(game(cards)).to eq 9
  end
end

def convert_to_cards(cards_array)
  cards_object = []
  cards_array.each do |card|
    cards_object << Poke.new(card.first, card.last)
  end
  cards_object
end
