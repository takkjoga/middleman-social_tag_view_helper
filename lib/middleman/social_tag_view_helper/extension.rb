require 'middleman/social_tag_view_helper/helper'

module Middleman
  module SocialTagViewHelper
    class Extension < Middleman::Extension
      def initialize(app, options_hash = {}, &block)
        super

        app.helpers Middleman::SocialTagViewHelper::Helper
      end
    end
  end
end
