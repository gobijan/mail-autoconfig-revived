require "minitest/autorun"
require "mail_autoconfig"

class ServerTest < Minitest::Test
  def setup
    @client_config = MailAutoconfig::ClientConfig.from_file(File.expand_path(File.join(__FILE__, "../", "examples", "client_config_yahoo.xml")))
    @client_config.email_address = MailAutoconfig::EmailAddress.new("example@gmail.com")
  end

  def test_incoming_server
    server = @client_config.incoming_servers.first
    assert_kind_of MailAutoconfig::IncomingServer, server
  end

  def test_incoming_server_is_pop3
    server = @client_config.incoming_servers.first
    assert_equal "pop3", server.protocol
  end

  def test_incoming_server_has_hostname
    server = @client_config.incoming_servers.first
    assert_equal "pop.mail.yahoo.com", server.hostname
  end

  def test_incoming_server_has_port
    server = @client_config.incoming_servers.first
    assert_equal 995, server.port
  end

  def test_incoming_server_has_socket_type
    server = @client_config.incoming_servers.first
    assert_equal "SSL", server.socket_type
  end

  def test_incoming_server_has_username_format
    server = @client_config.incoming_servers.first
    assert_equal "%EMAILADDRESS%", server.username_format
  end

  def test_incoming_server_processes_username
    server = @client_config.incoming_servers.first
    assert_equal "example@gmail.com", server.username
  end

  def test_incoming_server_has_authentication_method
    server = @client_config.incoming_servers.first
    assert_equal "password-cleartext", server.authentication
  end

  def test_outgoing_server
    server = @client_config.outgoing_servers.first
    assert_kind_of MailAutoconfig::OutgoingServer, server
  end

  def test_outgoing_server_is_smtp
    server = @client_config.outgoing_servers.first
    assert_equal "smtp", server.protocol
  end

  def test_outgoing_server_has_hostname
    server = @client_config.outgoing_servers.first
    assert_equal "smtp.mail.yahoo.com", server.hostname
  end

  def test_outgoing_server_has_port
    server = @client_config.outgoing_servers.first
    assert_equal 465, server.port
  end

  def test_outgoing_server_has_socket_type
    server = @client_config.outgoing_servers.first
    assert_equal "SSL", server.socket_type
  end

  def test_outgoing_server_has_username_format
    server = @client_config.outgoing_servers.first
    assert_equal "%EMAILADDRESS%", server.username_format
  end

  def test_outgoing_server_processes_username
    server = @client_config.outgoing_servers.first
    assert_equal "example@gmail.com", server.username
  end

  def test_outgoing_server_has_authentication_method
    server = @client_config.outgoing_servers.first
    assert_equal "password-cleartext", server.authentication
  end
end
