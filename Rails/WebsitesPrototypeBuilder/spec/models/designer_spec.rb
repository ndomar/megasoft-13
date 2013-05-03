require 'spec_helper'

describe Designer do

  before(:each) do

    
    @attr = {
      :fullname => "Test Designer",
      :email => "designer@gmail.com",
      :password => "pass1234",
      :password_confirmation => "pass1234",
      :phone_number => "01004509771",
      :country => "Egypt",
      :day_dob => 15,
      :month_dob => 10,
      :year_dob => 1990
    }
  end

  it "should create a new instance given a valid attribute" do
    Designer.create!(@attr)
  end

  it "should require an email address" do
    no_email_designer = Designer.new(@attr.merge(:email => ""))
    no_email_designer.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[designer@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_designer = Designer.new(@attr.merge(:email => address))
      valid_email_designer.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[designer@foo,com designer_at_foo.org example.designer@foo.]
    addresses.each do |address|
      invalid_email_designer = Designer.new(@attr.merge(:email => address))
      invalid_email_designer.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    Designer.create!(@attr)
    designer_with_duplicate_email = Designer.new(@attr)
    designer_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    Designer.create!(@attr.merge(:email => upcased_email))
    designer_with_duplicate_email = Designer.new(@attr)
    designer_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @designer = Designer.new(@attr)
    end

    it "should have a password attribute" do
      @designer.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @designer.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      Designer.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      Designer.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      Designer.new(hash).should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @designer = Designer.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @designer.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @designer.encrypted_password.should_not be_blank
    end

  end

end