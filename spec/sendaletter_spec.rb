describe 'send a letter', type: :feature do
  before :each do
    visit '/'
    click_link 'Login'
    page.fill_in 'email', with: 'QATest1432011378@email.com'
    page.fill_in 'password', with: 'thisismypassword'
    click_button 'Log In'
    visit '/r/shop/letters'

    within('#send_a_letter_description') do
      click_button 'Send Letter Now'
    end
  end

  it 'creates an inmate' do
    inmate_first_name = 'QATestFirst'+Time.now.to_i.to_s
    inmate_last_name = 'QATestLast'+Time.now.to_i.to_s

    click_button 'New Inmate'
    page.fill_in 'inmate[inmate_first_name]', with: inmate_first_name
    page.fill_in 'inmate[inmate_last_name]', with: inmate_last_name
    select 'Male', :from =>'gender'
    page.fill_in 'inmate[inmate_dob]', with: '1-1-1950'
    page.fill_in 'inmate[inmate_information]', with: 'personal information'
    page.fill_in 'inmate[inmate_interests]', with: 'qa testing'
    typeahead_select '#inmate_prison', with: 'Alameda CA City Jail', index: 0
    page.fill_in 'inmate[inmate_number]', with: '11111'
    page.fill_in 'inmate[inmate_date_committed]', with: '5-15-2015'
    page.fill_in 'inmate[inmate_date_released]', with: '5-15-2016'
    click_button 'Save Inmate Record'

    click_link 'Find an Inmate'
    page.fill_in 'first', with: inmate_first_name
    page.fill_in 'last', with: inmate_last_name
    page.fill_in 'number', with: '11111'
    click_button 'Search'

    expect(page).to have_content("#{inmate_last_name}, #{inmate_first_name} #11111")
  end

  it 'find existing inmate and saves letter' do
    page.fill_in 'inmate_search', with: 'Aaliyah Lawton - Delaware County PA George W. Hill Correctional Facility'
    typeahead_select '#inmate_search', with: 'Aaliyah Lawton', index: 0
    click_button 'Select Inmate'
    page.fill_in 'letter[letter_content]', with: 'Aaliyah, Hi. Sincerely, QA'
    click_button 'Save'
    page.visit page.current_path

    expect(page.find('#letter_letter_content')).to have_content('Aaliyah, Hi. Sincerely, QA')
  end
end
