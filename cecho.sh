# Colorize

# Set the colours you can use
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

# Resets the style
reset=`tput sgr0`

# Color-echo. Improved. [Thanks @joaocunha]
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}