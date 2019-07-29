                                                                ------------------NOTES-------------------- 

ModelName_spec

shoulda matchers are best test for simple effective one liners ( it {})

FactoryBot new folder inside of spec folder name it same as table name FactoryBot.define do factory model name 
FactoryBot can have associations which will refer to other FactoryBot defines 
    Rspec 
    describe 'uniqueness' do 
        before(:each) do #(this is an each loop does the block before everything)
            create(:user) #FactoryBot method creates that FactoryBot.defined from earlier 

spec folder has multiple folders speifically for what your testing (I.E controllers, models)

