# File created 11/6/2019 by Sharon Qiu
# Edited 11/9/2019 by Sharon Qiu
# Caches necessary information on page.

require 'json'
require 'mechanize'

# Created 11/6/2019 by Sharon Qiu
# Edited 11/9/2019 by Sharon Qiu: Cached info.
# Caches club info
def club_cache(page)
    information = Hash.new
    fields = [:name,:mission,:link,:location,:type,:service]

    table_info = page.css('table[class="c-table"]').children

    count = 0
    table_info.each do |club|
        inside = 0
        if count > 2
            club_info = fields.each_with_object(nil).to_h
            club.children.each do |value|
                if !value.text.strip.empty?
                    if inside == 0
                        name = value.css('a').text.strip
                        club_info[:name] = name
                        link = "https://activities.osu.edu" + value.css('a').attribute('href')
                        club_info[:link] = link
                    elsif inside == 1
                        mission = value.text.strip
                        club_info[:mission] = mission
                    elsif inside == 2
                        pre_split = value.text.strip
                        post_split = pre_split.split(',')
                        location, type, *service = pre_split.split(',')
                        club_info[:location] = location
                        club_info[:type] = type
                        club_info[:service] = service*", "
                    end
                    inside += 1
                end
                information[name] = club_info
            end
        end
        count+=1
    end
    
    #Saves as json 
    json_file = File.open('data-scrape/clubs.json', 'w') {|file| file.write JSON.pretty_generate(information)}

end

# Main orchestrator for caching
#===============================================================
agent = Mechanize.new
page = agent.get("https://activities.osu.edu/involvement/student_organizations/find_a_student_org/?v=list&l=ALL&c=Columbus")

club_cache page

