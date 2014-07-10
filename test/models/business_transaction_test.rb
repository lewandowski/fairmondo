#
#
# == License:
# Fairnopoly - Fairnopoly is an open-source online marketplace.
# Copyright (C) 2013 Fairnopoly eG
#
# This file is part of Fairnopoly.
#
# Fairnopoly is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# Fairnopoly is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with Fairnopoly.  If not, see <http://www.gnu.org/licenses/>.
#
require_relative '../test_helper'

class BusinessTransactionTest < ActiveSupport::TestCase
  subject { BusinessTransaction.new }
  let(:business_transaction) { FactoryGirl.create :business_transaction }
  describe "attributes" do
    it { subject.must_respond_to :selected_transport }
    it { subject.must_respond_to :selected_payment }
    it { subject.must_respond_to :id }
    it { subject.must_respond_to :created_at }
    it { subject.must_respond_to :updated_at }
    it { subject.must_respond_to :buyer_id }
    it { subject.must_respond_to :article_id }
    it { subject.must_respond_to :state }

    it { subject.must_respond_to :sold_at }
    it { subject.must_respond_to :purchase_emails_sent }
    it { subject.must_respond_to :discount_id }
    it { subject.must_respond_to :discount_value_cents }
    it { subject.must_respond_to :billed_for_fair }
    it { subject.must_respond_to :billed_for_fee }
    it { subject.must_respond_to :billed_for_discount }
  end

  describe "associations" do
    it { subject.must belong_to :article }
    it { subject.must belong_to :buyer  }
    it { subject.must belong_to :seller }
    it { subject.must belong_to :line_item_group }
  end

  describe "enumerization" do # I asked for clarification on how to do this: https://github.com/brainspec/enumerize/issues/136 - maybe comment back in when we have a positive response.
    should enumerize(:selected_transport).in(:pickup, :type1, :type2)
    should enumerize(:selected_payment).in(:bank_transfer, :cash, :paypal, :cash_on_delivery, :invoice)
  end

  describe "methods" do

  end
end


