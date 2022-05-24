import random
import os
import sys
import curses

stdcrs = curses.initscr()
curses.echo()

letters = "abcdefghijklmnopqrstuvwxyz"
warning_tags = [".java", ".py", ".rs", ".cs", ".R", ".db", ".c", ".cpp", ".h", ".hpp", ".ts", ".js", ".odin", "*"]

code_length = 3

alph = list(letters + letters.upper())

height, width = stdcrs.getmaxyx()

def print_center_text(row, text):
    stdcrs.addstr(row, max(int(width / 2 - len(text) / 2), 0), text)

argv_joined = ''.join(sys.argv[1:])
multiple_objects = len(list(filter(lambda x: not x.startswith('-'), sys.argv[1:]))) > 1

if '/' in argv_joined and "-r" not in argv_joined:
    print_center_text(height // 2 - 8, "Trying to delete folder, you probably want to add the -r argument.")

if '-r' in argv_joined:
    code_length += 1
    print_center_text(height // 2 - 7, "Trying to delete folder, using longer confirmation code.")

if sum(map(lambda x: x in argv_joined, warning_tags)) > 0:
    code_length += 1
    print_center_text(height // 2 - 6, "Trying to delete by-file-type protected file{}, using longer confirmation code.".format("s" if multiple_objects else ""))

if multiple_objects:
    code_length += 1
    print_center_text(height // 2 - 5, "Trying to delete multiple files, using longer confirmation code.")

if not '/' in argv_joined:
    type_of_delete = "File{}"
elif False in map(lambda x: x.endswith('/') | x.startswith('-'), sys.argv[1:]):
    type_of_delete = "File{} and folder{}"
else:
    type_of_delete = "Folder{}"

if multiple_objects:
    type_of_delete = type_of_delete.replace("{}", "s")
else:
    type_of_delete = type_of_delete.replace("{}", "")

arguments = ''.join(map(lambda x: x + " " if x.startswith('-') else " ", sys.argv[1:]))

print_center_text(height // 2 - 3, "{} to delete: {}".format(type_of_delete, ''.join(map(lambda x: " " if x.startswith('-') else x + " ", sys.argv[1:]))))
print_center_text(height // 2 - 2, "Arguments: {}".format(''.join(map(lambda x: x + " " if x.startswith('-') else " ", sys.argv[1:]))))

code = ''.join([random.choice(alph) for x in range(code_length)])
print_center_text(height // 2, f"Confirmation code:     {code}")
print_center_text(height // 2 + 1, "Enter code to confirm: " + " " * code_length)
ref = stdcrs.getstr(height // 2 + 1, int(width / 2 + (23 + code_length) / 2) - code_length, code_length).decode("utf-8")
stdcrs.refresh()

curses.endwin()

if ref == code:
    os.system("rm " + ''.join(map(lambda x: "'{}' ".format(x), sys.argv[1:])))
else:
    print("Invalid code")

