#login animation
def login_ascii
  puts "         _______      ______                "
  puts '|\\      |\\\\___//|  |\\\\_____/   |\\  |\\ _  /| '
  puts '| |     | |   | |  | |         | | | | \\| |'
  puts '|/      |/     \\|  |/   ____   |/  |/ \\ \\ |'
  puts '|\      |\     /|  |\\   \__//| |\\  |\\  \\//|'
  puts "| |___  | |___| |  | |_____| | | | | |  | |"
  puts '|//___\ |//___\\\\|  |//_____\\\\| |/  |/    \\| '
end

def login_ascii_f2
  puts "         _______      ______"
  puts '|\ 1   1|\\\\___//|1 |\\\\_____/   |\\  |\\ _  /| 0 1     1'
  puts '| |  0  | |   | |  | |   0    1| |0| | \\| |   1     0'
  puts '|/      |/     \| 0|/ 1 ____   |/  |/ \\ \\ |          '
  puts '|\\   1  |\\     /|  |\\   \\__//|0|\\  |\\  \\//| 1     0  '
  puts "| |___  | |___| |1 | |_____| | | |1| |  | |         1"
  puts '|//___\0|//___\\\\|  |//_____\\\\| |/  |/    \\| 0 1   0  '
end

def login_ascii_f3
  puts "         _______      ______"
  puts '|\\      |\\\\___//|  |\\\\_____/   |\\  |\\ _  /| '
  puts '| |1   1| |   | |1 | |         | | | | \\| | 0 1     1'
  puts '|/   0  |/     \\|  |/   ____  1|/ 0|/ \\ \\ | 1     0'
  puts '|\\      |\\     /| 0|\ 1 \__//| |\\  |\  \\//|         '
  puts "| |___  | |___| |  | |_____| |0| | | |  | | 1     0  "
  puts '|//___\\ |//___\\\\|1 |//_____\\\\| |/ 1|/    \\|         1'
end

def login_ascii_f4
  puts "         _______      ______"
  puts '|\\      |\\\\___//|  |\\\\_____/   |\\  |\\ _  /| '
  puts '| |     | |   | |  | |         | | | | \\| |  '
  puts '|/ 1   1|/     \|1 |/   ____   |/  |/ \\ \\ | 0 1      1'
  puts '|\\   0  |\     /|  |\   \__//|1|\  |\  \//| 1     0    '
  puts "| |___  | |___| | 0| |_____| | | |0| |  | |            "
  puts '|//___\\ |//___\\\\|  |//_____\\\\|0|/  |/    \\| 1     0     '
end

def login_ascii_f5
  puts "         _______      ______"
  puts '|\\      |\\\\___//|  |\\\\_____/   |\\  |\\ _  /| '
  puts '| |     | |   | |  | |         | | | | \\| |  '
  puts '|/      |/     \\|  |/   ____   |/  |/ \\ \\ |   '
  puts '|\\ 1   1|\\     /|1 |\\   \\__//| |\\  |\\  \\//| 0 1      1'
  puts "| |___  | |___| |  | |_____| |1| | | |  | | 1     0    "
  puts '|//___\\ |//___\\\\| 0|//_____\\\\| |/ 0|/    \\|           '
end

def login_ascii_f6
  puts "         _______      ______"
  puts '|\\      |\\\\___//|  |\\\\_____/   |\\  |\\ _  /| '
  puts '| |     | |   | |  | |         | | | | \\| |      '
  puts '|/      |/     \\|  |/   ____   |/  |/ \\ \\ |          '
  puts '|\\      |\\     /|  |\\   \__//| |\\  |\\  \\//| '
  puts "| |___ 1| |___| |1 | |_____| | | | | |  | | 0 1      1                    "
  puts '|//___\\ |//___\\\\|  |//_____\\\\|1|/  |/    \\| 1     0   '
end

def login_ascii_f7
  puts "         _______      ______"
  puts '|\\      |\\\\___//|  |\\\\_____/   |\\  |\\ _  /| '
  puts '| |     | |   | |  | |         | | | | \\| |      '
  puts '|/      |/     \\|  |/   ____   |/  |/ \\ \\ |          '
  puts '|\      |\\     /|  |\\   \\__//| |\\  |\\  \\//| '
  puts "| |___  | |___| |  | |_____| | | | | |  | |                             "
  puts '|//___\\1|//___\\\\|1 |//_____\\\\| |/  |/    \| 0 1      1'
end

def login_animation
  puts "\e[H\e[2J"
  login_ascii_f2
  sleep(0.1)
  puts "\e[H\e[2J"
  login_ascii_f3
  sleep(0.1)
  puts "\e[H\e[2J"
  login_ascii_f4
  sleep(0.1)
  puts "\e[H\e[2J"
  login_ascii_f5
  sleep(0.1)
  puts "\e[H\e[2J"
  login_ascii_f6
  sleep(0.1)
  puts "\e[H\e[2J"
  login_ascii_f7
  sleep(0.1)
  puts "\e[H\e[2J"
  login_ascii
end

#welcome animation
def welcome_ascii
  puts " _    _   ____   _      _____    ___    _    _   ____   ____"
  puts '| |  | | |  __/ | |    /  _  \  / _ \  | \  / | |  __/ \    /'
  puts '| |  | | | |__  | |    | | |_/ | / \ | |  \/  | | |__   \  /'
  puts '| |  | | |  __| | |    | |  _  | | | | | |\/| | |  __|   \/'
  puts '| \/\/ | | |__  | |__  | |_| \ | \_/ | | |  | | | |__    __ '
  puts ' \_/\_/  |____\ |____\ \_____/  \___/  |_|  |_| |____\  |__|'
end

