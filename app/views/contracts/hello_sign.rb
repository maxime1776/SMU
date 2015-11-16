signature_request = HelloSign.send_signature_request_with_template(
  test_mode: Rails.env.production? ? 0 : 1,
  template_id: "bacc6dc036317803be3700485b86edc430392480",
  title: "title test",
  subject: "test",
  message: "test",
  # signing_redirect_url: "",     # TODO: special page on le wagon website?
  # metadata: {
  #   card_id: @card.id,
  #   trello_card_id: @card.trello_card_id,
  # },
  signers: [
    {
      email_address: "max@max.com",
      name: "max",
      role: "CEO"
    }
  ],
  # :ccs => [
  #   {
  #     :email_address =>'accounting@example.com',
  #     :role => "Accounting"
  #   }
  # ],
  custom_fields: {  # run `rake hello_sign:list_templates` to get those
    info_partner_1: @partners.first_name, @partners.last_name, ", né(e) à" @partners.birth_location, ", le" @partners.birth_date, ", demeurant" @partners.address, ", de nationalité " @partners.nationality, ".",
    info_investor: @contract.investors.first.first_name, @contract.investors.first.last_name, ", né(e) à" @contract.investors.first.birthplace, ", le" @contract.investors.first.birthdate, ", demeurant" @contract.investors.first.address, ", de nationalité " @contract.investors.first.nationality, ".",
    info_company: @contract.company_name,
    starts_at_one: starts_at,
    ends_at_one: ends_at,
    starts_at_two: starts_at,
    ends_at_two: ends_at,
    price_number_excluding_vat: price_number_excluding_vat,
    price_number_vat: price_number_vat,
    price_number_total: price_number_total,
    price_letters_total: I18n.with_locale(@card.board.locale) { price_number_total.to_words },
    deposit_number_total: deposit_number_total
  }
)
