# File created 11/6/2019 by Sharon Qiu
# Edited 11/9/2019 by Sharon Qiu
# Edited 11/14/2019 by Leah Gillespie
# Caches necessary information on page.

require 'json'
require 'mechanize'

# Created 11/16/2019 by Sharon Qiu
# Caches club info
def club_cache_img(page)
    information = Hash.new
    next_page = "____"
    current_page = page
    #fields = [:name,:mission,:link,:location,:affiliations,:service,:img]
    fields = [:img]
    count = 1
    club_id = 1

    loop do
        table = current_page.css('div[id="ctl00_ContentBody_pageFormControl_panel_listing"]')[0].children[5].children
        table.each do |club|
            club_img = ''
            name = ''
            #club_info = fields.each_with_object(nil).to_h
            if !club.text.strip.empty?
                club.children.each do |inside|
                    if !inside.text.strip.empty?
                        #club_info[:link] = "https://activities.osu.edu" + inside.css('a').attribute('href')
                        inside.children.each do |field|
                            if !field.text.strip.empty?
                                club_img = "https://activities.osu.edu" + field.children[0].css('img').attribute('src') #image link
                                #club_info[:img] = "https://activities.osu.edu" + field.children[0].css('img').attribute('src') #image link
                                # field.children.each do |next_layer|                                    
                                #     if !next_layer.text.strip.empty?
                                #         inside = 0
                                #         next_layer.children.each do |card_values|
                                #             if !card_values.text.strip.empty?
                                #                 if inside == 0
                                #                     club_info[:location] = card_values.children[5].text.strip
                                #                 elsif inside == 1
                                #                     name = card_values.children[0].text.strip
                                #                     club_info[:name] = name
                                #                 elsif inside == 2
                                #                     affiliations, *service = card_values.children[0].text.strip.split(',')
                                #                     club_info[:affiliations] = affiliations
                                #                     club_info[:service] = service*", "
                                #                 elsif inside == 3
                                #                     club_info[:mission] = card_values.children[0].text.strip
                                #                 end
                                #                 inside += 1
                                #             end
                                #         end
                                #     end
                                # end
                            end
                        end
                    end
                end
            end
            club_img
            if !club_img.empty?
                information[club_id] = club_img
                club_id+=1
            end
            # if club_info[:img] != nil
            #     information[club_id] = club_img
            #     club_id+=1
            # end
            
            # if !name.empty?
            #     information[club_id] = club_info
            # end
        end
        
        #puts "pre-link-get string"
        next_page = current_page.css('a[title="Go to Next Page"]')
        break if next_page.empty?
        next_page_link = next_page[0].attribute('href')
        #puts "post-link-get string"
        link_check = current_page.link_with(:href => next_page_link.to_s)
        #puts "post-link-get"
        if !link_check.nil?
            #puts "pre-hit"
            current_page = link_check.click
            #puts "hit"
            puts count
            count += 1
            
        else
            puts current_page.link_with(:href => next_page_link.to_s).nil?
            break
        end

    end

    # hashit = JSON.pretty_generate(information)
    File.write 'clubsimg.txt', information.to_s
    # open('data-scrape/clubs_with_img.json','w+') {|file|
    #     file.puts hashit
    # }

end


# Created 11/6/2019 by Sharon Qiu
# Edited 11/9/2019 by Sharon Qiu: Cached info.
# Caches club info
def club_cache(page)
    information = Hash.new
    fields = [:name,:mission,:link,:location,:affiliations,:service]

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
                        location, affiliations, *service = pre_split.split(',')
                        club_info[:location] = location
                        club_info[:affiliations] = affiliations
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
    json_file = File.write 'clubs.txt', information.to_s
end

# Main orchestrator for caching
#===============================================================
agent = Mechanize.new
#page_list_view = agent.get("https://activities.osu.edu/involvement/student_organizations/find_a_student_org/?v=list&l=ALL&c=Columbus")

page_card_view = agent.get("https://activities.osu.edu/involvement/student_organizations/find_a_student_org?v=card&l=ALL&c=Columbus")

club_cache_img page_card_view

#club_cache page_list_view