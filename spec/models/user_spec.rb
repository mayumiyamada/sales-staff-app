require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it '社員番号、名前、名前カナ、email、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
  
    it 'passwordとpassword_confirmationが半角英数字混合の6文字以上であれば登録できる' do
          @user.password = '000aaa'
          @user.password_confirmation = '000aaa'
          expect(@user).to be_valid
      end
    end
  
   describe 'ユーザー新規登録' do
    context '新規登録できないとき' do
     it '社員番号が空では登録できない' do
      @user.employee_id_number = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("社員番号を入力してください")
    end

    it '社員番号は6桁以上では登録できない' do
      @user.employee_id_number = '001212'
      @user.valid?
      expect(@user.errors.full_messages).to include("社員番号は5文字以内で入力してください")
    end

    it '社員番号は数字以外登録できない' do
      @user.employee_id_number = 'アイウE'
      @user.valid?
      expect(@user.errors.full_messages).to include("社員番号は不正な値です")
    end

     it '名前が空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

     it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

     it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

     it 'メールアドレスは＠が含まれないと登録ができない' do
      @user.email = 'test.test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

     it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

     it 'passwordが5文字以下では登録できない' do
      @user.password = '000aa'
      @user.password_confirmation = '000aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード英数字混合6文字以上で登録してください")
    end

     it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

     it 'passwordとpassword_confirmationが一致しない場合、登録できない' do
      @user.password = '000aaa'
      @user.password_confirmation = '000bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

     it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード英数字混合6文字以上で登録してください")
    end

     it 'passwordは数字のみ（６桁）は登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード英数字混合6文字以上で登録してください")
    end

     it 'passwordは全角英数字混合は登録できない' do
      @user.password = '０００ＢＢＢ'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード英数字混合6文字以上で登録してください")
     end 
   end
  end
 end
end