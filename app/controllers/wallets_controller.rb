class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[ show edit update destroy ]

  def index
    @wallets = Wallet.all.decorate
  end

  def show
  end

  def new
    @wallet = Wallet.new
  end

  def edit
  end

  def create
    @wallet = Wallet.new(wallet_params)

    respond_to do |format|
      if @wallet.save
        Wallets::UpdateBalanceJob.perform_later address: @wallet.address
        Wallets::UpdateTransactionsJob.perform_later address: @wallet.address
        format.html { redirect_to wallet_url(@wallet), notice: "Wallet was successfully created." }
        format.json { render :show, status: :created, location: @wallet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @wallet.update(wallet_params)
        format.html { redirect_to wallet_url(@wallet), notice: "Wallet was successfully updated." }
        format.json { render :show, status: :ok, location: @wallet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallets/1 or /wallets/1.json
  def destroy
    @wallet.destroy

    respond_to do |format|
      format.html { redirect_to wallets_url, notice: "Wallet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallet
      @wallet = Wallet.find(params[:id]).decorate
    end

    # Only allow a list of trusted parameters through.
    def wallet_params
      params.require(:wallet).permit(:on_chain_properties, :address, :name)
    end
end
