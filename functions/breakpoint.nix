{
  execSh,
  ...
}:
message: identifier:
toString (execSh "echo '\"${message}\"' >&2 && read line; echo "''$line" && echo '\"${identifier}\"'")
