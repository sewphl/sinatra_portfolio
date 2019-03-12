

Customer.create(:username => "customer1", :first_name => "Customer", :last_name => "One", :address => "123 Main St", :email => "myemail1@email.com", :password => "password1")
Customer.create(:username => "customer2", :first_name => "Customer", :last_name => "Two", :address => "234 Main St.", :email => "myemail2@email.com", :password => "password2")
Customer.create(:username => "customer3", :first_name => "Customer", :last_name => "Three", :address => "345 Main St.", :email => "myemail3@email.com", :password => "password3")
Customer.create(:username => "customer4", :first_name => "Customer", :last_name => "Four", :address => "456 Main St.", :email => "myemail4@email.com", :password => "password4")
Customer.create(:username => "customer5", :first_name => "Customer", :last_name => "Five", :address => "567 Main St.", :email => "myemail5@email.com", :password => "password5")

Herb.create(:name => "corydalis", :plant_part => "tuber, root", :latin_name => "Corydalis yanhusuo, bulbosa")
Herb.create(:name => "kava kava", :plant_part => "root", :latin_name => "Piper methysticum")
Herb.create(:name => "jamaican dogwood", :plant_part => "bark", :latin_name => "Piscidia erythrina")
Herb.create(:name => "valerian", :plant_part => "root", :latin_name => "Valeriana officinalis")
Herb.create(:name => "meadowsweet", :plant_part => "leaves, tops", :latin_name => "Filipendula ulmaria")
Herb.create(:name => "ginkgo", :plant_part => "leaf", :latin_name => "Ginkgo biloba")
Herb.create(:name => "ginseng", :plant_part => "root", :latin_name => "Panax ginseng")
Herb.create(:name => "burdock", :plant_part => "root", :latin_name => "Arctium lappa")
Herb.create(:name => "ginger", :plant_part => "root", :latin_name => "Zingiber officinalis")
Herb.create(:name => "cayenne", :plant_part => "fruit", :latin_name => "Capsicum spp.")
Herb.create(:name => "milk thistle", :plant_part => "seed", :latin_name => "Silybum marianum")
Herb.create(:name => "oregon grape", :plant_part => "root", :latin_name => "Mahonia spp.")

Tincture.create(:name => "liver love", :supports => "healthy liver function", :inventory => 10)
Tincture.create(:name => "circ care", :supports => "healthy circulatory function", :inventory => 10)
Tincture.create(:name => "painless", :supports => "pain relief", :inventory => 10)

##liver love
TincturesHerbs.create(:tincture_id => 1, :herb_id => 8)
TincturesHerbs.create(:tincture_id => 1, :herb_id => 11)
TincturesHerbs.create(:tincture_id => 1, :herb_id => 12)
##circ care
TincturesHerbs.create(:tincture_id => 2, :herb_id => 6)
TincturesHerbs.create(:tincture_id => 2, :herb_id => 7)
TincturesHerbs.create(:tincture_id => 2, :herb_id => 8)
TincturesHerbs.create(:tincture_id => 2, :herb_id => 9)
TincturesHerbs.create(:tincture_id => 2, :herb_id => 10)
##painless
TincturesHerbs.create(:tincture_id => 3, :herb_id => 1)
TincturesHerbs.create(:tincture_id => 3, :herb_id => 2)
TincturesHerbs.create(:tincture_id => 3, :herb_id => 3)
TincturesHerbs.create(:tincture_id => 3, :herb_id => 4)
TincturesHerbs.create(:tincture_id => 3, :herb_id => 5)
