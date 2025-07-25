{
  execSh,
  ...
}:
message: identifier:
toString (execSh "echo '\"${message}\"' >&2 && read && echo '\"${identifier}\"'")
