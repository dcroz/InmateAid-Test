describe "Signup", :type => :feature do
  it "creates an account" do
    screen = 'QATest'+Time.now.to_i.to_s

    visit '/'
    click_link 'Login'
    page.fill_in 'email', with: 'QATest1432011378@email.com'
    page.fill_in 'password', with: 'thisismypassword'
    click_button 'Log In'
    visit '/r/shop/letters'
    within('#send_a_letter_description') do
      click_button 'Send Letter Now'
    end
    click_button 'New Inmate'
    page.fill_in 'inmate[inmate_first_name]', with: 'QA'
    page.fill_in 'inmate[inmate_last_name]', with: 'Test'
    select 'Male', :from =>'gender'
    page.fill_in 'inmate[inmate_dob]', with: '1-1-1950'
    page.fill_in 'inmate[inmate_information]', with: 'personal information'
    page.fill_in 'inmate[inmate_interests]', with: 'qa testing'
    page.fill_in 'inmate[prison]', with: 'Alameda CA City Jail - CA'
    page.fill_in 'inmate[inmate_number]', with: '11111'
    page.fill_in 'inmate[inmate_date_committed]', with: '5-15-2015'
    page.fill_in 'inmate[inmate_date_released]', with: '5-15-2016'
    click_button 'Save Inmate Record'

    # BOOM
  end
end
