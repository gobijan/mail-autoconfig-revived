require 'mail_autoconfig'

describe MailAutoconfig::EmailAddress do

  context 'example@gmail.com' do
    let(:address) { MailAutoconfig::EmailAddress.new('example@gmail.com') }

    it 'should have a gmail domain' do
      expect(address.domain).to eq('gmail.com')
    end

    it 'should have a local part' do
      expect(address.local_part).to eq('example')
    end

    it 'should have gmail MX domains' do
      expect(address.mx_records).to eq(["gmail-smtp-in.l.google.com", "alt1.gmail-smtp-in.l.google.com", "alt2.gmail-smtp-in.l.google.com", "alt3.gmail-smtp-in.l.google.com", "alt4.gmail-smtp-in.l.google.com"])
    end

    it 'should have a client config' do
      expect(address.client_config).to be_a(MailAutoconfig::ClientConfig)
    end

    it 'should have GMail as client config provider short name' do
      expect(address.client_config.short_name).to eq('GMail')
    end
  end

  context 'example@atechmedia.com' do
    let(:address) { MailAutoconfig::EmailAddress.new('example@atechmedia.com') }
    it 'should not have a detectable configuration' do
      expect(address.client_config).to be_false
    end
  end

  context 'example@swcp.com' do
    let(:address) { MailAutoconfig::EmailAddress.new('example@swcp.com') }
    it 'should have an autoconf configuration' do
      expect(address.client_config).to be_a(MailAutoconfig::ClientConfig)
    end
  end
end