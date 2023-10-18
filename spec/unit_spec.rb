require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should validate presence of email' do
      user = User.new(email: '')
      expect(user.valid?).to be false
      expect(user.errors[:email]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it 'should have many foods and recipes' do
      user = User.reflect_on_association(:groups)
      expect(user.macro).to eq(:has_many)
      user = User.reflect_on_association(:entities)
      expect(user.macro).to eq(:has_many)
    end
  end
end

RSpec.describe Group, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'Test', email: 'test@gmail.com')
      @Group = Group.create(name: 'Melcom', icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGv4xkuVEornxwKLRdZGkC2XeGGOM2hDRlBqTl6B0jA&s', user_id: @user)
    end

    it 'has a name' do
      expect(@Group.name).to eq('Melcom')
    end

    it 'belongs to a user' do
      expect(@Group.user_id).to eq(@user.id)
    end
  end
end

RSpec.describe Entity, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'Test', email: 'test@gmail.com')
      @group = Group.create(name: 'Melcom', icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGv4xkuVEornxwKLRdZGkC2XeGGOM2hDRlBqTl6B0jA&s', user_id: @user)
      @entity = Entity.create(author_id: @user, name: 'iphone', amount: 4500, group_id: @group)
    end

    it 'has a name' do
      expect(@entity.name).to eq('iphone')
    end

    it 'belongs to a user' do
      expect(@entity.author_id).to eq(@user.id)
    end
  end
end