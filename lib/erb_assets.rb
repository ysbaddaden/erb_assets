require "erb_assets/version"
require "tilt/erb"

class Tilt::ERBTemplate
  class LookupContext < ActionView::LookupContext
    def initialize(context, path)
      super path
      @view_context = context
    end

    def find_template(*args)
      super.tap { |r| @view_context.depend_on(r.identifier) }
    end
  end

  module ViewContext
    attr_accessor :output_buffer, :_view_renderer, :_lookup_context

    def view_renderer
      @_view_renderer ||= ActionView::Renderer.new(lookup_context)
    end

    def lookup_context
      @_lookup_context ||= LookupContext.new(self, environment.paths.to_a)
    end

    def self.included(klass)
      klass.instance_eval do
        include Rails.application.routes.url_helpers
        include Rails.application.routes.mounted_helpers
        include Rails.application.helpers
        include ActionView::Helpers
      end
    end

    def protect_against_forgery?
      false
    end
  end

  def evaluate(scope, locals, &block)
    super view_context(scope), locals, &block
  end

  protected

    def view_context(scope)
      @view_context ||= scope.tap do |s|
        s.singleton_class.instance_eval { include ViewContext }
      end
    end
end
