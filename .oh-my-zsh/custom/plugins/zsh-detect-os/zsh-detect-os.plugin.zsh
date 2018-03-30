if [[ `uname` == 'Linux' ]]
then
        export LINUX=1
        export GNU_USERLAND=1
else
        export LINUX=
fi

if [[ `uname` == 'Darwin' ]]
then
        export OSX=1
else
        export OSX=
fi

# Detect Macports GNU userland installation
if [[ "$OSX" == "1" ]]
then
    if [[ -e /opt/local/libexec/gnubin ]]
    then
        export GNU_USERLAND=1
    fi
fi

