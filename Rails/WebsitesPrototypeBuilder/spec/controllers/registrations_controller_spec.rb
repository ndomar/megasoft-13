require 'spec_helper'

describe RegistrationsController do
    before(:each)do
    @attr = {
      :fullname => "Test Designer",
      :email => "designer@gmail.com",
      :password => "pass1234",
      :password_confirmation => "pass1234",
      :phone_number => "01004509771",
      :country => "Egypt",
      :day_dob => 15,
      :month_dob => 10,
      :year_dob => 1990,
      :credit_card_number => 1234567891234567,
      :cvv2 => 123
    }
  end

  it "should update designer details without password" do
    @designer = Designer.create!(@attr)
    @designer.fullname = "another name test"
    @designer.fullname.should == "another name test"
  end

end
