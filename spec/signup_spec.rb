describe "Signup", :type => :feature do
  it "creates an account" do
    screen = 'QATest'+Time.now.to_i.to_s

    visit '/'
    click_link 'Signup'
    page.fill_in 'first', with: 'QA'
    page.fill_in 'last', with: 'Test'
    page.fill_in 'email', with: screen+'@email.com'
    page.fill_in 'screen', with: screen
    page.fill_in 'password', with: 'thisismypassword'
    page.fill_in 'confirm', with: 'thisismypassword'
    page.fill_in 'code', with: ENV['CAPTCHA_BYPASS']
    click_button 'Register Now!'
    expect(current_path).to eq('/members')
  end
end
