#!/usr/bin/env bash
source ./configure.yassi
source ./connect_dirs.conf
cat > bin/connect << EOF
#!/bin/bash
#	Description:	
#	
#	Author: 	Simon Arjuna Erat, erat.simon@gmail.com
#	Date (created):	2015-06-16
#	Date (changed):	2015-12-29
#
	source tuirc
	CFG_SYS=${SYSCONFDIR:-$PREFIX/etc}/connect.conf
	[ -f "\$CFG" ] && source "\$CFG"
	BINDIR="$BINDIR"
	HOMEBASE="${HOMEBASE/\/\//\/}"
#
#	Variables
#
	APP_VERSION=$APP_VER
	ME="\${0##*/}"
	ME_DIR="\${0/$ME}}"
	ME_BASE="$DATADIR"
	ME_MENU="\$ME_BASE/to"
	TITLE="Connect (\$APP_VERSION)"
	MORE_OPTS=""
	DIR_CFG="\${HOME:-\$(eval echo ~\$USER)}/.config/connect"
	export DIR_CFG
#
#	Help text
#
	help_text="
\$ME (\$script_version)
\${TITLE^}
Usage: 		\$ME [options] TASK [options] LABEL

Example for the very first time:

	connect wifi new
		<follow wizard>
	
	connect nas new
		<follow wizard>
		
	echo 2 | sudo connect setup copy
	sudo connect wifi serv <LABEL>
	
"
	case "\$1" in
	-h|--help)	printf '%s\n' "\$help_text"
			exit 0
			;;
	-q|--quiet)	export beQuiet=true
			MORE_OPTS+=" -q"
			shift
			;;
	esac
#
#	Display to user
#
	#tui-bol-root || tui-status 111 "It is recomended to run \$ME as root!"
	tui-browser \\
		-p "\$ME_MENU" \\
		-T "\$TITLE" \\
		-c "\$DIR_CFG/connect.conf" \\
		\$MORE_OPTS "\${@}"
EOF
chmod +x bin/connect
