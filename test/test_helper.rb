# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"

require "minitest/autorun"
require "minitest/reporters"
require "fileutils"
require "json"
require "yaml"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

ROOT = File.expand_path("..", __dir__)
$LOAD_PATH.unshift ROOT

require_relative "support/generator_app_builder"
