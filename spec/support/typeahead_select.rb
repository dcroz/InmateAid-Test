module TypeaheadSelect
  def typeahead_select(selector, with:nil, index:0)
    page.execute_script <<-EOF
      window.$('#{selector}').focus().typeahead('val', '#{with}').focus();
      window.$('#{selector}').nextAll('.tt-menu').find('.tt-suggestion').eq(#{index}).click();
    EOF
  end
end
