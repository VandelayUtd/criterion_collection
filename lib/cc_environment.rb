# frozen_string_literal: true

require_relative "./criterion_collection/version"
require_relative "./criterion_collection/cli"
require_relative "./criterion_collection/director"
require_relative "./criterion_collection/scraper"
require_relative "./criterion_collection/movie"

require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'
require 'colorized_string'


module CriterionCollection
  class Error < StandardError; end
  # Your code goes here...
end
