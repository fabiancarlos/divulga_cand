Given /^there is (\d+) candidates$/ do |arg1|

  @candidate = []

  arg1.to_i.times do |s|
    @candidate << Candidate.make!
  end
end

Given /^I'm on the home page$/ do
  visit root_path
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end
