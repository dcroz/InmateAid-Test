describe 'search for a prison', type: :feature do
  it 'finds a prison' do
    visit '/'
    click_link 'Prison Directory'
    page.find('#jqvmap1_ca').click
    check 'check2'
    click_button 'Search'
    click_link 'California City Correctional Center (CAC) - CCA (ICE)'
    click_link 'Contact Information'

    expect(page).to have_content('760-373-3529')
  end
end
