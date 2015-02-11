require 'spec_helper'

describe "Creating model forms" do
    it "Filling the model form successfull"do
        visit "/"
        click_link "Be a model (TFP)"
        expect(page).to have_content("Would You like to try?")
        
        
        fill_in "* Name", with: "Mandy"
        fill_in "* Email", with: "mandy@gmail.com"
        fill_in "* Message", with: "Hello!"
        click_button "Send request"
        
        expect(page).to have_content("Back to LIGHTHOUSING")
        expect(ModelOrder.count).to eq(1)
    end
    
    
    it "Displays an error when there is no name" do
        expect(ModelOrder.count).to eq(0)
        
        visit "/"
        click_link "Be a model (TFP)"
        expect(page).to have_content("Would You like to try?")
        
        
        fill_in "* Name", with: ""
        fill_in "* Email", with: "mandy@gmail.com"
        fill_in "* Message", with: "Hello!"
        click_button "Send request"
        
        expect(page).to have_content("Please review the problems below:")
        expect(ModelOrder.count).to eq(0)
    end  
end