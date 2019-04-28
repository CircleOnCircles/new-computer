from colorama import init
init()

from colorama import Fore, Back, Style

def printRed(value, *args, **argkws):
    print(Fore.RED + value  + Style.RESET_ALL, **argkws)
    for value in args: 
        print(Fore.RED + value  + Style.RESET_ALL, **argkws)


print(
    "I  ❤️  🍎",
    "Mac OS Install Setup Script",
    "By Nutchanon Ninyawee (CircleOnCircles)",
    "Follow me on twitter @CircleOnCircles",
    sep='\n'
)

printRed(
    """
    ###############################################
    #        DO NOT RUN THIS SCRIPT BLINDLY       #
    #         YOU'LL PROBABLY REGRET IT...        #
    #                                             #
    #              READ IT THOROUGHLY             #
    #         AND EDIT TO SUIT YOUR NEEDS         #
    ###############################################n
    
    """
)

from bullet import Bullet, Check, YesNo, Input
from bullet import colors

cli = YesNo("Have you read through the script you're about to run and understood that it will make changes to your computer?\n > ", word_color=colors.foreground['red'])
continue_ = cli.launch()

if not continue_:
    printRed("Please go read the script, it only takes a few minutes")
    import sys
    sys.exit(0)

