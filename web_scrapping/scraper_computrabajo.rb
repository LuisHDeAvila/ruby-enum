#!/usr/bin/env ruby
# Author: eleAche
require 'nokogiri'
require 'httparty'

# Crear una base de datos de "patrones de diseno" para interfaces de usuario.
def scrapper
        # Contenido objetivo
        url = "https://www.computrabajo.com.mx/empleos-en-torreon"
        unparsed = HTTParty.get(url)
        parsed = Nokogiri::HTML(unparsed.body)
        jobs = parsed.css('div.w100')
        listjobs = jobs.count        
        array = []
        total = parsed.css('span.mr5').text
        total = total.scan(/\d+/) { |i| array.push(i.to_i)}
        puts "// Esta base de datos contiene #{total} empleos"
        jobscounter = total.to_i
        last_page = ( jobscounter / listjobs )
        counter = 0
        
        # IMPRIME TODOS LOS EMPLEOS
        while counter <= last_page
                
                # iteracion por paginas
                job__url = "https://www.computrabajo.com.mx/empleos-en-torreon?p=#{counter}"
                patt_unparsed = HTTParty.get(job__url)
                patt_parsed = Nokogiri::HTML(patt_unparsed.body)
                patt_container = patt_parsed.css('div.w100')
                jobs_list = patt_container.css('div.bClick')
                page_counter = 0

                # imprime todos los empleos en cada pagina
                while page_counter < 20
                        job_card = patt_container.css('div.bClick')[page_counter]
                        job_details = job_card.css('p')
                        job_link = job_card.css("a")[0]["href"]

                        # estructura de empleo
                        job_s = {
                                pagina: counter +1,
                                job_inpage: page_counter +1,
                                title: job_card.css('h1').text,
                                from: job_card.css('a.it-blank').text,
                                details: job_details.text,
                                url: "https://computrabajo.com.mx#{job_link}",
                        }
                        
                        # imprime cada empleo ##########
                        puts "{"
                        job_s.each do |llave, valor|
                                valor = "#{valor}".gsub("\n","\\n")
                                valor = "#{valor}".gsub("\t","\\t")
                                valor = "#{valor}".gsub("   ", "")
                                valor = "#{valor}".gsub("\"", "")
                                valor = "#{valor}".gsub("\'", "")
                                puts "#{llave}\: \'#{valor}\',"
                        end
                        puts "},"
                        ########## imprime cada empleo #

                page_counter += 1
                end
                counter += 1
        end
        
end



# ejecuta el metodo scrapper
scrapper
