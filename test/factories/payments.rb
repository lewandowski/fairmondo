#   Copyright (c) 2012-2015, Fairmondo eG.  This file is
#   licensed under the GNU Affero General Public License version 3 or later.
#   See the COPYRIGHT file for details.

FactoryGirl.define do
  factory :payment, aliases: [:paypal_payment], class: 'PaypalPayment' do
    line_item_group { FactoryGirl.create :line_item_group, :sold, :with_business_transactions,
                                         traits: [:paypal, :transport_type1] }

    trait :with_pay_key do
      pay_key 'foobar'
    end

    factory :voucher_payment, class: 'VoucherPayment' do
      line_item_group do
        FactoryGirl.create :line_item_group, :sold, :with_business_transactions,
                           traits: [:voucher, :transport_type1],
                           seller: FactoryGirl.create(:legal_entity_that_can_sell,
                                                      :with_paypal_account, uses_vouchers: true)
      end

      sequence(:pay_key) { |n| "20abc#{n}" }
    end
  end
end
