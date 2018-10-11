require 'rubygems'
require 'nokogiri'
require 'open-uri'

#trouver les noms des cryptis

def crypto_fire()
page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

	@crypto_name = page.xpath('//a[@class = "currency-name-container link-secondary"]').map{|e|e.text}
	puts @crypto_name

end
crypto_fire

#trouver le valo

def crypto_valo()
price = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

		@crypto_valo = price.xpath('//a[@class = "price"]').map{|e|e.text}
		puts @crypto_valo
end
crypto_valo

#créer Hash de hash LOL

def crypto_all()
i = 0
tab_all = []
magic =  Hash[*@crypto_name.zip(@crypto_valo).flatten]
puts magic
	magic.each do i
	tab_all << magic
	i = i + 1
	end
end

crypto_all



#def crypto_all()
#i = 0
#tab_all = []
#magic =  Hash[*@crypto_name.zip(@crypto_valo).flatten]

#	magic.each do i
#	tab_all << magic
#	i = i + 1
#	end
#	puts tab_all
#end

#crypto_all