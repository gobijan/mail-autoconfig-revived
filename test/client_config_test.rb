require "minitest/autorun"
require "mail_autoconfig"

class ClientConfigTest < Minitest::Test
  def setup
    @client_config = MailAutoconfig::ClientConfig.from_file(File.expand_path(File.join(__FILE__, "../", "examples", "client_config_yahoo.xml")))
  end

  def test_reads_service_name
    assert_equal "Yahoo! Mail", @client_config.name
  end

  def test_reads_short_name
    assert_equal "Yahoo", @client_config.short_name
  end

  def test_reads_provider_id
    assert_equal "yahoo.com", @client_config.provider_id
  end

  def test_reads_domain_aliases
    assert_includes @client_config.domains, "yahoo.com"
    assert_includes @client_config.domains, "yahoo.co.uk"
  end

  def test_matches_valid_domains
    assert @client_config.valid_for_domain?("yahoo.it")
  end

  def test_does_not_match_invalid_domains
    refute @client_config.valid_for_domain?("googlemail.com")
  end

  def test_auto_detects_domains_from_local_files
    assert_kind_of MailAutoconfig::ClientConfig, MailAutoconfig::ClientConfig.search_local_files("googlemail.com")
  end

  def test_auto_detects_domains_from_local_files_with_alias
    assert_kind_of MailAutoconfig::ClientConfig, MailAutoconfig::ClientConfig.search_local_files("gmail.com")
  end

  def test_auto_detects_domains_from_autoconfig_domain
    assert_kind_of MailAutoconfig::ClientConfig, MailAutoconfig::ClientConfig.search_autoconfig_domain("swcp.com")
  end
end
