class WelcomeController < ApplicationController
  require 'open-uri'
  require 'json'

  def index
  end

  def about
  end

  def play
    # b = open('https://api.binance.com/api/v3/ticker/price?symbol=LTCBTC')


    # CURRENT PRICE
    # b = open('https://api.binance.com/api/v1/klines?symbol=LTCBTC&interval=1m')

    # b = open('https://api.binance.com/api/v1/klines?symbol=LTCBTC&interval=1m&startTime=1520371400')

    # WE CAN MAKE EACH COIN HAVE AN ARRAY CONTAINING THE NAME OF THE COIN, 1 MINUTE CHANGE, 3 MINUTE CHANE, 5 MINUTE CHANGE, 10 MINUTE CHANGE, 15 MINUTE CHANGE

    coins = ['ADA', 'ADX', 'AE', 'AION', 'AMB', 'APPC', 'ARK', 'ARN', 'AST', 'BAT', 'BCC', 'BCD', 'BCPT', 'BLZ', 'BNB', 'BNT', 'BQX', 'BRD', 'BTG', 'BTS', 'CDT', 'CHAT', 'CMT', 'CND', 'CTR', 'DASH', 'DGD', 'DLT', 'DNT', 'EDO', 'ELF', 'ENG', 'ENJ', 'EOS', 'ETC', 'ETH', 'EVX', 'FUEL', 'FUN', 'GAS', 'GTO', 'GVT', 'GXS', 'HSR', 'ICN', 'ICX', 'INS', 'IOST', 'IOTA', 'KMD', 'KNC', 'LEND', 'LINK', 'LRC', 'LSK', 'LTC', 'LUN', 'MANA', 'MCO', 'MDA', 'MOD', 'MTH', 'MTL', 'NANO', 'NAV', 'NCASH', 'NEBL', 'NEO', 'NULS', 'OAX', 'OMG', 'OST', 'PIVX', 'POA', 'POE', 'POWR', 'PPT', 'QSP', 'QTUM', 'RCN', 'RDN', 'REQ', 'RLC', 'RPX', 'SALT', 'SNGLS', 'SNM', 'STEEM', 'STORJ', 'STRAT', 'SUB', 'TNB', 'TNT', 'TRIG', 'TRX', 'VEN', 'VIA', 'VIB', 'VIBE', 'WABI', 'WAVES', 'WINGS', 'WTC', 'XLM', 'XMR', 'XRP', 'XVG', 'XZC', 'YOYO', 'ZEC', 'ZIL', 'ZRX']
    # THIS GETS THE CLOSE OF THE MOST RECENT CANDLE w <%= @res.last[4] %>
    @fifteens = []
    @fives = []
    @tens = []
    @twos = []
    @thirties = []
    @hours = []

    coins.each do |coin|
      b = open('https://api.binance.com/api/v1/klines?symbol=' + coin + 'BTC&interval=1m&limit=60')
      data = b.read
      @res = JSON.parse(data)

      @fifteen_diff = ((@res.last[4].to_f / @res[45][4].to_f) - 1) * 100
      @five_diff = ((@res.last[4].to_f / @res[55][4].to_f) - 1) * 100
      @two_diff = ((@res.last[4].to_f / @res[58][4].to_f) - 1) * 100
      @ten_diff = ((@res.last[4].to_f / @res[50][4].to_f) - 1) * 100
      @thirty_diff = ((@res.last[4].to_f / @res[30][4].to_f) - 1) * 100
      @hour_diff = ((@res.last[4].to_f / @res.first[4].to_f) - 1) * 100


      @new_array1 = {name: coin, fifteen: @fifteen_diff}
      @new_array3 = {name: coin, five: @five_diff}
      @new_array4 = {name: coin, two: @two_diff}
      @new_array5 = {name: coin, ten: @ten_diff}
      @new_array6 = {name: coin, thirty: @thirty_diff}
      @new_array7 = {name: coin, hour: @hour_diff}

      @fifteens.push(@new_array1)
      @fives.push(@new_array3)
      @twos.push(@new_array4)
      @tens.push(@new_array5)
      @thirties.push(@new_array6)
      @hours.push(@new_array7)


      @close = @res
    end

     @fifteens.sort_by!{|e| -e[:fifteen]}
     @fives.sort_by!{|e| -e[:five]}
     @twos.sort_by!{|e| -e[:two]}
     @tens.sort_by!{|e| -e[:ten]}
     @thirties.sort_by!{|e| -e[:thirty]}
     @hours.sort_by!{|e| -e[:hour]}

  end
end
