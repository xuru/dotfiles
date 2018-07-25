. "$BASH_IT/themes/powerline/powerline.base.bash"

function __powerline_left_segment {
  local OLD_IFS="${IFS}"; IFS="|"
  local params=( $1 )
  IFS="${OLD_IFS}"
  local separator_char=""
  local separator=""

  if [[ "${SEGMENTS_AT_LEFT}" -gt 0 ]]; then
    separator="${separator_char}"
  fi
  LEFT_PROMPT+="${separator}$(set_color ${params[1]} -) ${params[0]} ${normal}"
  (( SEGMENTS_AT_LEFT += 1 ))
}

function __powerline_prompt_command {
  local last_status="$?" ## always the first
  local separator_char="${POWERLINE_LEFT_SEPARATOR}"
  local move_cursor_rightmost='\033[500C'

  LEFT_PROMPT=""
  SEGMENTS_AT_LEFT=0
  SEGMENTS_AT_RIGHT=0
  LAST_SEGMENT_COLOR=""

  ## left prompt ##
  for segment in $POWERLINE_LEFT_PROMPT; do
    local info="$(__powerline_${segment}_prompt)"
    [[ -n "${info}" ]] && __powerline_left_segment "${info}"
  done
  [[ -n "${LEFT_PROMPT}" ]] && LEFT_PROMPT+="$(set_color ${LAST_SEGMENT_COLOR} -)${POWERLINE_LEFT_END}${normal}"

  PS1="${LEFT_PROMPT}\n$(__powerline_last_status_prompt ${last_status})${PROMPT_CHAR} "

  ## cleanup ##
  unset LAST_SEGMENT_COLOR \
        LEFT_PROMPT \
        SEGMENTS_AT_LEFT
}
