CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:               'AWS',
      aws_access_key_id:      '',
      aws_secret_access_key:  '',
      region:                 'us-west-2'
    }
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
    config.fog_directory  = 'educacaobeleza'
    config.fog_public     = true
    config.storage        = :fog
  end
