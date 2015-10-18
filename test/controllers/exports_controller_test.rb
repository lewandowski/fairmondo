#   Copyright (c) 2012-2015, Fairmondo eG.  This file is
#   licensed under the GNU Affero General Public License version 3 or later.
#   See the COPYRIGHT file for details.

require_relative '../test_helper'

describe ExportsController do
  describe 'mass-upload creation' do
    before do
      @user = FactoryGirl.create :legal_entity, :with_paypal_account
      FactoryGirl.create :article, seller: @user
      FactoryGirl.create :line_item_group, :with_business_transactions, :sold, seller: @user
      sign_in @user
    end

    describe "GET 'show'" do
      it 'should be successful' do
        time = Time.now
        Time.stubs(:now).returns(time)
        get :show, kind_of_article: 'active', format: 'csv'
        response.content_type.must_equal('text/csv; charset=utf-8')
        response.headers['Content-Disposition'].must_equal("attachment; filename=\"Fairmondo_export_#{time.strftime('%Y-%d-%m %H:%M:%S')}.csv\"")
        assert_response :success
      end
    end

    #    describe "GET 'show'" do
    #      it "should be successful" do
    #        time = Time.now
    #        Time.stubs(:now).returns(time)
    #        get :show, :kind_of_article => "seller_line_item_groups", :format => "csv"
    #        response.content_type.must_equal("text/csv; charset=utf-8")
    #        response.headers["Content-Disposition"].must_equal("attachment; filename=\"Fairmondo_purchase_export_#{time.strftime("%Y-%d-%m %H:%M:%S")}.csv\"")
    #        assert_response :success
    #      end
    #    end
    #
    #    describe "GET 'show' with time range" do
    #      it "should be successful" do
    #        time = Time.now
    #        Time.stubs(:now).returns(time)
    #        get :show, :kind_of_article => "seller_line_item_groups", :format => "csv", :time_range => 3
    #        response.content_type.must_equal("text/csv; charset=utf-8")
    #        response.headers["Content-Disposition"].must_equal("attachment; filename=\"Fairmondo_purchase_export_#{time.strftime("%Y-%d-%m %H:%M:%S")}.csv\"")
    #        assert_response :success
    #      end
    #    end
  end
end
