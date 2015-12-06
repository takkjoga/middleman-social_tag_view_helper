require 'middleman-core'
require 'middleman/social_tag_view_helper/version'
require 'middleman/social_tag_view_helper/extension'

::Middleman::Extensions.register(:social_tag_view_helper, ::Middleman::SocialTagViewHelper::Extension)
