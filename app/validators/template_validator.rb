require "nokogiri"

class TemplateValidator < ActiveModel::Validator
  @@template_rng = File.expand_path("../../../config/schemas/tdl.rng",  __FILE__)

  def validate(record)
    rng = Nokogiri::XML::RelaxNG(File.read(@@template_rng))
    xml = Nokogiri::XML(record.xml) { |config| config.strict }

    rng.validate(xml).each do |error|
      record.errors.add :xml, error.message
    end
    
  end

end