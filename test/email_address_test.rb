require "minitest/autorun"
require "mail_autoconfig"

class EmailAddressTest < Minitest::Test
  def test_gmail_domain
    address = MailAutoconfig::EmailAddress.new("example@gmail.com")
    assert_equal "gmail.com", address.domain
  end

  def test_gmail_local_part
    address = MailAutoconfig::EmailAddress.new("example@gmail.com")
    assert_equal "example", address.local_part
  end

  def test_gmail_mx_domains
    address = MailAutoconfig::EmailAddress.new("example@gmail.com")
    assert_equal "google.com", address.primary_mx_domain
  end

  def test_gmail_client_config
    address = MailAutoconfig::EmailAddress.new("example@gmail.com")
    assert_kind_of MailAutoconfig::ClientConfig, address.client_config
  end

  def test_gmail_client_config_provider_short_name
    address = MailAutoconfig::EmailAddress.new("example@gmail.com")
    assert_equal "GMail", address.client_config.short_name
  end

  def test_atechmedia_no_config
    address = MailAutoconfig::EmailAddress.new("example@atechmedia.com")
    refute address.client_config
  end

  def test_swcp_autoconf_config
    address = MailAutoconfig::EmailAddress.new("example@swcp.com")
    assert_kind_of MailAutoconfig::ClientConfig, address.client_config
  end

  def test_unlikely_domain_no_config
    address = MailAutoconfig::EmailAddress.new("example@veryunlikelydomain4567763332.com")
    refute address.client_config
  end

  def test_unlikely_domain_no_primary_mx
    address = MailAutoconfig::EmailAddress.new("example@veryunlikelydomain4567763332.com")
    assert_nil address.primary_mx_domain
  end
end
