shorten_path() {
  local current_path=$PWD
  local trunc_path
  # for each parent path component find the shortest unique beginning
  # characters sequence. Source: https://stackoverflow.com/a/45336078
  if (( ${#current_path} > 1 )); then # root and home are exceptions and won't have paths
    # cheating here to retain ~ as home folder
    local home_path="$(getUniqueFolder $HOME)"
    trunc_path="$(getUniqueFolder $PWD)"
    [[ $current_path == "~"* ]] && current_path="~${trunc_path//${home_path}/}" || current_path="/${trunc_path}"
  fi
  echo "$current_path"
}

function getUniqueFolder() {
  local trunc_path directory test_dir test_dir_length
  local -a matching
  local -a paths
  local cur_path='/'
  paths=(${(s:/:)1})
  for directory in ${paths[@]}; do
    test_dir=''
    for (( i=0; i < ${#directory}; i++ )); do
      test_dir+="${directory:$i:1}"
      matching=("$cur_path"/"$test_dir"*/)
      if [[ ${#matching[@]} -eq 1 ]]; then
        break
      fi
    done
    trunc_path+="$test_dir/"
    cur_path+="$directory/"
  done
  echo "${trunc_path: : -1}"
}
