require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('the riddle path', {:type => :feature}) do
  it ('processes the answer and shows fail page for wrong answer') do
    visit('/question1')
    fill_in('question1', :with => 0)
    click_button('Submit')
    expect(page).to have_content('You did not answer the questions correctly')
  end
end

describe('the riddle path', {:type => :feature}) do
  it ('processes the answer and shows question 2 for right answer') do
    visit('/question1')
    fill_in('question1', :with => 3)
    click_button('Submit')
    expect(page).to have_content('Congrats, you passed! Here is your next riddle')
  end
end

describe('the riddle path', {:type => :feature}) do
  it ('processes the answer and shows fail page for wrong answer') do
    visit('/question2')
    fill_in('question2', :with => "the cinema")
    click_button('Submit')
    save_and_open_page
    expect(page).to have_content('You did not answer the questions correctly')
  end
end

# describe('the riddle path', {:type => :feature}) do
#   it ('processes the answer and shows fail page for wrong answer') do
#     visit('/question2')
#     fill_in('question2', :with => "ice cream")
#     click_button('Submit')
#     save_and_open_page
#     expect(page).to have_content('Congrats, you passed! Here is your next riddle')
#   end
# end
#
# describe('the riddle path', {:type => :feature}) do
#   it ('processes the answer and shows fail page for wrong answer') do
#     visit('/question3')
#     fill_in('question3', :with => "man")
#     click_button('Submit')
#     save_and_open_page
#     expect(page).to have_content('Congrats, you passed! Here is your next riddle')
#   end
# end
