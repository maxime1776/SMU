namespace :hello_sign do
 desc "List all Hello Sign templates"
 task list_templates: :environment do
   HelloSign.get_templates.each do |template|
     puts "# #{template.template_id} - #{template.title}"
     puts "## Signer roles"
     template.signer_roles.each do |signer_role|
       puts "- #{signer_role.name}"
     end
     puts "## Documents"
     template.documents.each do |document|
       puts "### #{document.name}"
       document.custom_fields.each do |field|
         puts "- #{field.api_id}: #{field.name}"
       end
     end
   end
 end
end
