{
  execSh,
  ...
}:
prompt:
builtins.exec [
  "sh"
  "-c"
  "echo '\"'$(read -p '${prompt}' line; echo ''$line)'\"'"
]
