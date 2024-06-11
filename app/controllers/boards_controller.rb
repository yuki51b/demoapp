class BoardsController < ApplicationController
  def new
    @board = Board.new
  end
  
  def index
	# 日付を入手
    current_date = Date.today
	# 日付のフォーマットを調整
    formatted_date = current_date.strftime('%m月%d日')
    # ChatgptServiceでウェルカムメッセージを生成するが、タイムアウトエラーが起きたら別の処理を行う
		begin
    # プロンプトに日付を代入し、今日の誕生日の有名人を紹介させる
      @chatgpt = ChatgptService.call("簡単に挨拶してください。その際、#{formatted_date}が誕生日の有名人を簡単に紹介してください。")
	    # タイムアウトエラーが起きたときの処理。この場合は無難なAPIを使わず無難な内容にする
		rescue Net::ReadTimeout
      @chatgpt = "ようこそ！今日は#{formatted_date}です。"
    end
    @boards = Board.all.order(created_at: :desc)
    @board = Board.new 
  end

#　略
end
