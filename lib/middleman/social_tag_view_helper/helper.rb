module Middleman
  module SocialTagViewHelper
    module Helper
      def current_url
        current_path.sub(/index\.html/, "")
      end

      def top_page?
        current_path == ''
      end

      def open_graph_meta_tag(page_type: "website", page_title: nil, page_image: nil, _site_url: nil, _site_title: nil, _site_description: nil)
        _site_url ||= site_url
        _site_title ||= site_title
        _site_description ||= site_description
        unless top_page?
          page_type = "article"
          _site_url += "/#{current_url}"
        end
        %Q|<meta property="og:type" content="#{page_type}">
<meta property="og:url" content="#{_site_url}">
<meta property="og:title" content="#{page_title}">
<meta property="og:image" content="#{page_image}">
<meta property="og:site_name" content="#{_site_title}">
<meta property="og:description" content="#{_site_description}">|
      end

      def hatena_bookmark_button(_site_url = nil, _site_title = nil)
        _site_url ||= site_url
        _site_url += "/#{current_url}" unless top_page?
        _site_title ||= site_title
        %Q|<a href="http://b.hatena.ne.jp/entry/#{_site_url.sub(/^http[s]?:\/\//, '')}" class="hatena-bookmark-button" data-hatena-bookmark-title="#{_site_title}" data-hatena-bookmark-layout="standard-balloon" data-hatena-bookmark-lang="ja" title="このエントリーをはてなブックマークに追加">
          <img src="https://b.st-hatena.com/images/entry-button/button-only@2x.png" alt="このエントリーをはてなブックマークに追加" width="20" height="20" style="border: none;" />
        </a>
        <script type="text/javascript" src="https://b.st-hatena.com/js/bookmark_button.js" charset="utf-8" async="async"></script>|
      end
      
      def facebook_app_id_meta_tag(_facebook_app_id = nil)
        _facebook_app_id ||= facebook_app_id
        %Q|<meta property="fb:app_id" content="#{_facebook_app_id}" />|
      end

      def facebook_sdk(_facebook_app_id = nil)
        @facebook_sdk_already_use = true
        _facebook_app_id ||= facebook_app_id
        %Q|<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : #{_facebook_app_id},
      xfbml      : true,
      version    : 'v2.5'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>|
      end

      def facebook_share_button(_facebook_app_id: nil)
        output = ""
        output = facebook_sdk(_facebook_app_id) unless @facebook_sdk_already_use

        _site_url = site_url
        _site_url += "/#{current_url}" unless top_page?
        output += %Q|<div
  class="fb-share-button"
  data-href="#{site_url}"
  data-layout="button_count">
</div>|
        output
      end
      
      def twitter_share_button(_twitter_user_name = nil)
        _twitter_user_name ||= twitter_user_name if twitter_user_name
        account = if _twitter_user_name
                    " data-via=\"#{_twitter_user_name}\""
                  else
                    nil
                  end
        %Q*<a href="https://twitter.com/share" class="twitter-share-button"{count}#{account}>Tweet</a> <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>*
      end

      def facebook_comment(_facebook_app_id: nil, _comment_count: nil)
        output = ""
        output = facebook_sdk(_facebook_app_id) unless @facebook_sdk_already_use

        _site_url = site_url
        _site_url += "/#{current_url}" unless top_page?
        _comment_count ||= facebook_comment_count if self.try(:facebook_comment_count)
        _comment_count ||= 5
        %Q|<div class="fb-comments" data-href="#{_site_url}" data-numposts="#{_comment_count}"></div>|
      end
    end
  end
end