def welcome_ascii_frame_2
  puts " _  * _   ____*  _   *  _____  * ___   *_    _   ____  *____"
  puts '| |* | | |  __/ | |   */  _  \* / _ \* | \ */ |*|  __/ \    /'
  puts '| |  | | | |__ *| |*   | | |_/ | / \ | |  \/  | | |__ * \  /'
  puts '| | *| | |  __| | |    | |* _  | |*| | | |\/| | |  __| * \/'
  puts '| \/\/ |*| |__* | |__ *| |_| \ | \_/ | | |* | |*| |__*   __ '
  puts ' \_/\_/  |____\*|____\ \_____/ *\___/ *|_| *|_| |____\ *|__|'
end

def welcome_ascii_frame_3
  puts " _ *  _   ____ * _  *   _____ *  ___    _*   _   ____*  ____"
  puts '| | *| | |  __/ | |    /  _  \ */ _ \  | \* / | |  __/ \    /'
  puts '| |  | |*| |__  | | *  | | |_/ | / \ | |  \/  |*| |__  *\  /'
  puts '| |* | | |  __| | |    | | *_  | | | | | |\/| | |  __|*  \/'
  puts '| \/\/ | | |__ *| |__* | |_| \ | \_/ |*| | *| | | |__  * __ '
  puts ' \_/\_/ *|____\ |____\ \_____/* \___/  |_|* |_|*|____\* |__|'
end

def welcome_animation
  5.times do
    # puts "\e[H\e[2J"
    # welcome_ascii
    # sleep(0.3)
    puts "\e[H\e[2J"
    welcome_ascii_frame_2
    sleep(0.3)
    puts "\e[H\e[2J"
    welcome_ascii_frame_3
    sleep(0.3)
    puts "\e[H\e[2J"
  end
  welcome_ascii
end

#goodbye animation

def hand_wave
  2.times do
    puts "\e[H\e[2J"
    hand
    sleep(0.3)
    puts "\e[H\e[2J"
    hand_f_2
    sleep(0.3)
  end
end

def fancy_goodbye_1
  puts "     _"
  puts "   _| |_"
  puts " _| | | |"
  puts "| | | | | "
  puts "| | | | | _"
  puts "|       |/ /"
  puts "|         /"
  puts ' \_______/'
  puts " ______     ____    ____   _____   _____ __     __ ______  _______"
  puts "/  ___ \\   / __ \\  / __ \\ |  __ \\ |  _  \\\\ \\   / /|  ____| \\     /"
  puts "| /   \\_\\ | /  \\ || /  \\ || |  \\ || | | | \\ \\ / / | |       \\   /"
  puts "| |  ____ | |  | || |  | || |  | || |/  /  \\ ` /  |  --.     \\_/"
  puts "| | |_  _|| |  | || |  | || |  | ||  _  \\   | |   |  --‘      _"
  puts "| \\__/  | | \\__/ || \\__/ || |__/ || |_\\ |   | |   | |____    / \\"
  puts " \\____/_|  \\____/  \\____/ |_____/ |_____/   |_|   |______|   \\_/"
end

def fancy_goodbye_2
  puts "   __"
  puts '  _\\ \\_'
  puts '_\\ \\ \\ \\'
  puts '\\ \\ \\ \\ \\ '
  puts ' \\ \\ \\ \\ \\  __'
  puts '  \\       \\/ /'
  puts '   \\        /'
  puts '    \\______/'
  puts " ______     ____    ____   _____   _____ __     __ ______  _______"
  puts "/  ___ \\   / __ \\  / __ \\ |  __ \\ |  _  \\\\ \\   / /|  ____| \\     /"
  puts "| /   \\_\\ | /  \\ || /  \\ || |  \\ || | | | \\ \\ / / | |       \\   /"
  puts "| |  ____ | |  | || |  | || |  | || |/  /  \\ ` /  |  --.     \\_/"
  puts "| | |_  _|| |  | || |  | || |  | ||  _  \\   | |   |  --‘      _"
  puts "| \\__/  | | \\__/ || \\__/ || |__/ || |_\\ |   | |   | |____    / \\"
  puts " \\____/_|  \\____/  \\____/ |_____/ |_____/   |_|   |______|   \\_/"
end

def goodbye_wave
  3.times do
    puts "\e[H\e[2J"
    fancy_goodbye_1
    sleep(0.3)
    puts "\e[H\e[2J"
    fancy_goodbye_2
    sleep(0.3)
  end
  exit
end

#hello animation
def hello
  puts " __   __          ___   ___           ___"
  puts " |    |            |     |           |   |"
  puts " |____|    ___     |     |    ___     | |"
  puts ' |    |   /__/ _   |     |   /   \\     |'
  puts '_|_  _|_  \\___/   _|_   _|_  \\___/    (@)'
end

def hello_f2
  puts " __   __       *  ___   ___      *    ___"
  puts " |  * |   *        | *   |    *      |   |"
  puts " |____|*   ___ *   |   * |    ___  *  | |"
  puts ' | *  |   /__/ _   |  *  |   /   \\     |'
  puts '_|_  _|_ *\\___/   _|_   _|_  \\___/ *  (@)'
end

def hello_f3
  puts " __  *__       *  ___   ___           ___"
  puts " |    |     *      |   * |      *    |   |"
  puts " |____| *  ___     |     |  * ___   * | |"
  puts ' |  * |   /__/ _*  | *   |   /   \\   * |'
  puts '_|_  _|_* \\___/   _|_ * _|_  \\___/    (@)'
end

def hello_animation
  2.times do
    puts "\e[H\e[2J"
    hello_f2
    sleep(0.3)
    puts "\e[H\e[2J"
    hello_f3
    sleep(0.3)
    puts "\e[H\e[2J"
    hello_f2
    puts "\e[H\e[2J"
  end
  hello
end
