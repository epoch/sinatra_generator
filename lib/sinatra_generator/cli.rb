require 'thor'

module SinatraGenerator
  class CLI < Thor

    # register(class_name, subcommand_alias, usage_list_string, description_string)

    register SinatraGenerator::Generator, "new", "new [APP_NAME]", "Generate a basic hello world app", options
    tasks["new"].options = SinatraGenerator::Generator.class_options

  end
end