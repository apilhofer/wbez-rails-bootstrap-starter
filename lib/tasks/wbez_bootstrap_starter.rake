namespace :wbez do
  desc "Run WBEZ Bootstrap starter upgrade scripts (e.g. v1->v2)"
  task :upgrade, [:from, :to] => :environment do |_t, args|
    require "yaml"
    require "shellwords"

    from = (args[:from] || "v1").to_s
    to = (args[:to] || "v2").to_s

    marker_path = Rails.root.join("config", "wbez_bootstrap_starter.yml")
    unless marker_path.exist?
      abort(
        "Missing config/wbez_bootstrap_starter.yml. " \
        "Re-run the template install, or run the upgrade directly via: " \
        "bin/rails app:template LOCATION=<raw template/upgrades/v1_to_v2.rb URL>"
      )
    end

    marker = YAML.load_file(marker_path) || {}
    source_base_url = marker["source_base_url"].to_s
    if source_base_url.empty?
      abort(
        "config/wbez_bootstrap_starter.yml did not include source_base_url. " \
        "Run the upgrade directly via: " \
        "bin/rails app:template LOCATION=<raw template/upgrades/v1_to_v2.rb URL>"
      )
    end

    upgrade_script =
      case [from, to]
      when ["v1", "v2"]
        "template/upgrades/v1_to_v2.rb"
      else
        abort("Unsupported upgrade path #{from.inspect} -> #{to.inspect}.")
      end

    upgrade_location = "#{source_base_url}/#{upgrade_script}"
    puts "Running WBEZ Bootstrap upgrade: #{from} -> #{to}"
    puts "LOCATION: #{upgrade_location}"

    cmd = ["bin/rails", "app:template", "LOCATION=#{upgrade_location}"].map(&:to_s).join(" ")
    cmd = cmd.gsub("LOCATION=", "LOCATION=") # no-op; keeps the string explicit

    success = system(cmd)
    abort("Upgrade failed.") unless success
  end
end

