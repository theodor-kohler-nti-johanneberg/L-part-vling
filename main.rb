def addNewRunner(runner_name)
    data = File.read("data.txt").split("\n").map { |element| element.split(", ") }

    name = runner_name

    nameAccepted = true

    i = 0
    while i < data.length
        if name == data[i][0]
            nameAccepted = false
            break
        end

        i += 1
    end


    while !nameAccepted
        puts "Man får inte lägga till en person två gånger och personen som försöktes läggas till finns redan i databasen. Om personen har samma namn lägg till efternamn."

        name = gets.chomp

        nameAccepted = true

        while i < data.length
            if name == data[i][0]
                nameAccepted = false
                break
            end

            i += 1
        end
    end

    output = name + ", 0\n"

    file = File.open("data.txt", "a")
    file.puts(output)
    file.close

    return output
end

def addNewRunnerAndTime(runner_name, runner_time)
    output = runner_name + ", " + runner_time.to_s + "\n"
    
    file = File.open("data.txt", "a")
    file.puts(output)
    file.close

    return output
end

def updateRunnerTime(runner_name, runner_time)
    data = File.read("data.txt").split("\n").map { |element| element.split(", ") }
    
    i = 0
    while i < data.length
        if data[i][0] == runner_name
            if data[i][0] != 0
                raise "Man får inte ändra redan satta tider. Man får endast ändra tiden på deltagare som ännu inte har kommit i mål och därmed inte har en dokumenterad tid.    "
            end
            data[i][1] = runner_time.to_s
            break
        end

        i += 1
    end

    output = ""

    for i in data
        output += i[0] + ", " + i[1] + "\n"
    end

    File.write("data.txt", output)

end

def sortByRunnerTime()
    data = File.read("data.txt").split("\n").map { |element| element.split(", ") }.map { |element| [element[0], element[1].to_i]}

    i = 0
    while i < data.length
        if data[i][1] == 0
            data.delete_at(i)
            i -= 1
        end

        i += 1
    end

    return data.sort_by { |arr| arr[1] }
end

def createTextFileSortedByTime()
    output = ""
    data = sortByRunnerTime()

    i = 0
    while i < data.length
        output += data[i][0] + ", " + data[i][1].to_s + "\n"
        i += 1
    end

    File.write("dataSortedByTime.txt", output)
end

def createTextFileSortedByName()
    data = File.read("data.txt").split("\n").map { |element| element.split(", ") }.map { |element| [element[0], element[1].to_i]}
    output = ""

    i = 0
    while i < data.length
        if data[i][1] == 0
            data.delete_at(i)
            i -= 1
        end

        i += 1
    end

    sortedByName = data.sort
    
    i = 0
    while i < sortedByName.length
        output += sortedByName[i][0] + ", " + sortedByName[i][1].to_s + "\n"
        i += 1
    end

    File.write("dataSortedByName.txt", output)
end

def main()
    puts "Skriv in namnet på filen med data du vill arbeta med. (Filen måste ligga i detta registret)"
    file_path = gets.chomp

    while true
        puts "Vad vill du göra?"
        puts "1. Skriva in namn på en ny deltagare som ska springa men som ännu inte gått i mål."
        puts "2. Skriva in namn och tid på en ny deltagare som har sprungit färdigt."
        puts "3. Skriva in tid på någon som står i listan och har gått i mål."
        puts "4. Sortera deltagarna på deras tider så en vinnare kan avgöras."
        puts "5. Skapa en ny textfil där deltagarna står sorterade efter tid."
        puts "6. Skapa en ny textfil där deltagarna står sorterade efter namn."
        puts "§. Avsluta"
        user_choice = gets.chomp.to_i

        case user_choice
        when 1
            puts "Skriv in namnet på deltagaren du vill skriva in"
            runner_name = gets.chomp
            addNewRunner(runner_name)
        when 2
            puts "Skriv in namnet på deltagaren du vill skriva in"
            runner_name = gets.chomp
            puts "Skriv in tiden för den deltagaren du vill skriva in"
            runner_time =  gets.chomp

            addNewRunnerAndTime(runner_name, runner_time)
        when 3
            puts "Skriv in namnet på den deltagaren du vill lägga in en tid på"
            runner_name = gets.chomp
            puts "Skriv in tiden för den deltagaren"
            runner_time =  gets.chomp

            updateRunnerTime(runner_name, runner_time)

        when 4
            sortedListOfRunners = sortByRunnerTime

            puts ""

            for i in 0...sortedListOfRunners.length
                puts "#{i+1}. " + sortedListOfRunners[i][0] + " med tiden " + sortedListOfRunners[i][1].to_s
            end
            
            puts ""

        when 5


        when 6
        
        else
            puts "Inte en igenkänd funktion, försök igen"
            while [1,2,3,4,5,6].include?(user_choice)
                user_choice = gets.chomp.to_i
            end

            case user_choice
            when 1
                
            when 2
    
            when 3
    
            when 4
    
            when 5
    
            when 6

            end 
        end
    end
end

#addNewRunner("Annika")
#addNewRunnerAndTime("Theo", 600)
#updateRunnerTime("Theo", 5000)
#p sortByRunnerTime()

main()
#createTextFileSortedByName()