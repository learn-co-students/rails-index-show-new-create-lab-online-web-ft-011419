class CouponsController < ApplicationController

  def index 
   # binding.pry
    @coupons = Coupon.all
  end
  def show
    @coupon = Coupon.find(params[:id]) 
  end

  def new

  end

  def create
   
    var=Coupon.create(coupon_code: params[:coupon][:coupon_code] ,store: params[:coupon][:store]  )
 redirect_to coupon_path(var)
  end
end
