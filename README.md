# Render your Rails views into the Assets Pipeline

This gem adds support for rendering the classic ERB templates of your Rails
project into the assets pipeline, so they can be consumed as JST templates or to
feed Angular's $templateCache.

This is merely a rip-off [haml_assets](https://rubygems.org/gems/haml_assets) by
Les Hill ( @leshill ) and Wes Gibbs ( @wgibbs ). Kudos goes to them!

## Installing

Add this to your `Gemfile`

```ruby
gem 'erb_assets', github: 'ysbaddaden/erb_assets'
```

## Writing your JavaScript templates

### Templates

ERB templates may be anywhere Rails can find assets. You may even add app/views
(or a subfolder):

```ruby
# config/initializers/assets.rb
Rails.application.config.assets.paths << Rails.root.join("app/views").to_s
```

### Helpers

All the `ActionView`, routes and application helpers are available in your
template, so you can render your usual views as usual. In fact any ERB template
in the assets pipeline should now have access to helpers. For example:

```javascript
// app/assets/javascripts/application.js.erb
var posts_path = <%= raw posts_path.to_json =%>;
```

### Partials

You can render partials within your views. Because this is hacked in, you can
nest your partials as normal, but they must have a recognized format such as
`html`. For example:

    shared/_timestamps.html.haml

A partial will become a part of whatever template you are rendering, so make
sure that you are generating the correct markup. For example, do not include an
embedded coffeescript partial inside an embedded javascript template.

## Authors

Initial HAML version:
* Les Hill  : @leshill
* Wes Gibbs : @wgibbs

Hack for ERB:
* Julien Portalier : @ysbaddaden

## Contributors

* Eugene Pimenov    (@libc)      : Rendering partials
* Raphael Randschau (@nicolai86) : Render partials
