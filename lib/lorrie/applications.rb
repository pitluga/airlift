Capistrano::Configuration.instance.load do
  location = fetch(:application_dir, "config/deploy")

  unless exists?(:applications)
    set :applications, Dir["#{location}/*.rb"].map { |f| File.basename(f, ".rb") }
  end

  applications.each do |name|
    desc "Set the target application to `#{name}'."
    task(name) do
      load "#{location}/#{application}"
    end
  end
end
