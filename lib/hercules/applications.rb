Capistrano::Configuration.instance.load do
  location = fetch(:application_dir, "applications")

  unless exists?(:applications)
    set :applications, Dir["#{location}/*.rb"].map { |f| File.basename(f, ".rb") }
  end

  applications.each do |name|
    desc "Set the target application to `#{name}'."
    task(name) do
      load "#{location}/#{name}.rb"
    end
  end
end if Capistrano::Configuration.instance
