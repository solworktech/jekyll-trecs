# frozen_string_literal: true

require 'jekyll'
require 'uri'

module Jekyll
  module Trecs
    # Implements a Liquid tag for embedding trecs.
    class TrecsTag < Liquid::Tag
      def render(_context)
        if (tag_contents = parse_tag(@markup.strip))
          url = tag_contents
          uri = URI.parse(url)
          id = uri.path.split('/').last
          server_url = uri.scheme + '://' + uri.host
          render_tag(id, server_url)
        else
          raise ArgumentError, <<-ERR_MSG.gsub(/^ {12}/, '')
            Syntax error in tag 'trecs' while parsing the following markup:

              #{@markup}

            Valid syntax:
              {% trecs https://trecs.run/watch/id %}
          ERR_MSG
        end
      end

      private

      def parse_tag(input)
        matched = input.match(/\s*?(https?:\/\/[\S]+)?\s*/)
        return matched[1].strip if matched.length >= 2
      end

      def render_tag(id, server_url)

%(<div style="max-width:900px; height:520px; margin:24px auto;">
  <!-- Add the bare attribute `autoplay` to start playback on load (with
       audio it starts muted and points at the unmute button). -->
  <trecs-player
    recording-id="#{id}"
    api-base="#{server_url}">
  </trecs-player>
</div>
<script src="#{server_url}/trecs-player.js"></script>

)
      end
    end
  end
end

Liquid::Template.register_tag('trecs', Jekyll::Trecs::TrecsTag)
