require 'spec_helper'

describe "Creating photoshoot forms" do
    it "Filling the photoshoot form successfull"do
        visit "/"
        click_link "Order a photoshoot"
        expect(page).to have_content("portrait photoshoot")
        
        
        fill_in "* Name", with: "Martin"
        fill_in "* Email", with: "Hrncir@gmail.com"
        fill_in "* Message", with: "I'd like to order a business photoshoot for my dog"
        click_button "Send request"
        
        expect(page).to have_content("Back to LIGHTHOUSING")
        expect(PhotoshootOrder.count).to eq(1)
    end
    
    
    it "Displays an error when there is no email" do
        expect(PhotoshootOrder.count).to eq(0)
        
        visit "/"
        click_link "Order a photoshoot"
        expect(page).to have_content("portrait photoshoot")
        
        
        fill_in "* Name", with: "Martin"
        fill_in "* Email", with: ""
        fill_in "* Message", with: "I'd like to order a business photoshoot for my dog"
        click_button "Send request"
        
        expect(page).to have_content("Please review the problems below:")
        expect(PhotoshootOrder.count).to eq(0)
    end  
end
