require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_all_the_urls_of_val_doise_townhalls()
page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
x = 0
@tab = []
	while (x < 185)
		lead = page.css('a.lientxt')[x]['href']
		@tab[x] = lead.sub(".", "http://annuaire-des-mairies.com")#methode sub permet de substituer le "." par l'url
		x = x +1
	end 
	puts @tab
	return@tab
end 
get_all_the_urls_of_val_doise_townhalls 

def get_all_email_of_a_townhal_from_its_webpage()
tab_mail = []
for i in get_all_the_urls_of_val_doise_townhalls 
		link = Nokogiri::HTML(open(i))
		mail = link.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text #.text = permet de selctionner juste le text en enlevant la balise
		tab_mail << mail
	end 
	puts tab_mail
end 
get_all_email_of_a_townhal_from_its_webpage


