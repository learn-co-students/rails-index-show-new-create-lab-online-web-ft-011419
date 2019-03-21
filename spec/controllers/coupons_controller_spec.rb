require 'rails_helper'

describe CouponsController do

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new coupon" do

        if RUBY_VERSION>='2.6.0'
          if Rails.version < '5'
            class ActionController::TestResponse < ActionDispatch::TestResponse
              def recycle!
                # hack to avoid MonitorMixin double-initialize error:
                @mon_mutex_owner_object_id = nil
                @mon_mutex = nil
                initialize
              end
            end
          else
            puts "Monkeypatch for ActionController::TestResponse no longer needed"
          end
        end

        expect{
          post :create, { :coupon => { :coupon_code => "ASD123", :store => "Dean and Deluca" } }
        }.to change(Coupon,:count).by(1)
        
      end
      
      it "redirects to the new coupon" do
        post :create, { :coupon => { :coupon_code => "ASD123", :store => "Dean and Deluca" } }
        expect(response).to redirect_to Coupon.last
      end
    end
  end

end