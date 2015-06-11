module TypeaheadSelect
  def typeahead_select(selector, with:nil, index:0)
    page.execute_script <<-EOF
      window.$('#{selector}').focus().typeahead('val', '#{with}').focus();
    EOF

    # find selector's parent, then find any typeahead suggestions and click the
    # first one
    find(selector).find(:xpath, './/..').find('.tt-menu')
      .find('.tt-suggestion').click
  end
end
