class CouponsController < ApplicationController

  def index 
  end
  def show
  end

  def new

  end

  def create
   
    var=Coupon.create(coupon_code: params[:coupon][:coupon_code] ,store: params[:coupon][:store]  )
 redirect_to coupons_path(var)
  end
end
