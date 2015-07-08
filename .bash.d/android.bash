#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# android specific stuff
################################################################################

ANDROID=/usr/local/android-sdk-macosx
if [ -d $ANDROID ]; then
    export PATH=$PATH:$ANDROID/tools:"$ANDROID/platform-tools"
fi

