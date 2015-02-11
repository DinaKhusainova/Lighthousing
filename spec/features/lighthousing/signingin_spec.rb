require 'spec_helper'


#Zkontroluji, jestli se uspesne prihlasuje a zobrazuje se spravna objednavka

describe "Signing in"do
    before do
        Admin.create(email:"admin1@gmail.com", password: "heslo123")
    end
    
    it "Signing in as an admin successfully"do
        visit "/admins/sign_in"
        expect(page).to have_content("Log in")
        
        fill_in "Email", with: "admin1@gmail.com"
        fill_in "Password", with: "heslo123"
        check "Remember me"
        click_button "Log in"
        expect(page).to have_text("Log out")
    
        visit "/"
        click_link "Be a model (TFP)"
    
        
        fill_in "* Name", with: "Mandy"
        fill_in "* Email", with: "mandy@gmail.com"
        fill_in "* Message", with: "Hello!"
        click_button "Send request"
        
        click_link "Admin"
        within "table"do
            expect("Mandy")
        end
    end
end 
