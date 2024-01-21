Rails.application.config.generators do |g|
  g.test_framework :rspec
  g.stylesheets false
  g.javascripts false
  g.helper false
  g.channel assets: false
  g.fixtures true
  g.view_specs false
  g.routing_specs false
  g.controller_specs false
  g.request_specs true
  g.helper_specs false
end
