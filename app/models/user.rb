class User < ActiveRecord::Base
  attr_accessible :app_key, :app_secret, :status

  validates_presence_of :app_key
  validates_uniqueness_of :app_key

  after_create :init_app_key_and_secret

  private

  def init_app_key_and_secret
    self.update_column(:app_key, ItunesApp::Tool.encrypt_id(self.id) + self.app_key)
    self.update_column(:app_secret, ItunesApp::Tool.generate_key)
  end

end
