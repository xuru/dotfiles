#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# google cloud specific stuff
################################################################################

# this line makes gcutil work in a virtualenv
export CLOUDSDK_PYTHON_ARGS=' '

GCS=/usr/local/google-cloud-sdk 
if [ -d $GCS ]; then
    # The next line updates PATH for the Google Cloud SDK.
    source $GCS/path.bash.inc

    # The next line enables bash completion for gcloud.
    source $GCS/completion.bash.inc

    GAE=$GCS/platform/google_appengine
    # the above doesn't put google appengine on the path
    if [ -d $GAE ]; then
        export PATH=$PATH:$GAE:$GAE/lib/django-1.4/django/bin
        export PYTHONPATH=$GAE/lib/fancy_urllib:$GAE:$GAE/lib:$GAE/lib/yaml:$GAE/lib/django-1.4:$PYTHONPATH
    fi
fi
