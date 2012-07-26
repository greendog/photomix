class SecretLinkObserver < ActiveRecord::Observer
  observe :collection, :album, :photo

  def before_create(record)
    record.url = ::SecureRandom.hex(16)
  end
end
