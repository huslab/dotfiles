# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
if [[ $TERM == xterm || $TERM == screen ]];
then
        export TERM="xterm-256color";
else
        export TERM="wsvt25";
fi

COLORTERM=
export PATH HOME TERM

alias rm='rm -i'
alias mv='mv -i'

export GIT_SSL_NO_VERIFY=true

# This is to dial STC 3G
function stc3g {
        function stc3gConnect {
        sudo ifconfig ppp0 create
        pppd call stc3g &
        }
        function stc3gDisconnect {
        pkill -9 pppd
        sudo ifconfig ppp0 destroy
        }
        if [[ $1 = "connect" ]];
        then
                echo "Connecting to STC3G...";
                stc3gConnect;
        elif [[ $1 = "disconnect" ]];
        then
        echo "Disconnect from STC3G...";
                stc3gDisconnect;
        elif [[ $1 = "restart" ]];
        then
        echo "Restarting STC3G connection...";
                stc3gDisconnect;
                stc3gConnect;
        else
        echo "Usage: SAR 0 [connect|disconnect|restart]";
        fi
}
