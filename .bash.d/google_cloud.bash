#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# google cloud specific stuff
################################################################################

# this line makes gcutil work in a virtualenv
export CLOUDSDK_PYTHON_ARGS=' '

if [ -d /usr/local/google-cloud-sdk ]; then
    # The next line updates PATH for the Google Cloud SDK.
    source /usr/local/google-cloud-sdk/path.bash.inc

    # The next line enables bash completion for gcloud.
    source /usr/local/google-cloud-sdk/completion.bash.inc
fi
