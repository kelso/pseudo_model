require 'spec_helper'

describe User do
  
  context 'When valid arguments are set' do
    
    subject do
      described_class.new(
        email:    'john.doe@example.com',
        name:     'John Doe',
        age:      45,
        gender:   :male,
        password: 'MySuperSecurePassword'
      )
    end
    
    it { should be_valid }
    
    it 'should have the correct attribute reader values' do
      subject.email.should    == 'john.doe@example.com'
      subject.name.should     == 'John Doe'
      subject.age.should      == 45
      subject.gender.should   == :male
      subject.password.should == 'MySuperSecurePassword'
    end
    
    context 'and no password is set before validation' do
    
      subject do
        described_class.new(
          email:    'john.doe@example.com',
          name:     'John Doe',
          age:      45,
          gender:   :male
        )
      end
      
      it 'should do generate a random password' do
        subject.password.should be_nil
        subject.should be_valid
        subject.password.should_not be_nil
      end
    
    end
    
  end
  
  context 'When invalid arguments are set' do
    
    subject do
      described_class.new(
        email:    'john.doe@example.com',
        age:      'forty-five',
        gender:   'masculine!'
      )
    end
    
    it 'should have the correct errors' do
      subject.should_not be_valid
      
      subject.should respond_to(:errors)
      subject.errors.messages.should have_key(:name)
      subject.errors.messages.should have_key(:age)
      subject.errors.messages.should have_key(:gender)
    end
    
  end
  
end