#Author: Harald Lønsethagen
#Date: 4.11.2017
#Version: Python 3.6.1
import subprocess as sub

def main():
	git_add_all = "git add *"
	try:
		output = sub.check_output(['bash', '-c', git_add_all])
	except:
		print("Failed to '" + git_add_all + "'")
	commit_message = input("Write your commit message: ")
	command = 'git commit -m "' + commit_message + '"' 
	try:
		output = sub.check_output(['bash', '-c', command])
	except:
		print("Failed to '" + command + "'")

	command = "git push origin master"
	try:
		output = sub.check_output(['bash', '-c', command])
	except:
		print("Failed to '" + command + "'")

	print("Finished script")

	#raise Exception()



if __name__ == '__main__':
    main()










