require 'rubygems'
require 'nokogiri'
require 'open-uri'

#trouver les noms des députés

def politics()
@depute_mail =[]
page = Nokogiri::HTML(open('https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600'))
x = 0
y = 577
	while x < y
		@depute_mail[x] = page.xpath("/html/body/div[1]/main/div/div/div/ul[#{x}]/li[5]/a[1]").text
		x = x+1
	end
	puts @depute_mail 
end

politics


