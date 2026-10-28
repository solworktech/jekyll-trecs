# Jekyll::Trecs
[![.github/workflows/gem-build.yml][badge-build]][build]
[![Gem Version][badge-gem]][rubygems]
[![Gem][badge-dl]][rubygems]
[![License][badge-license]][license]

Provides a [Liquid][liquid] tag for embedding [trecs](https://trecs.run) in [Jekyll][jekyll] sites.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-trecs'
```

And then execute:

```sh
$ bundle
```

Or install it yourself with:

```
$ gem install jekyll-trecs
```

## Usage

Use the tag as follows in your Jekyll pages and posts:

```ruby
{% trecs https://trecs.run/watch/id %}
```

This will render the below code:
```js 
<div style="max-width:900px; height:520px; margin:24px auto;">
  <!-- Add the bare attribute `autoplay` to start playback on load (with
       audio it starts muted and points at the unmute button). -->
  <trecs-player
    recording-id="#{id}"
    api-base="#{server_url}">
  </trecs-player>
</div>
<script src="#{server_url}/trecs-player.js"></script>
```


## Development

After cloning the repo, run `bin/setup` to install dependencies.
Then, run `bin/console` for an interactive prompt that will allow you
to experiment.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release` to create a git
tag for the version, push git commits and tags, and push the `.gem`
file to [rubygems.org](https://rubygems.org).

## Contributing

Contributions are, of course, welcome. Please submit a pull request.

## License

Code is under [AGPLv3 License][license].


[badge-build]: https://github.com/solworktech/jekyll-trecs/actions/workflows/gem-build.yml/badge.svg
[build]: https://github.com/solworktech/jekyll-trecs/actions/workflows/gem-build.yml
[badge-coveralls]: https://coveralls.io/repos/solworktech/jekyll-trecs/badge.svg
[badge-gem]: https://badge.fury.io/rb/jekyll-trecs.svg
[badge-license]: https://img.shields.io/github/license/solworktech/jekyll-trecs.svg?maxAge=604800
[badge-dl]: https://img.shields.io/gem/dt/jekyll-trecs.svg
[rubygems]: https://rubygems.org/gems/jekyll-trecs
[liquid]: http://liquidmarkup.org "Liquid templating language"
[jekyll]: http://jekyllrb.com "Jekyll"
[license]: ./LICENSE
