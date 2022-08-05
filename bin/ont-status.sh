#!/usr/bin/expect
# uid: supporttest
# pwd: nomail4u

set user [lindex $argv 0]
set password [lindex $argv 1]
set timeout 30
set loctet 10

for {set x 1} {$x < 5} {incr x 1} {
	spawn telnet 10.9.224.$loctet
	expect "Username:"
	send $user\r

	expect "Password:"
	send $password\r

	expect "383-3.TA5000-0"
	send "term len 0\r"

	expect "383-3.TA5000-0"
	send "show table remote-devices ont | i disc.\r"

	expect "383-3.TA5000-0"
	send "exit\r"

	set loctet [expr $loctet+1]
}
