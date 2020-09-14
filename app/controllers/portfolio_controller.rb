class PortfolioController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  def index
      @portfolios = Portfolio.all
      render json: @portfolios
  end

  def show
      render json: @portfolio
  end

  def new
  end

  def create
      @portfolio = Portfolio.new(portfolio_params)

      if @portfolio.save
          render json: @portfolio, status: :created, location: @portfolio
      else
          render json: @portfolio.errors, status: :unprocessable_entity
      end
  end

  def edit
  end

  def update
      @portfolio.update(portfolio_params)
      render json: @portfolio
  end

  def destroy
      @portfolio = portfolio.destroy
      render json: @portfolio
  end

  private 

  def set_portfolio
      @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
      params.require(:portfolio).permit(:photoshoot_id)
  end
end
