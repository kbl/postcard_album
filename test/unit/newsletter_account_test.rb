require 'test_helper'

class NewsletterAccountTest < ActiveSupport::TestCase

  test "new account should be inactive" do
    account = Factory.build(:newsletter_account)
    assert account.is_active? == false
  end

  test "account should have valid email address" do
    account = Factory.build(:newsletter_account, :email => 'test@email.pl')
    assert account.valid?
  end

end
