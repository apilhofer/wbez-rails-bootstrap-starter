# frozen_string_literal: true

require "fileutils"
require "open3"
require "securerandom"
require "shellwords"
require "active_support/core_ext/string/filters"

module GeneratorAppBuilder
  TEMPLATE_ROOT = File.expand_path("../..", __dir__)
  TEMPLATE_SCRIPT = File.join(TEMPLATE_ROOT, "template/bootstrap_template.rb")

  module_function

  def with_rails_app(name: "starter_test", keep: ENV["KEEP_TEST_APPS"] == "1")
    parent = File.join(TEMPLATE_ROOT, "tmp", "test_apps")
    FileUtils.mkdir_p(parent)
    dir = File.join(parent, "#{name}_#{Process.pid}_#{Time.now.to_i}_#{SecureRandom.hex(4)}")

    create_rails_app!(dir)
    install_template!(dir)

    yield dir
  ensure
    FileUtils.rm_rf(dir) if dir && !keep
  end

  def create_rails_app!(dir)
    run!(<<~CMD.squish, chdir: TEMPLATE_ROOT, env: clean_bundler_env)
      rails new #{Shellwords.escape(dir)}
        --skip-git
        --skip-bundle
        -d sqlite3
        --skip-solid
        --skip-kamal
        --skip-thruster
        --skip-jbuilder
        --skip-test
        --skip-system-test
        --skip-brakeman
        --skip-rubocop
    CMD

    run!("bundle install", chdir: dir, env: app_bundler_env(dir))
  end

  def install_template!(dir)
    run!(
      "bundle exec bin/rails app:template LOCATION=#{Shellwords.escape(TEMPLATE_SCRIPT)}",
      chdir: dir,
      env: app_bundler_env(dir)
    )
  end

  def run_generator!(dir, command)
    run!("bundle exec #{command}", chdir: dir, env: app_bundler_env(dir))
  end

  def read_routes(dir)
    File.read(File.join(dir, "config/routes.rb"))
  end

  def run!(command, chdir:, env: {})
    merged_env = ENV.to_h.merge(env)
    stdout, stderr, status = Open3.capture3(merged_env, command, chdir: chdir)
    return stdout if status.success?

    raise "Command failed (#{command}):\n#{stdout}\n#{stderr}"
  end

  def app_bundler_env(dir)
    clean_bundler_env.merge("BUNDLE_GEMFILE" => File.join(dir, "Gemfile"))
  end

  def clean_bundler_env
    env = ENV.to_h
    env.delete("BUNDLE_GEMFILE")
    env.delete("BUNDLE_BIN_PATH")
    env.delete("RUBYOPT")
    env
  end
end
